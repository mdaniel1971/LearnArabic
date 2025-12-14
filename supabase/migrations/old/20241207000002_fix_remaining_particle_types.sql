-- Fix remaining particles with null types
-- This handles the 7 particles that didn't match the initial patterns
-- 
-- Generated: 2024-12-07
-- 
-- IMPORTANT: This only updates surahs 97-114. Surah 1 (Al-Fatiha) is NOT modified.

-- First, let's see what particles still have null types
SELECT 
  w.text_arabic,
  w.transliteration,
  w.grammar_info,
  s.surah_number,
  v.verse_number,
  w.word_position
FROM words w
JOIN verses v ON w.verse_id = v.id
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number BETWEEN 97 AND 114
  AND grammar_info->>'part_of_speech' = 'Particle'
  AND (grammar_info->'type' IS NULL OR grammar_info->>'type' = 'null')
ORDER BY s.surah_number, v.verse_number, w.word_position;

-- Update remaining particles with additional patterns
UPDATE words
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{type}',
  CASE
    -- Additional preposition patterns
    WHEN text_arabic ~ '^كَ|^كَمَا' THEN '"preposition"'::jsonb  -- ka (like/as)
    WHEN text_arabic ~ '^رُبَّ' THEN '"preposition"'::jsonb  -- rubba (perhaps/many)
    
    -- Conjunction particles
    WHEN text_arabic ~ '^وَ|^و' THEN '"conjunction"'::jsonb  -- wa (and)
    WHEN text_arabic ~ '^فَ|^ف' THEN '"conjunction"'::jsonb  -- fa (then/so)
    WHEN text_arabic ~ '^ثُمَّ' THEN '"conjunction"'::jsonb  -- thumma (then)
    WHEN text_arabic ~ '^أَوْ' THEN '"conjunction"'::jsonb  -- aw (or)
    
    -- Accusative particles (objects of prepositions)
    WHEN text_arabic ~ '^إِيَّا' THEN '"accusative"'::jsonb  -- iyya (accusative particle)
    
    -- Result/consequence particles
    WHEN text_arabic ~ '^لِأَنَّ' THEN '"result"'::jsonb  -- li'anna (because)
    WHEN text_arabic ~ '^لِكَي' THEN '"result"'::jsonb  -- likay (so that)
    
    -- Additional conditional
    WHEN text_arabic ~ '^لَوْ' THEN '"conditional"'::jsonb  -- law (if)
    
    -- Additional emphatic
    WHEN text_arabic ~ '^لَعَلَّ' THEN '"emphatic"'::jsonb  -- la'alla (perhaps)
    
    -- Additional future
    WHEN text_arabic ~ '^لَن' THEN '"future"'::jsonb  -- lan (will not - but can be future in some contexts)
    
    -- If still no match, default to "particle" as generic type
    ELSE '"particle"'::jsonb
  END
)
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number BETWEEN 97 AND 114
  AND grammar_info->>'part_of_speech' = 'Particle'
  AND (grammar_info->'type' IS NULL OR grammar_info->>'type' = 'null');

-- Verification: Check the updated distribution
SELECT 
  grammar_info->>'type' as particle_type,
  COUNT(*) as count
FROM words
WHERE verse_id IN (
  SELECT id FROM verses 
  WHERE surah_id IN (
    SELECT id FROM surahs 
    WHERE surah_number BETWEEN 97 AND 114
  )
)
AND grammar_info->>'part_of_speech' = 'Particle'
GROUP BY particle_type
ORDER BY count DESC;

