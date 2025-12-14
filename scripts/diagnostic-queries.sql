-- Step 1: Diagnostic Analysis Queries
-- Run these in Supabase SQL Editor

-- 1. Distribution of part_of_speech values across all surahs (1, 78-114)
SELECT 
  grammar_info->>'part_of_speech' as part_of_speech,
  COUNT(*) as count
FROM words
WHERE verse_id IN (
  SELECT v.id 
  FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number IN (1, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114)
)
GROUP BY grammar_info->>'part_of_speech'
ORDER BY count DESC;

-- 2. Check specific word: هُمۡ in 78:3
SELECT 
  w.word_position,
  w.text_arabic,
  w.transliteration,
  w.translation_english,
  w.grammar_info->>'part_of_speech' as part_of_speech,
  w.grammar_info
FROM words w
JOIN verses v ON w.verse_id = v.id
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 78 AND v.verse_number = 3
ORDER BY w.word_position;

-- 3. Find potentially misclassified pronouns (words containing pronoun patterns labeled as "Noun")
SELECT 
  s.surah_number,
  v.verse_number,
  w.word_position,
  w.text_arabic,
  w.transliteration,
  w.translation_english,
  w.grammar_info->>'part_of_speech' as current_pos,
  w.grammar_info
FROM words w
JOIN verses v ON w.verse_id = v.id
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number IN (1, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114)
  AND (w.grammar_info->>'part_of_speech' = 'Noun' OR w.grammar_info->>'part_of_speech' = 'noun')
  AND (
    w.text_arabic LIKE '%هم%' OR
    w.text_arabic LIKE '%هو%' OR
    w.text_arabic LIKE '%هي%' OR
    w.text_arabic LIKE '%أنت%' OR
    w.text_arabic LIKE '%نحن%' OR
    w.text_arabic LIKE '%أنتم%' OR
    w.text_arabic LIKE '%أنتن%' OR
    w.text_arabic LIKE '%هما%'
  )
ORDER BY s.surah_number, v.verse_number, w.word_position
LIMIT 20;

-- 4. Examples of correctly classified pronouns (for comparison)
SELECT 
  s.surah_number,
  v.verse_number,
  w.word_position,
  w.text_arabic,
  w.transliteration,
  w.translation_english,
  w.grammar_info->>'part_of_speech' as part_of_speech
FROM words w
JOIN verses v ON w.verse_id = v.id
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number IN (1, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114)
  AND (w.grammar_info->>'part_of_speech' = 'Pronoun' OR w.grammar_info->>'part_of_speech' = 'pronoun')
ORDER BY s.surah_number, v.verse_number, w.word_position
LIMIT 10;

