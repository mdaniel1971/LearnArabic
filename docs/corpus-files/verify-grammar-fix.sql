-- ============================================
-- VERIFICATION QUERIES (CORRECTED)
-- Run these AFTER applying update-grammar-from-corpus.sql
-- ============================================

-- 1. Check the new distribution of parts of speech
-- Should show Particles, proper Prepositions, etc.
SELECT 
  grammar_info->>'part_of_speech' as part_of_speech,
  COUNT(*) as count
FROM words
WHERE verse_id IN (
  SELECT id FROM verses 
  WHERE surah_id IN (
    SELECT id FROM surahs 
    WHERE surah_number BETWEEN 97 AND 114
  )
)
GROUP BY grammar_info->>'part_of_speech'
ORDER BY count DESC;

-- Expected results:
-- Noun: ~279
-- Particle: ~80
-- Verb: ~93
-- preposition_noun: ~35
-- conjunction_pronoun: ~19
-- Preposition: ~6


-- 2. Check a specific word that was wrong before
-- Example: Find any prepositions or particles
SELECT 
  s.surah_number,
  v.verse_number,
  w.word_position,
  w.text_arabic,
  w.transliteration,
  w.translation_english,
  w.grammar_info->>'part_of_speech' as pos,
  w.grammar_info->'features' as features
FROM words w
JOIN verses v ON w.verse_id = v.id
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number BETWEEN 97 AND 114
  AND w.grammar_info->>'part_of_speech' = 'Particle'
ORDER BY s.surah_number, v.verse_number, w.word_position
LIMIT 10;


-- 3. Verify Al-Fatiha was NOT changed (should still have your manual data)
SELECT 
  v.verse_number,
  w.word_position,
  w.text_arabic,
  w.grammar_info
FROM words w
JOIN verses v ON w.verse_id = v.id
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1
ORDER BY v.verse_number, w.word_position
LIMIT 5;

-- Al-Fatiha should still have your detailed manual grammar_info


-- 4. Count total words affected
SELECT COUNT(*) as total_words_updated
FROM words
WHERE verse_id IN (
  SELECT id FROM verses 
  WHERE surah_id IN (
    SELECT id FROM surahs 
    WHERE surah_number BETWEEN 97 AND 114
  )
);

-- Should be around 512 words


-- 5. Check for any NULL grammar_info (shouldn't be any)
SELECT 
  s.surah_number,
  v.verse_number,
  w.word_position,
  w.text_arabic
FROM words w
JOIN verses v ON w.verse_id = v.id
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number BETWEEN 97 AND 114
  AND (w.grammar_info IS NULL OR w.grammar_info = '{}')
ORDER BY s.surah_number, v.verse_number, w.word_position;

-- Should return 0 rows


-- 6. Sample some compound words (preposition_noun, etc.)
SELECT 
  s.surah_number,
  v.verse_number,
  w.word_position,
  w.text_arabic,
  w.transliteration,
  w.grammar_info->>'part_of_speech' as pos,
  w.grammar_info->'features' as features
FROM words w
JOIN verses v ON w.verse_id = v.id
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number BETWEEN 97 AND 114
  AND w.grammar_info->>'part_of_speech' LIKE '%_%'  -- compound types
ORDER BY s.surah_number, v.verse_number, w.word_position
LIMIT 20;


-- 7. Detailed look at Surah 97 (Al-Qadr) - small surah, easy to verify
SELECT 
  v.verse_number,
  w.word_position,
  w.text_arabic,
  w.transliteration,
  w.translation_english,
  w.grammar_info->>'part_of_speech' as pos,
  w.grammar_info->'features' as features
FROM words w
JOIN verses v ON w.verse_id = v.id
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97
ORDER BY v.verse_number, w.word_position;


-- 8. Test grammar tutorial generation
-- This shows what will be sent to the LLM
SELECT 
  w.text_arabic,
  w.transliteration,
  w.translation_english,
  w.grammar_info->>'part_of_speech' as pos_for_llm,
  w.grammar_info->'features' as features_for_llm
FROM words w
JOIN verses v ON w.verse_id = v.id
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97
  AND v.verse_number = 1
ORDER BY w.word_position;

-- LLM should now get correct POS tags for generating tutorials!


-- 9. Find specific words to verify (like مِن)
-- Check if "min" (from) is now correctly tagged
SELECT 
  s.surah_number,
  v.verse_number,
  w.word_position,
  w.text_arabic,
  w.transliteration,
  w.translation_english,
  w.grammar_info->>'part_of_speech' as pos
FROM words w
JOIN verses v ON w.verse_id = v.id
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number BETWEEN 97 AND 114
  AND (
    w.text_arabic LIKE '%مِن%' OR
    w.text_arabic LIKE '%مِنَ%' OR
    w.transliteration ILIKE '%min%'
  )
ORDER BY s.surah_number, v.verse_number, w.word_position;

-- These should now show "Particle" instead of "Noun"


-- ============================================
-- COMPARISON QUERIES
-- ============================================

-- 10. Compare old vs new POS distribution
-- (Only works if you haven't run the update yet)
SELECT 
  'OLD' as version,
  grammar_info->>'part_of_speech' as pos,
  COUNT(*) as count
FROM words
WHERE verse_id IN (
  SELECT id FROM verses 
  WHERE surah_id IN (
    SELECT id FROM surahs 
    WHERE surah_number BETWEEN 97 AND 114
  )
)
GROUP BY grammar_info->>'part_of_speech'
ORDER BY count DESC;


-- ============================================
-- ROLLBACK (if needed)
-- ============================================

-- If you created a backup table before running the update:
-- 
-- UPDATE words w
-- SET grammar_info = b.grammar_info
-- FROM words_backup b
-- WHERE w.id = b.id;
-- 
-- DROP TABLE words_backup;