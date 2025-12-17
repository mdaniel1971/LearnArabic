-- Check the form number stored for الْمُسْتَقِيمَ (al-mustaqīm)
-- This word should be Form X (10), not Form VIII (8)

-- Find all instances of الْمُسْتَقِيمَ in the database
SELECT 
  w.id,
  w.text_arabic,
  w.transliteration,
  w.translation_english,
  w.grammar_info->>'part_of_speech' as part_of_speech,
  w.grammar_info->>'form' as form,
  s.surah_number,
  v.verse_number,
  w.word_position
FROM words w
JOIN verses v ON w.verse_id = v.id
JOIN surahs s ON v.surah_id = s.id
WHERE w.text_arabic LIKE '%مستقيم%'
   OR w.text_arabic LIKE '%الْمُسْتَقِيم%'
ORDER BY s.surah_number, v.verse_number, w.word_position;

-- Check if form is missing or incorrect
SELECT 
  w.id,
  w.text_arabic,
  w.grammar_info->>'form' as current_form,
  CASE 
    WHEN w.grammar_info->>'form' IS NULL THEN 'MISSING'
    WHEN w.grammar_info->>'form' != '10' AND w.grammar_info->>'form' != 'Form 10' THEN 'INCORRECT'
    ELSE 'CORRECT'
  END as status
FROM words w
WHERE w.text_arabic LIKE '%مستقيم%'
   OR w.text_arabic LIKE '%الْمُسْتَقِيم%';

