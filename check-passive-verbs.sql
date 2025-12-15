-- Quick check: See what still needs to be fixed vs what's already correct

-- Count words that still have the WRONG pattern (need fixing)
SELECT 
    'Words that NEED fixing (wrong order)' as status,
    COUNT(*) as count
FROM words
WHERE translation_english ~* '^[a-z]+ed\s+(was|were|is|are|been)([.,!?;:]*)\s*$';

-- Count words that have the CORRECT pattern (already fixed)
SELECT 
    'Words that are CORRECT (already fixed)' as status,
    COUNT(*) as count
FROM words
WHERE translation_english ~* '^(was|were|is|are|been)\s+[a-z]+ed';

-- Show examples of words that still need fixing
SELECT 
    id,
    text_arabic,
    transliteration,
    translation_english as current_translation
FROM words
WHERE translation_english ~* '^[a-z]+ed\s+(was|were|is|are|been)([.,!?;:]*)\s*$'
ORDER BY id
LIMIT 20;

