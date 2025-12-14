-- Add type field to Particle grammar_info
-- This adds the 'type' field (e.g., 'preposition', 'negative') to particles
-- so they display as "Particle: preposition" instead of just "Particle"
-- 
-- Generated: 2024-12-07
-- 
-- IMPORTANT: This only updates surahs 97-114. Surah 1 (Al-Fatiha) is NOT modified.

-- Update particles with type based on Arabic text patterns
UPDATE words
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{type}',
  CASE
    -- Prepositions
    WHEN text_arabic ~ '^م[ِنّ]|^مِن|^مِّن' THEN '"preposition"'::jsonb  -- min (from)
    WHEN text_arabic ~ '^فِي|^فِيهَا|^فِيهِ|^فِيهُن' THEN '"preposition"'::jsonb  -- fi (in)
    WHEN text_arabic ~ '^بِ|^بِهِ|^بِهَا|^بِهِم' THEN '"preposition"'::jsonb  -- bi (with/by)
    WHEN text_arabic ~ '^لِ|^لَهُ|^لَهَا|^لَهُم' THEN '"preposition"'::jsonb  -- li (to/for)
    WHEN text_arabic ~ '^عَلَى|^عَلَيْهِ|^عَلَيْهَا' THEN '"preposition"'::jsonb  -- ala (on)
    WHEN text_arabic ~ '^إِلَى|^إِلَيْهِ|^إِلَيْهَا' THEN '"preposition"'::jsonb  -- ila (to)
    WHEN text_arabic ~ '^عَنْ|^عَنْهُ|^عَنْهَا' THEN '"preposition"'::jsonb  -- an (from/about)
    WHEN text_arabic ~ '^حَتَّى|^حَتَّىٰ' THEN '"preposition"'::jsonb  -- hatta (until)
    WHEN text_arabic ~ '^مَعَ|^مَعَهُ|^مَعَهَا' THEN '"preposition"'::jsonb  -- ma'a (with)
    
    -- Conjunction particles
    WHEN text_arabic ~ '^وَ|^و' THEN '"conjunction"'::jsonb  -- wa (and)
    WHEN text_arabic ~ '^فَ|^ف' THEN '"conjunction"'::jsonb  -- fa (then/so)
    WHEN text_arabic ~ '^ثُمَّ' THEN '"conjunction"'::jsonb  -- thumma (then)
    WHEN text_arabic ~ '^أَوْ' THEN '"conjunction"'::jsonb  -- aw (or)
    
    -- Accusative particles
    WHEN text_arabic ~ '^إِيَّا' THEN '"accusative"'::jsonb  -- iyya (accusative particle)
    
    -- Result/consequence particles
    WHEN text_arabic ~ '^لِأَنَّ' THEN '"result"'::jsonb  -- li'anna (because)
    WHEN text_arabic ~ '^لِكَي' THEN '"result"'::jsonb  -- likay (so that)
    
    -- Negative particles
    WHEN text_arabic ~ '^لَا|^لَا' THEN '"negative"'::jsonb  -- la (no/not)
    WHEN text_arabic ~ '^لَمْ|^لَم' THEN '"negative"'::jsonb  -- lam (did not)
    WHEN text_arabic ~ '^لَنْ|^لَن' THEN '"negative"'::jsonb  -- lan (will not)
    WHEN text_arabic ~ '^مَا' THEN '"negative"'::jsonb  -- ma (not)
    
    -- Interrogative particles
    WHEN text_arabic ~ '^أَ|^أ' THEN '"interrogative"'::jsonb  -- a (question particle)
    WHEN text_arabic ~ '^هَل' THEN '"interrogative"'::jsonb  -- hal (is it?)
    
    -- Conditional particles
    WHEN text_arabic ~ '^إِن|^إِنَّ' THEN '"conditional"'::jsonb  -- in (if)
    WHEN text_arabic ~ '^إِذَا' THEN '"conditional"'::jsonb  -- idha (when/if)
    
    -- Emphatic particles
    WHEN text_arabic ~ '^إِنَّ' THEN '"emphatic"'::jsonb  -- inna (indeed)
    WHEN text_arabic ~ '^أَنَّ' THEN '"emphatic"'::jsonb  -- anna (that)
    
    -- Future particles
    WHEN text_arabic ~ '^سَ|^س' THEN '"future"'::jsonb  -- sa (will)
    WHEN text_arabic ~ '^سَوْفَ' THEN '"future"'::jsonb  -- sawfa (will)
    
    ELSE grammar_info->'type'
  END
)
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number BETWEEN 97 AND 114
  AND grammar_info->>'part_of_speech' = 'Particle'
  AND (grammar_info->'type' IS NULL OR grammar_info->>'type' = 'null');

-- Verification: Check how many particles now have types
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

