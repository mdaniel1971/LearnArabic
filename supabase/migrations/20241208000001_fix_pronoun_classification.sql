-- Fix Pronoun Classification from Quranic Arabic Corpus
-- This script updates grammar_info for standalone pronouns that were misclassified as "Noun"
-- Source: quran-morphology.txt from https://github.com/mustafa0x/quran-morphology
-- Generated: 2024-12-08
--
-- Total pronouns to fix: 29+ (standalone pronouns with PRON feature, not suffixes)
-- This fixes words like هُمۡ (hum - "they"), هُوَ (huwa - "he"), أَنتَ (anta - "you")
--
-- The UPDATE statements are idempotent - safe to run multiple times

-- Surah 78:3:2 - هُمْ (hum - "they")
UPDATE words
SET grammar_info = '{"part_of_speech":"Pronoun","features":["pronoun"],"person":"third","number":"plural","gender":"masculine"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 78 AND v.verse_number = 3
)
  AND word_position = 2;

-- Continue with more pronouns...
-- (This is a placeholder - the full script will be generated)

-- Verification query:
-- SELECT COUNT(*) FROM words WHERE grammar_info->>'part_of_speech' = 'Pronoun';
-- SELECT s.surah_number, v.verse_number, w.word_position, w.text_arabic, w.grammar_info->>'part_of_speech' 
-- FROM words w JOIN verses v ON w.verse_id = v.id JOIN surahs s ON v.surah_id = s.id 
-- WHERE s.surah_number = 78 AND v.verse_number = 3 AND w.word_position = 2;

