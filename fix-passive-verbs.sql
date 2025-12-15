-- Fix passive verb translations: "Destroyed were" → "were destroyed"
-- This fixes ALL instances of the pattern [past_participle] [auxiliary] → [auxiliary] [past_participle]
-- Pattern matches: "destroyed were", "created was", "revealed were", etc.

-- STEP 1: Preview what will be fixed (run this first to see what will change)
SELECT 
    id,
    text_arabic,
    transliteration,
    translation_english as current_translation
FROM words
WHERE translation_english ~* '^[a-z]+ed\s+(was|were|is|are|been)([.,!?;:]*)\s*$'
ORDER BY id;

-- STEP 2: Apply the fix to ALL matching words using regex
-- This will fix ALL instances matching the pattern [past_participle] [auxiliary]
UPDATE words
SET translation_english = 
    -- Extract auxiliary verb, capitalize it, add space, add lowercase verb, add punctuation
    INITCAP((regexp_match(translation_english, '\s+(was|were|is|are|been)', 'i'))[1]) ||
    ' ' ||
    LOWER((regexp_match(translation_english, '^([a-z]+ed)', 'i'))[1]) ||
    COALESCE((regexp_match(translation_english, '([.,!?;:]+)$'))[1], '')
WHERE translation_english ~* '^[a-z]+ed\s+(was|were|is|are|been)([.,!?;:]*)\s*$';

-- STEP 4: Verify the fix for word 3731
SELECT 
    w.id,
    w.text_arabic,
    w.transliteration,
    w.translation_english,
    s.surah_number,
    v.verse_number
FROM words w
JOIN verses v ON w.verse_id = v.id
JOIN surahs s ON v.surah_id = s.id
WHERE w.id = 3731;

-- STEP 5: Count how many were fixed
SELECT COUNT(*) as total_fixed
FROM words
WHERE translation_english ~* '^(was|were|is|are|been)\s+[a-z]+ed';

-- Clean up: Drop the function if you don't need it anymore
-- DROP FUNCTION IF EXISTS fix_passive_translation(text);

