-- Create flashcards table with SM-2 spaced repetition algorithm fields
CREATE TABLE IF NOT EXISTS flashcards (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  word_id BIGINT NOT NULL REFERENCES words(id) ON DELETE CASCADE,
  
  -- SM-2 Algorithm fields
  ease_factor DECIMAL(5, 2) NOT NULL DEFAULT 2.5, -- Ease factor (1.3 to 3.0)
  interval_days INTEGER NOT NULL DEFAULT 1, -- Days until next review
  repetitions INTEGER NOT NULL DEFAULT 0, -- Number of successful reviews
  next_review_date DATE NOT NULL DEFAULT CURRENT_DATE, -- When card is due for review
  
  -- Metadata
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL,
  
  -- Prevent duplicate flashcards for the same word by the same user
  UNIQUE(user_id, word_id)
);

-- Create review_history table to track all review sessions
CREATE TABLE IF NOT EXISTS review_history (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  flashcard_id UUID NOT NULL REFERENCES flashcards(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  
  -- Review details
  difficulty VARCHAR(10) NOT NULL CHECK (difficulty IN ('hard', 'medium', 'easy')),
  ease_factor_before DECIMAL(5, 2) NOT NULL,
  ease_factor_after DECIMAL(5, 2) NOT NULL,
  interval_before INTEGER NOT NULL,
  interval_after INTEGER NOT NULL,
  repetitions_before INTEGER NOT NULL,
  repetitions_after INTEGER NOT NULL,
  
  -- Timestamp
  reviewed_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL
);

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_flashcards_user_id ON flashcards(user_id);
CREATE INDEX IF NOT EXISTS idx_flashcards_word_id ON flashcards(word_id);
CREATE INDEX IF NOT EXISTS idx_flashcards_next_review_date ON flashcards(next_review_date);
CREATE INDEX IF NOT EXISTS idx_flashcards_user_review_date ON flashcards(user_id, next_review_date);
CREATE INDEX IF NOT EXISTS idx_review_history_flashcard_id ON review_history(flashcard_id);
CREATE INDEX IF NOT EXISTS idx_review_history_user_id ON review_history(user_id);
CREATE INDEX IF NOT EXISTS idx_review_history_reviewed_at ON review_history(reviewed_at);

-- Enable Row Level Security
ALTER TABLE flashcards ENABLE ROW LEVEL SECURITY;
ALTER TABLE review_history ENABLE ROW LEVEL SECURITY;

-- RLS Policies for flashcards
-- Users can only see their own flashcards
CREATE POLICY "Users can view their own flashcards"
  ON flashcards FOR SELECT
  USING (auth.uid() = user_id);

-- Users can only insert their own flashcards
CREATE POLICY "Users can insert their own flashcards"
  ON flashcards FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Users can only update their own flashcards
CREATE POLICY "Users can update their own flashcards"
  ON flashcards FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Users can only delete their own flashcards
CREATE POLICY "Users can delete their own flashcards"
  ON flashcards FOR DELETE
  USING (auth.uid() = user_id);

-- RLS Policies for review_history
-- Users can only see their own review history
CREATE POLICY "Users can view their own review history"
  ON review_history FOR SELECT
  USING (auth.uid() = user_id);

-- Users can only insert their own review history
CREATE POLICY "Users can insert their own review history"
  ON review_history FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = TIMEZONE('utc', NOW());
  RETURN NEW;
END;
$$ language 'plpgsql';

-- Trigger to automatically update updated_at
CREATE TRIGGER update_flashcards_updated_at
  BEFORE UPDATE ON flashcards
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

