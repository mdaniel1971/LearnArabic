-- Query to find translation of "qutila" (قُتِلَ) in the database
-- This word is a passive verb meaning "was killed" or "he was killed"

-- Search by transliteration
SELECT 
    w.id,
    w.text_arabic,
    w.transliteration,
    w.translation_english,
    s.surah_number,
    s.name_english as surah_name,
    v.verse_number,
    w.word_position,
    w.grammar_info
FROM words w
JOIN verses v ON w.verse_id = v.id
JOIN surahs s ON v.surah_id = s.id
WHERE LOWER(w.transliteration) LIKE '%qutila%'
   OR w.text_arabic LIKE '%قُتِلَ%'
ORDER BY s.surah_number, v.verse_number, w.word_position;

-- Alternative: Exact match only
-- SELECT 
--     w.id,
--     w.text_arabic,
--     w.transliteration,
--     w.translation_english,
--     s.surah_number,
--     s.name_english as surah_name,
--     v.verse_number,
--     w.word_position
-- FROM words w
-- JOIN verses v ON w.verse_id = v.id
-- JOIN surahs s ON v.surah_id = s.id
-- WHERE LOWER(w.transliteration) = 'qutila'
--    OR w.text_arabic = 'قُتِلَ'
-- ORDER BY s.surah_number, v.verse_number, w.word_position;

