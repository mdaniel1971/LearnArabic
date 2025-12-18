-- Translation Fixes
-- Generated: 2025-12-18T12:26:35.479Z
-- Total fixes: 2

BEGIN;

-- Word ID 19: The Opening (الْفَاتِحَة), Verse 6
-- "to the path" → "Path"
UPDATE words SET translation_english = 'Path' WHERE id = 19;

-- Word ID 2819: The Tidings (النَّبَأ), Verse 14
-- "the rain clouds" → "The rain clouds"
UPDATE words SET translation_english = 'The rain clouds' WHERE id = 2819;

COMMIT;

-- ROLLBACK (if needed):
-- BEGIN;
-- UPDATE words SET translation_english = 'to the path' WHERE id = 19;
-- UPDATE words SET translation_english = 'the rain clouds' WHERE id = 2819;
-- COMMIT;