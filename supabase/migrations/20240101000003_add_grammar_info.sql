-- Add grammar_info column to words table
ALTER TABLE words 
ADD COLUMN IF NOT EXISTS grammar_info JSONB;

-- Add comment explaining the grammar_info structure
COMMENT ON COLUMN words.grammar_info IS 'JSON object containing grammatical analysis: part_of_speech, case, definiteness, number, tense, person, notes';

