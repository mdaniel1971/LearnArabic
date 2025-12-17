-- Fix the form number for الْمُسْتَقِيمَ (al-mustaqīm)
-- This word is an Active Participle derived from Form X (استقام)
-- Update all instances to have form: 10

-- First, check what we're updating
SELECT 
  w.id,
  w.text_arabic,
  w.grammar_info->>'part_of_speech' as part_of_speech,
  w.grammar_info->>'form' as current_form,
  s.surah_number,
  v.verse_number,
  w.word_position
FROM words w
JOIN verses v ON w.verse_id = v.id
JOIN surahs s ON v.surah_id = s.id
WHERE (w.text_arabic LIKE '%مستقيم%' OR w.text_arabic LIKE '%الْمُسْتَقِيم%')
  AND w.grammar_info->>'part_of_speech' = 'adjective';

-- Update all instances of الْمُسْتَقِيمَ to have form: 10
UPDATE words
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '10'::jsonb
)
WHERE (text_arabic LIKE '%مستقيم%' OR text_arabic LIKE '%الْمُسْتَقِيم%')
  AND grammar_info->>'part_of_speech' = 'adjective'
  AND (grammar_info->>'form' IS NULL 
       OR grammar_info->>'form' != '10' 
       OR grammar_info->>'form' != 'Form 10');

-- Verify the update
SELECT 
  w.id,
  w.text_arabic,
  w.grammar_info->>'part_of_speech' as part_of_speech,
  w.grammar_info->>'form' as form,
  s.surah_number,
  v.verse_number,
  w.word_position
FROM words w
JOIN verses v ON w.verse_id = v.id
JOIN surahs s ON v.surah_id = s.id
WHERE (w.text_arabic LIKE '%مستقيم%' OR w.text_arabic LIKE '%الْمُسْتَقِيم%')
  AND w.grammar_info->>'part_of_speech' = 'adjective';

