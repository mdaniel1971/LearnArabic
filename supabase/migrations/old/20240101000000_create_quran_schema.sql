-- Create surahs table
CREATE TABLE IF NOT EXISTS surahs (
  id BIGSERIAL PRIMARY KEY,
  surah_number INTEGER UNIQUE NOT NULL,
  name_arabic TEXT NOT NULL,
  name_english TEXT NOT NULL,
  total_verses INTEGER NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL
);

-- Create verses table
-- Note: text_arabic should include all diacritical marks (tashkeel/vowels) for proper pronunciation
CREATE TABLE IF NOT EXISTS verses (
  id BIGSERIAL PRIMARY KEY,
  surah_id BIGINT NOT NULL REFERENCES surahs(id) ON DELETE CASCADE,
  verse_number INTEGER NOT NULL,
  text_arabic TEXT NOT NULL, -- Must include full vowelization (tashkeel)
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL,
  UNIQUE(surah_id, verse_number)
);

-- Create words table
-- Note: text_arabic should include all diacritical marks (tashkeel/vowels) for proper pronunciation
CREATE TABLE IF NOT EXISTS words (
  id BIGSERIAL PRIMARY KEY,
  verse_id BIGINT NOT NULL REFERENCES verses(id) ON DELETE CASCADE,
  word_position INTEGER NOT NULL,
  text_arabic TEXT NOT NULL, -- Must include full vowelization (tashkeel)
  transliteration TEXT,
  translation_english TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL,
  UNIQUE(verse_id, word_position)
);

-- Create indexes for foreign keys
CREATE INDEX IF NOT EXISTS idx_verses_surah_id ON verses(surah_id);
CREATE INDEX IF NOT EXISTS idx_words_verse_id ON words(verse_id);

-- Create indexes for common lookups
CREATE INDEX IF NOT EXISTS idx_surahs_surah_number ON surahs(surah_number);
CREATE INDEX IF NOT EXISTS idx_verses_surah_verse ON verses(surah_id, verse_number);
CREATE INDEX IF NOT EXISTS idx_words_verse_position ON words(verse_id, word_position);

-- Enable Row Level Security (RLS)
ALTER TABLE surahs ENABLE ROW LEVEL SECURITY;
ALTER TABLE verses ENABLE ROW LEVEL SECURITY;
ALTER TABLE words ENABLE ROW LEVEL SECURITY;

-- Create policies to allow public read access
CREATE POLICY "Allow public read access on surahs"
  ON surahs FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access on verses"
  ON verses FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access on words"
  ON words FOR SELECT
  USING (true);

-- Create function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = TIMEZONE('utc', NOW());
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create triggers to automatically update updated_at
CREATE TRIGGER update_surahs_updated_at
  BEFORE UPDATE ON surahs
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_verses_updated_at
  BEFORE UPDATE ON verses
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_words_updated_at
  BEFORE UPDATE ON words
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

