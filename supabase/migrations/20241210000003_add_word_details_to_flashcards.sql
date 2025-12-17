-- Add word details columns to flashcards table
-- This stores a snapshot of the word data at the time the flashcard was created
-- This ensures the flashcard data remains consistent even if the source word is updated

ALTER TABLE flashcards
ADD COLUMN IF NOT EXISTS word_text_arabic TEXT,
ADD COLUMN IF NOT EXISTS word_transliteration TEXT,
ADD COLUMN IF NOT EXISTS word_translation_english TEXT,
ADD COLUMN IF NOT EXISTS word_grammar_info JSONB,
ADD COLUMN IF NOT EXISTS word_details_text TEXT;

-- Add comment explaining the purpose
COMMENT ON COLUMN flashcards.word_text_arabic IS 'Snapshot of Arabic text when flashcard was created';
COMMENT ON COLUMN flashcards.word_transliteration IS 'Snapshot of transliteration when flashcard was created';
COMMENT ON COLUMN flashcards.word_translation_english IS 'Snapshot of English translation when flashcard was created';
COMMENT ON COLUMN flashcards.word_grammar_info IS 'Snapshot of grammar_info JSON when flashcard was created';
COMMENT ON COLUMN flashcards.word_details_text IS 'Formatted grammar details string for display';
