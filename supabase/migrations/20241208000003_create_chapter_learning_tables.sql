-- Chapter Learning System Tables
-- This migration creates tables for structured Arabic learning based on Haywood & Nahmad grammar chapters
-- Generated: 2024-12-08

-- Chapter tutorials cache (per-user for future customization)
CREATE TABLE IF NOT EXISTS chapter_tutorials (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  chapter_id VARCHAR(10) NOT NULL, -- e.g., 'ch1', 'ch2', etc.
  tutorial_content TEXT NOT NULL,
  language VARCHAR(10) DEFAULT 'en',
  difficulty_level VARCHAR(20) DEFAULT 'standard',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL,
  UNIQUE(user_id, chapter_id, language, difficulty_level)
);

-- Chapter quizzes cache (per-user)
CREATE TABLE IF NOT EXISTS chapter_quizzes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  chapter_id VARCHAR(10) NOT NULL,
  quiz_data JSONB NOT NULL, -- Stores the full quiz structure
  difficulty_level VARCHAR(20) DEFAULT 'standard',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL,
  UNIQUE(user_id, chapter_id, difficulty_level)
);

-- Chapter quiz attempts
CREATE TABLE IF NOT EXISTS chapter_quiz_attempts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  chapter_id VARCHAR(10) NOT NULL,
  score INTEGER NOT NULL,
  total_questions INTEGER NOT NULL,
  percentage INTEGER GENERATED ALWAYS AS (ROUND((score::NUMERIC / NULLIF(total_questions, 0) * 100))) STORED,
  answers JSONB NOT NULL, -- Stores user's answers and question details
  time_taken_seconds INTEGER,
  completed_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL
);

-- Chapter progress tracking
CREATE TABLE IF NOT EXISTS chapter_progress (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  chapter_id VARCHAR(10) NOT NULL,
  tutorial_viewed BOOLEAN DEFAULT FALSE,
  tutorial_viewed_at TIMESTAMP WITH TIME ZONE,
  quiz_attempted BOOLEAN DEFAULT FALSE,
  best_score INTEGER,
  attempts_count INTEGER DEFAULT 0,
  last_accessed TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL,
  UNIQUE(user_id, chapter_id)
);

-- Quranic vocabulary database (global, for future vocabulary features)
CREATE TABLE IF NOT EXISTS quranic_vocabulary (
  id BIGSERIAL PRIMARY KEY,
  arabic TEXT NOT NULL,
  transliteration TEXT,
  translation TEXT NOT NULL,
  root TEXT,
  grammar_tags TEXT[], -- Array of grammar tags
  chapter_relevance TEXT[], -- Array of chapter IDs this word is relevant to
  surah_references JSONB, -- Array of {surah_number, verse_number, word_position}
  difficulty_level VARCHAR(20) DEFAULT 'beginner',
  frequency_in_quran INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL
);

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_chapter_tutorials_user_id ON chapter_tutorials(user_id);
CREATE INDEX IF NOT EXISTS idx_chapter_tutorials_chapter_id ON chapter_tutorials(chapter_id);
CREATE INDEX IF NOT EXISTS idx_chapter_quizzes_user_id ON chapter_quizzes(user_id);
CREATE INDEX IF NOT EXISTS idx_chapter_quizzes_chapter_id ON chapter_quizzes(chapter_id);
CREATE INDEX IF NOT EXISTS idx_chapter_quiz_attempts_user_id ON chapter_quiz_attempts(user_id);
CREATE INDEX IF NOT EXISTS idx_chapter_quiz_attempts_chapter_id ON chapter_quiz_attempts(chapter_id);
CREATE INDEX IF NOT EXISTS idx_chapter_quiz_attempts_completed_at ON chapter_quiz_attempts(completed_at);
CREATE INDEX IF NOT EXISTS idx_chapter_progress_user_id ON chapter_progress(user_id);
CREATE INDEX IF NOT EXISTS idx_chapter_progress_chapter_id ON chapter_progress(chapter_id);
CREATE INDEX IF NOT EXISTS idx_quranic_vocabulary_arabic ON quranic_vocabulary(arabic);
CREATE INDEX IF NOT EXISTS idx_quranic_vocabulary_root ON quranic_vocabulary(root);
CREATE INDEX IF NOT EXISTS idx_quranic_vocabulary_difficulty ON quranic_vocabulary(difficulty_level);
CREATE INDEX IF NOT EXISTS idx_quranic_vocabulary_chapter_relevance ON quranic_vocabulary USING GIN(chapter_relevance);

-- Enable Row Level Security
ALTER TABLE chapter_tutorials ENABLE ROW LEVEL SECURITY;
ALTER TABLE chapter_quizzes ENABLE ROW LEVEL SECURITY;
ALTER TABLE chapter_quiz_attempts ENABLE ROW LEVEL SECURITY;
ALTER TABLE chapter_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE quranic_vocabulary ENABLE ROW LEVEL SECURITY;

-- RLS Policies for chapter_tutorials
CREATE POLICY "Users can view own chapter tutorials"
  ON chapter_tutorials FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own chapter tutorials"
  ON chapter_tutorials FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own chapter tutorials"
  ON chapter_tutorials FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- RLS Policies for chapter_quizzes
CREATE POLICY "Users can view own chapter quizzes"
  ON chapter_quizzes FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own chapter quizzes"
  ON chapter_quizzes FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own chapter quizzes"
  ON chapter_quizzes FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- RLS Policies for chapter_quiz_attempts
CREATE POLICY "Users can view own chapter quiz attempts"
  ON chapter_quiz_attempts FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own chapter quiz attempts"
  ON chapter_quiz_attempts FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- RLS Policies for chapter_progress
CREATE POLICY "Users can view own chapter progress"
  ON chapter_progress FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own chapter progress"
  ON chapter_progress FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own chapter progress"
  ON chapter_progress FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- RLS Policies for quranic_vocabulary (public read, authenticated write)
CREATE POLICY "Anyone can view quranic vocabulary"
  ON quranic_vocabulary FOR SELECT
  USING (true);

CREATE POLICY "Authenticated users can insert quranic vocabulary"
  ON quranic_vocabulary FOR INSERT
  WITH CHECK (auth.role() = 'authenticated');

CREATE POLICY "Authenticated users can update quranic vocabulary"
  ON quranic_vocabulary FOR UPDATE
  USING (auth.role() = 'authenticated');

-- Create function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_chapter_learning_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = TIMEZONE('utc', NOW());
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create triggers to automatically update updated_at
CREATE TRIGGER update_chapter_tutorials_updated_at
  BEFORE UPDATE ON chapter_tutorials
  FOR EACH ROW
  EXECUTE FUNCTION update_chapter_learning_updated_at();

CREATE TRIGGER update_chapter_quizzes_updated_at
  BEFORE UPDATE ON chapter_quizzes
  FOR EACH ROW
  EXECUTE FUNCTION update_chapter_learning_updated_at();

CREATE TRIGGER update_chapter_progress_updated_at
  BEFORE UPDATE ON chapter_progress
  FOR EACH ROW
  EXECUTE FUNCTION update_chapter_learning_updated_at();

CREATE TRIGGER update_quranic_vocabulary_updated_at
  BEFORE UPDATE ON quranic_vocabulary
  FOR EACH ROW
  EXECUTE FUNCTION update_chapter_learning_updated_at();

