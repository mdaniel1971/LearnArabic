-- Quiz attempts table
CREATE TABLE IF NOT EXISTS quiz_attempts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  surah_id BIGINT REFERENCES surahs(id) ON DELETE CASCADE,
  score INTEGER NOT NULL,
  total_questions INTEGER DEFAULT 10,
  completed_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

-- Individual quiz questions and answers
CREATE TABLE IF NOT EXISTS quiz_questions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  attempt_id UUID REFERENCES quiz_attempts(id) ON DELETE CASCADE,
  question_text TEXT NOT NULL,
  question_type VARCHAR(50) NOT NULL, -- 'multiple_choice' or 'fill_blank'
  correct_answer TEXT NOT NULL,
  user_answer TEXT,
  is_correct BOOLEAN NOT NULL,
  word_id BIGINT REFERENCES words(id) ON DELETE SET NULL,
  grammar_point TEXT,
  options JSONB, -- stores array of options for multiple choice
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

-- Pre-generated quiz questions bank (one set per surah)
CREATE TABLE IF NOT EXISTS quiz_bank (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  surah_id BIGINT REFERENCES surahs(id) ON DELETE CASCADE,
  question_text TEXT NOT NULL,
  question_type VARCHAR(50) NOT NULL,
  correct_answer TEXT NOT NULL,
  word_id BIGINT REFERENCES words(id) ON DELETE SET NULL,
  grammar_point TEXT,
  options JSONB, -- array of 4 options for multiple choice
  explanation TEXT, -- why this answer is correct
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
  UNIQUE(surah_id, question_text) -- prevent duplicate questions
);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_quiz_attempts_user_id ON quiz_attempts(user_id);
CREATE INDEX IF NOT EXISTS idx_quiz_attempts_surah_id ON quiz_attempts(surah_id);
CREATE INDEX IF NOT EXISTS idx_quiz_questions_attempt_id ON quiz_questions(attempt_id);
CREATE INDEX IF NOT EXISTS idx_quiz_bank_surah_id ON quiz_bank(surah_id);

-- Row Level Security
ALTER TABLE quiz_attempts ENABLE ROW LEVEL SECURITY;
ALTER TABLE quiz_questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE quiz_bank ENABLE ROW LEVEL SECURITY;

-- Policies for quiz_attempts
CREATE POLICY "Users can view own quiz attempts"
  ON quiz_attempts FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own quiz attempts"
  ON quiz_attempts FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Policies for quiz_questions
CREATE POLICY "Users can view own quiz questions"
  ON quiz_questions FOR SELECT
  USING (
    attempt_id IN (
      SELECT id FROM quiz_attempts WHERE user_id = auth.uid()
    )
  );

CREATE POLICY "Users can insert own quiz questions"
  ON quiz_questions FOR INSERT
  WITH CHECK (
    attempt_id IN (
      SELECT id FROM quiz_attempts WHERE user_id = auth.uid()
    )
  );

-- Policies for quiz_bank (everyone can read, authenticated users can insert/delete)
CREATE POLICY "Anyone can view quiz bank"
  ON quiz_bank FOR SELECT
  USING (true);

CREATE POLICY "Authenticated users can insert quiz bank"
  ON quiz_bank FOR INSERT
  WITH CHECK (auth.role() = 'authenticated');

CREATE POLICY "Authenticated users can delete quiz bank"
  ON quiz_bank FOR DELETE
  USING (auth.role() = 'authenticated');

