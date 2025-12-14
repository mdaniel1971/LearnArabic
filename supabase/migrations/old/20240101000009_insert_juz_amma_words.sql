-- Insert word-by-word breakdown of Juz Amma (Surahs 97-114)
-- Each word includes full vowelization (tashkeel) for proper pronunciation
-- Arabic text uses standard encoding (U+0600-U+06FF) from quran-json CDN
-- Transliterations and translations from @kmaslesa package, formatted to match Al-Fatiha's style

-- Surah 97

-- Verse 1
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'إِنَّآ', 'Innā', 'Indeed, We'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'أَنزَلۡنَٰهُ', 'Anzalnāhu', 'Revealed it'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'فِي', 'Fī', 'In'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'لَيۡلَةِ', 'Laylati', 'Night'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'ٱلۡقَدۡرِ', 'Lqadri', 'Power'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 2
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَمَآ', 'Wamā', 'And what'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'أَدۡرَىٰكَ', 'Adrāka', 'Can make you know'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'مَا', 'Mā', 'What'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'لَيۡلَةُ', 'Laylatu', 'Night'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'ٱلۡقَدۡرِ', 'Lqadri', 'Power'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 3
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'لَيۡلَةُ', 'Laylatu', 'Night'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلۡقَدۡرِ', 'Lqadri', 'Power'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'خَيۡرٞ', 'Khayrun', 'Better'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'مِّنۡ', 'Min', 'Than'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'أَلۡفِ', 'Alfi', 'A thousand'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'شَهۡرٖ', 'Shahrin', 'Month'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 4
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'تَنَزَّلُ', 'Tanazzalu', 'Descend'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلۡمَلَـٰٓئِكَةُ', 'Lmalāikatu', 'The Angels'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'وَٱلرُّوحُ', 'Walrūḥu', 'And the Spirit'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'فِيهَا', 'Fīhā', 'Therein'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'بِإِذۡنِ', 'Biidh''ni', 'By  permission'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'رَبِّهِم', 'Rabbihim', 'Their Lord'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 7, 'مِّن', 'Min', 'For'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 8, 'كُلِّ', 'Kulli', 'Every'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 9, 'أَمۡرٖ', 'Amrin', 'Affair'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 5
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'سَلَٰمٌ', 'Salāmun', 'Peace'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'هِيَ', 'Hiya', 'It'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'حَتَّىٰ', 'Ḥattā', 'Until'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'مَطۡلَعِ', 'Maṭlaʿi', 'Emergence'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'ٱلۡفَجۡرِ', 'Lfajri', 'The dawn'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 97 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Surah 98

-- Verse 1
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'لَمۡ', 'Lam', 'Not'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'يَكُنِ', 'Yakuni', 'Were'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ٱلَّذِينَ', 'Alladhīna', 'Those who'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'كَفَرُواْ', 'Kafarū', 'Disbelieved'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'مِنۡ', 'Min', 'From'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'أَهۡلِ', 'Ahli', 'People'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 7, 'ٱلۡكِتَٰبِ', 'Lkitābi', 'Of the Book'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 8, 'وَٱلۡمُشۡرِكِينَ', 'Walmush''rikīna', 'And the polytheists'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 9, 'مُنفَكِّينَ', 'Munfakkīna', 'To be abandoned'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 10, 'حَتَّىٰ', 'Ḥattā', 'Until'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 11, 'تَأۡتِيَهُمُ', 'Tatiyahumu', 'Comes to them'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 12, 'ٱلۡبَيِّنَةُ', 'Lbayinatu', 'The clear evidence'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 2
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'رَسُولٞ', 'Rasūlun', 'A Messenger'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'مِّنَ', 'Mina', 'From'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ٱللَّهِ', 'Llahi', 'Allah'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'يَتۡلُواْ', 'Yatlū', 'Reciting'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'صُحُفٗا', 'Ṣuḥufan', 'Pages'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'مُّطَهَّرَةٗ', 'Muṭahharatan', 'Purified'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 3
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'فِيهَا', 'Fīhā', 'Wherein'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'كُتُبٞ', 'Kutubun', 'Writings'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'قَيِّمَةٞ', 'Qayyimatun', 'Correct'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 4
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَمَا', 'Wamā', 'And not'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'تَفَرَّقَ', 'Tafarraqa', 'Became divided'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ٱلَّذِينَ', 'Alladhīna', 'Those who'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'أُوتُواْ', 'Ūtū', 'Were given'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'ٱلۡكِتَٰبَ', 'Lkitāba', 'The Book'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'إِلَّا', 'Illā', 'Until'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 7, 'مِنۢ', 'Min', 'From'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 8, 'بَعۡدِ', 'Baʿdi', 'After'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 9, 'مَا', 'Mā', 'What'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 10, 'جَآءَتۡهُمُ', 'Jāathumu', 'Came  them'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 11, 'ٱلۡبَيِّنَةُ', 'Lbayinatu', 'The clear evidence'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 5
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَمَآ', 'Wamā', 'And not'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'أُمِرُوٓاْ', 'Umirū', 'They were commanded'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'إِلَّا', 'Illā', 'Except'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'لِيَعۡبُدُواْ', 'Liyaʿbudū', 'To worship'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'ٱللَّهَ', 'Llaha', 'Allah'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'مُخۡلِصِينَ', 'Mukh''liṣīna', 'Sincere'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 7, 'لَهُ', 'Lahu', 'To Him'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 8, 'ٱلدِّينَ', 'Ldīna', 'The religion'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 9, 'حُنَفَآءَ', 'Ḥunafāa', 'Upright'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 10, 'وَيُقِيمُواْ', 'Wayuqīmū', 'And to establish'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 11, 'ٱلصَّلَوٰةَ', 'Lṣalata', 'The prayer'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 12, 'وَيُؤۡتُواْ', 'Wayu''tū', 'And to give'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 13, 'ٱلزَّكَوٰةَۚ', 'Lzakata', 'The zakah'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 14, 'وَذَٰلِكَ', 'Wadhālika', 'And that'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 15, 'دِينُ', 'Dīnu', 'Religion'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 16, 'ٱلۡقَيِّمَةِ', 'Lqayimati', 'The correct'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 6
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'إِنَّ', 'Inna', 'Indeed'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلَّذِينَ', 'Alladhīna', 'Those who'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'كَفَرُواْ', 'Kafarū', 'Disbelieve'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'مِنۡ', 'Min', 'From'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'أَهۡلِ', 'Ahli', 'People'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'ٱلۡكِتَٰبِ', 'Lkitābi', 'The Book'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 7, 'وَٱلۡمُشۡرِكِينَ', 'Walmush''rikīna', 'And the polytheists'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 8, 'فِي', 'Fī', 'In'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 9, 'نَارِ', 'Nāri', 'Fire'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 10, 'جَهَنَّمَ', 'Jahannama', 'Hell'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 11, 'خَٰلِدِينَ', 'Khālidīna', 'Abiding eternally'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 12, 'فِيهَآۚ', 'Fīhā', 'Therein'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 13, 'أُوْلَـٰٓئِكَ', 'Ulāika', 'Those'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 14, 'هُمۡ', 'Hum', 'They'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 15, 'شَرُّ', 'Sharru', 'Worst'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 16, 'ٱلۡبَرِيَّةِ', 'Lbariyati', 'The creatures'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 7
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'إِنَّ', 'Inna', 'Indeed'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلَّذِينَ', 'Alladhīna', 'Those who'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ءَامَنُواْ', 'Āmanū', 'Believe'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'وَعَمِلُواْ', 'Waʿamilū', 'And do'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'ٱلصَّـٰلِحَٰتِ', 'Lṣāliḥāti', 'Righteous deeds'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'أُوْلَـٰٓئِكَ', 'Ulāika', 'Those'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 7, 'هُمۡ', 'Hum', 'They'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 8, 'خَيۡرُ', 'Khayru', 'Best'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 9, 'ٱلۡبَرِيَّةِ', 'Lbariyati', 'The creatures'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 8
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'جَزَآؤُهُمۡ', 'Jazāuhum', 'Their reward'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'عِندَ', 'ʿinda', 'With'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'رَبِّهِمۡ', 'Rabbihim', 'Their Lord'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'جَنَّـٰتُ', 'Jannātu', 'Gardens'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'عَدۡنٖ', 'ʿadnin', 'Eternity'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'تَجۡرِي', 'Tajrī', 'Flow'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 7, 'مِن', 'Min', 'From'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 8, 'تَحۡتِهَا', 'Taḥtihā', 'Underneath them'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 9, 'ٱلۡأَنۡهَٰرُ', 'Lanhāru', 'The rivers'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 10, 'خَٰلِدِينَ', 'Khālidīna', 'Will abide'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 11, 'فِيهَآ', 'Fīhā', 'Therein'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 12, 'أَبَدٗاۖ', 'Abadan', 'Forever'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 13, 'رَّضِيَ', 'Raḍiya', 'Pleased'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 14, 'ٱللَّهُ', 'Llahu', 'Allah'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 15, 'عَنۡهُمۡ', 'ʿanhum', 'With them'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 16, 'وَرَضُواْ', 'Waraḍū', 'And they  pleased'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 17, 'عَنۡهُۚ', 'ʿanhu', 'With Him'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 18, 'ذَٰلِكَ', 'Dhālika', 'That'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 19, 'لِمَنۡ', 'Liman', 'For whoever'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 20, 'خَشِيَ', 'Khashiya', 'Feared'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 21, 'رَبَّهُۥ', 'Rabbahu', 'His Lord'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 98 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Surah 99

-- Verse 1
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'إِذَا', 'Idhā', 'When'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'زُلۡزِلَتِ', 'Zul''zilati', 'Is shaken'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ٱلۡأَرۡضُ', 'Larḍu', 'The earth'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'زِلۡزَالَهَا', 'Zil''zālahā', 'Its earthquake'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 2
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَأَخۡرَجَتِ', 'Waakhrajati', 'And brings forth'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلۡأَرۡضُ', 'Larḍu', 'The earth'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'أَثۡقَالَهَا', 'Athqālahā', 'Its burdens'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 3
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَقَالَ', 'Waqāla', 'And says'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلۡإِنسَٰنُ', 'Linsānu', 'Man'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'مَا', 'Mā', 'What'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'لَهَا', 'Lahā', 'With it'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 4
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'يَوۡمَئِذٖ', 'Yawmaidhin', 'That Day'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'تُحَدِّثُ', 'Tuḥaddithu', 'It will report'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'أَخۡبَارَهَا', 'Akhbārahā', 'Its news'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 5
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'بِأَنَّ', 'Bianna', 'Because'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'رَبَّكَ', 'Rabbaka', 'Your Lord'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'أَوۡحَىٰ', 'Awḥā', 'Inspired'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'لَهَا', 'Lahā', '[to] it'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 6
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'يَوۡمَئِذٖ', 'Yawmaidhin', 'That Day'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'يَصۡدُرُ', 'Yaṣduru', 'Will proceed'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ٱلنَّاسُ', 'Lnāsu', 'The mankind'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'أَشۡتَاتٗا', 'Ashtātan', 'Scattered groups'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'لِّيُرَوۡاْ', 'Liyuraw', 'To be shown'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'أَعۡمَٰلَهُمۡ', 'Aʿmālahum', 'Their deeds'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 7
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'فَمَن', 'Faman', 'So whoever'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'يَعۡمَلۡ', 'Yaʿmal', 'Does'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'مِثۡقَالَ', 'Mith''qāla', 'Weight'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'ذَرَّةٍ', 'Dharratin', 'An atom'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'خَيۡرٗا', 'Khayran', 'Good'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'يَرَهُۥ', 'Yarahu', 'Will see it'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 8
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَمَن', 'Waman', 'And whoever'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'يَعۡمَلۡ', 'Yaʿmal', 'Does'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'مِثۡقَالَ', 'Mith''qāla', 'Weight'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'ذَرَّةٖ', 'Dharratin', 'An atom'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'شَرّٗا', 'Sharran', 'Evil'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'يَرَهُۥ', 'Yarahu', 'Will see it'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 99 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Surah 100

-- Verse 1
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَٱلۡعَٰدِيَٰتِ', 'Walʿādiyāti', 'By the racers'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ضَبۡحٗا', 'Ḍabḥan', 'Panting'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 2
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'فَٱلۡمُورِيَٰتِ', 'Falmūriyāti', 'And the producers of sparks'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'قَدۡحٗا', 'Qadḥan', 'Striking'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 3
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'فَٱلۡمُغِيرَٰتِ', 'Falmughīrāti', 'And the chargers'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'صُبۡحٗا', 'Ṣub''ḥan', 'Dawn'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 4
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'فَأَثَرۡنَ', 'Faatharna', 'Then raise'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'بِهِۦ', 'Bihi', 'Thereby'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'نَقۡعٗا', 'Naqʿan', 'Dust'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 5
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'فَوَسَطۡنَ', 'Fawasaṭna', 'Then penetrate  center'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'بِهِۦ', 'Bihi', 'Thereby'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'جَمۡعًا', 'Jamʿan', 'Collectively'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 6
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'إِنَّ', 'Inna', 'Indeed'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلۡإِنسَٰنَ', 'Linsāna', 'Mankind'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'لِرَبِّهِۦ', 'Lirabbihi', 'To his Lord'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'لَكَنُودٞ', 'Lakanūdun', 'Surely ungrateful'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 7
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَإِنَّهُۥ', 'Wainnahu', 'And indeed, he'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'عَلَىٰ', 'ʿalā', 'On'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ذَٰلِكَ', 'Dhālika', 'That'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'لَشَهِيدٞ', 'Lashahīdun', 'Surely  a witness'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 8
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَإِنَّهُۥ', 'Wainnahu', 'And indeed he'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'لِحُبِّ', 'Liḥubbi', 'In  love'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ٱلۡخَيۡرِ', 'Lkhayri', 'Wealth'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'لَشَدِيدٌ', 'Lashadīdun', 'Surely intense'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 9
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, '۞أَفَلَا', 'Afalā', 'But does not'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 9
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'يَعۡلَمُ', 'Yaʿlamu', 'He know'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 9
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'إِذَا', 'Idhā', 'When'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 9
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'بُعۡثِرَ', 'Buʿ''thira', 'Will be scattered'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 9
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'مَا', 'Mā', 'What'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 9
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'فِي', 'Fī', 'In'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 9
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 7, 'ٱلۡقُبُورِ', 'Lqubūri', 'The graves'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 9
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 10
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَحُصِّلَ', 'Waḥuṣṣila', 'And is made apparent'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 10
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'مَا', 'Mā', 'What'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 10
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'فِي', 'Fī', 'In'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 10
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'ٱلصُّدُورِ', 'Lṣudūri', 'The breasts'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 10
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 11
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'إِنَّ', 'Inna', 'Indeed'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 11
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'رَبَّهُم', 'Rabbahum', 'Their Lord'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 11
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'بِهِمۡ', 'Bihim', 'About them'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 11
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'يَوۡمَئِذٖ', 'Yawmaidhin', 'That Day'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 11
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'لَّخَبِيرُۢ', 'Lakhabīrun', 'Surely All-Aware'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 100 AND v.verse_number = 11
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Surah 101

-- Verse 1
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'ٱلۡقَارِعَةُ', 'Alqāriʿatu', 'The Striking Calamity'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 2
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'مَا', 'Mā', 'What'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلۡقَارِعَةُ', 'Lqāriʿatu', 'The Striking Calamity'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 3
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَمَآ', 'Wamā', 'And what'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'أَدۡرَىٰكَ', 'Adrāka', 'Will make you know'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'مَا', 'Mā', 'What'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'ٱلۡقَارِعَةُ', 'Lqāriʿatu', 'The Striking Calamity'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 4
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'يَوۡمَ', 'Yawma', 'Day'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'يَكُونُ', 'Yakūnu', 'Will be'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ٱلنَّاسُ', 'Lnāsu', 'The mankind'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'كَٱلۡفَرَاشِ', 'Kalfarāshi', 'Like moths'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'ٱلۡمَبۡثُوثِ', 'Lmabthūthi', 'Scattered'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 5
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَتَكُونُ', 'Watakūnu', 'And will be'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلۡجِبَالُ', 'Ljibālu', 'The mountains'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'كَٱلۡعِهۡنِ', 'Kalʿih''ni', 'Like wool'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'ٱلۡمَنفُوشِ', 'Lmanfūshi', 'Fluffed up'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 6
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'فَأَمَّا', 'Faammā', 'Then as for'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'مَن', 'Man', 'Whose'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ثَقُلَتۡ', 'Thaqulat', 'Heavy'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'مَوَٰزِينُهُۥ', 'Mawāzīnuhu', 'His scales'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 7
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'فَهُوَ', 'Fahuwa', 'Then he'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'فِي', 'Fī', 'In'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'عِيشَةٖ', 'ʿīshatin', 'A life'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'رَّاضِيَةٖ', 'Rāḍiyatin', 'Pleasant'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 8
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَأَمَّا', 'Waammā', 'But as for'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'مَنۡ', 'Man', 'Whose'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'خَفَّتۡ', 'Khaffat', 'Light'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'مَوَٰزِينُهُۥ', 'Mawāzīnuhu', 'His scales'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 9
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'فَأُمُّهُۥ', 'Faummuhu', 'His abode'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 9
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'هَاوِيَةٞ', 'Hāwiyatun', 'Pit'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 9
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 10
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَمَآ', 'Wamā', 'And what'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 10
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'أَدۡرَىٰكَ', 'Adrāka', 'Will make you know'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 10
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'مَا', 'Mā', 'What'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 10
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'هِيَهۡ', 'Hiyah', 'It is'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 10
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 11
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'نَارٌ', 'Nārun', 'A Fire'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 11
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'حَامِيَةُۢ', 'Ḥāmiyatun', 'Intensely hot'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 101 AND v.verse_number = 11
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Surah 102

-- Verse 1
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'أَلۡهَىٰكُمُ', 'Alhākumu', 'Diverts you'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلتَّكَاثُرُ', 'Ltakāthuru', 'The competition to increase'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 2
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'حَتَّىٰ', 'Ḥattā', 'Until'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'زُرۡتُمُ', 'Zur''tumu', 'You visit'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ٱلۡمَقَابِرَ', 'Lmaqābira', 'The graves'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 3
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'كَلَّا', 'Kallā', 'Nay'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'سَوۡفَ', 'Sawfa', 'Soon'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'تَعۡلَمُونَ', 'Taʿlamūna', 'You will know'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 4
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'ثُمَّ', 'Thumma', 'Then'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'كَلَّا', 'Kallā', 'Nay'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'سَوۡفَ', 'Sawfa', 'Soon'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'تَعۡلَمُونَ', 'Taʿlamūna', 'You will know'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 5
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'كَلَّا', 'Kallā', 'Nay'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'لَوۡ', 'Law', 'If'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'تَعۡلَمُونَ', 'Taʿlamūna', 'You know'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'عِلۡمَ', 'ʿil''ma', 'A knowledge'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'ٱلۡيَقِينِ', 'Lyaqīni', 'Certainty'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 6
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'لَتَرَوُنَّ', 'Latarawunna', 'Surely you will see'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلۡجَحِيمَ', 'Ljaḥīma', 'The Hellfire'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 7
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'ثُمَّ', 'Thumma', 'Then'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'لَتَرَوُنَّهَا', 'Latarawunnahā', 'Surely you will see it'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'عَيۡنَ', 'ʿayna', 'Eye'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'ٱلۡيَقِينِ', 'Lyaqīni', 'Certainty'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 8
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'ثُمَّ', 'Thumma', 'Then'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'لَتُسۡـَٔلُنَّ', 'Latus''alunna', 'Surely you will be asked'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'يَوۡمَئِذٍ', 'Yawmaidhin', 'That Day'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'عَنِ', 'ʿani', 'About'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'ٱلنَّعِيمِ', 'Lnaʿīmi', 'The pleasures'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 102 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Surah 103

-- Verse 1
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَٱلۡعَصۡرِ', 'Walʿaṣri', 'By the time'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 103 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 2
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'إِنَّ', 'Inna', 'Indeed'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 103 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلۡإِنسَٰنَ', 'Linsāna', 'Mankind'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 103 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'لَفِي', 'Lafī', 'Surely, in'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 103 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'خُسۡرٍ', 'Khus''rin', 'Loss'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 103 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 3
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'إِلَّا', 'Illā', 'Except'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 103 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلَّذِينَ', 'Alladhīna', 'Those who'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 103 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ءَامَنُواْ', 'Āmanū', 'Believe'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 103 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'وَعَمِلُواْ', 'Waʿamilū', 'And do'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 103 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'ٱلصَّـٰلِحَٰتِ', 'Lṣāliḥāti', 'Righteous deeds'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 103 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'وَتَوَاصَوۡاْ', 'Watawāṣaw', 'And enjoin'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 103 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 7, 'بِٱلۡحَقِّ', 'Bilḥaqi', 'To the truth'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 103 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 8, 'وَتَوَاصَوۡاْ', 'Watawāṣaw', 'And enjoin'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 103 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 9, 'بِٱلصَّبۡرِ', 'Bilṣabri', 'To [the] patience'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 103 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Surah 104

-- Verse 1
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَيۡلٞ', 'Waylun', 'Woe'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'لِّكُلِّ', 'Likulli', 'To every'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'هُمَزَةٖ', 'Humazatin', 'Slanderer'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'لُّمَزَةٍ', 'Lumazatin', 'Backbiter'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 2
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'ٱلَّذِي', 'Alladhī', 'The one who'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'جَمَعَ', 'Jamaʿa', 'Collects'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'مَالٗا', 'Mālan', 'Wealth'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'وَعَدَّدَهُۥ', 'Waʿaddadahu', 'And counts it'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 3
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'يَحۡسَبُ', 'Yaḥsabu', 'Thinking'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'أَنَّ', 'Anna', 'That'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'مَالَهُۥٓ', 'Mālahu', 'His wealth'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'أَخۡلَدَهُۥ', 'Akhladahu', 'Will make him immortal'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 4
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'كَلَّاۖ', 'Kallā', 'Nay'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'لَيُنۢبَذَنَّ', 'Layunbadhanna', 'Surely he will be thrown'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'فِي', 'Fī', 'In'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'ٱلۡحُطَمَةِ', 'Lḥuṭamati', 'The Crusher'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 5
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَمَآ', 'Wamā', 'And what'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'أَدۡرَىٰكَ', 'Adrāka', 'Will make you know'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'مَا', 'Mā', 'What'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'ٱلۡحُطَمَةُ', 'Lḥuṭamatu', 'The Crusher'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 6
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'نَارُ', 'Nāru', 'A Fire'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱللَّهِ', 'Llahi', 'Allah'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ٱلۡمُوقَدَةُ', 'Lmūqadatu', 'Kindled'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 7
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'ٱلَّتِي', 'Allatī', 'Which'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'تَطَّلِعُ', 'Taṭṭaliʿu', 'Mounts up'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'عَلَى', 'ʿalā', 'To'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'ٱلۡأَفۡـِٔدَةِ', 'Lafidati', 'The hearts'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 8
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'إِنَّهَا', 'Innahā', 'Indeed, it'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'عَلَيۡهِم', 'ʿalayhim', 'Upon them'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'مُّؤۡصَدَةٞ', 'Mu''ṣadatun', 'Closed over'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 8
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 9
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'فِي', 'Fī', 'In'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 9
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'عَمَدٖ', 'ʿamadin', 'Columns'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 9
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'مُّمَدَّدَةِۭ', 'Mumaddadatin', 'Extended'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 104 AND v.verse_number = 9
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Surah 105

-- Verse 1
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'أَلَمۡ', 'Alam', 'Have not'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'تَرَ', 'Tara', 'You seen'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'كَيۡفَ', 'Kayfa', 'How'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'فَعَلَ', 'Faʿala', 'Dealt'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'رَبُّكَ', 'Rabbuka', 'Your Lord'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'بِأَصۡحَٰبِ', 'Biaṣḥābi', 'With  Companions'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 7, 'ٱلۡفِيلِ', 'Lfīli', 'Elephant'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 2
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'أَلَمۡ', 'Alam', 'Did not'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'يَجۡعَلۡ', 'Yajʿal', 'He make'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'كَيۡدَهُمۡ', 'Kaydahum', 'Their plan'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'فِي', 'Fī', 'Go'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'تَضۡلِيلٖ', 'Taḍlīlin', 'Astray'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 3
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَأَرۡسَلَ', 'Waarsala', 'And He sent'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'عَلَيۡهِمۡ', 'ʿalayhim', 'Against them'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'طَيۡرًا', 'Ṭayran', 'Birds'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'أَبَابِيلَ', 'Abābīla', 'Flocks'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 4
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'تَرۡمِيهِم', 'Tarmīhim', 'Striking them'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'بِحِجَارَةٖ', 'Biḥijāratin', 'With stones'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'مِّن', 'Min', 'Of'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'سِجِّيلٖ', 'Sijjīlin', 'Baked clay'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 5
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'فَجَعَلَهُمۡ', 'Fajaʿalahum', 'Then He made them'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'كَعَصۡفٖ', 'Kaʿaṣfin', 'Like straw'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'مَّأۡكُولِۭ', 'Makūlin', 'Eaten up'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 105 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Surah 106

-- Verse 1
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'لِإِيلَٰفِ', 'Liīlāfi', 'For  familiarity'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 106 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'قُرَيۡشٍ', 'Qurayshin', 'Quraish'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 106 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 2
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'إِۦلَٰفِهِمۡ', 'Īlāfihim', 'Their familiarity'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 106 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'رِحۡلَةَ', 'Riḥ''lata', 'Journey'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 106 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ٱلشِّتَآءِ', 'Lshitāi', 'Winter'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 106 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'وَٱلصَّيۡفِ', 'Walṣayfi', 'And summer'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 106 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 3
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'فَلۡيَعۡبُدُواْ', 'Falyaʿbudū', 'So let them worship'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 106 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'رَبَّ', 'Rabba', 'Lord'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 106 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'هَٰذَا', 'Hādhā', 'This'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 106 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'ٱلۡبَيۡتِ', 'Lbayti', 'House'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 106 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 4
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'ٱلَّذِيٓ', 'Alladhī', 'The One Who'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 106 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'أَطۡعَمَهُم', 'Aṭʿamahum', 'Feeds them'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 106 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'مِّن', 'Min', '[from]'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 106 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'جُوعٖ', 'Jūʿin', 'Hunger'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 106 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'وَءَامَنَهُم', 'Waāmanahum', 'And gives them security'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 106 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'مِّنۡ', 'Min', 'From'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 106 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 7, 'خَوۡفِۭ', 'Khawfin', 'Fear'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 106 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Surah 107

-- Verse 1
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'أَرَءَيۡتَ', 'Araayta', 'Have you seen'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلَّذِي', 'Alladhī', 'The one who'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'يُكَذِّبُ', 'Yukadhibu', 'Denies'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'بِٱلدِّينِ', 'Bildīni', 'The Judgment'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 2
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'فَذَٰلِكَ', 'Fadhālika', 'Then that'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلَّذِي', 'Alladhī', 'The one who'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'يَدُعُّ', 'Yaduʿʿu', 'Repulses'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'ٱلۡيَتِيمَ', 'Lyatīma', 'The orphan'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 3
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَلَا', 'Walā', 'And  not'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'يَحُضُّ', 'Yaḥuḍḍu', 'Feel the urge'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'عَلَىٰ', 'ʿalā', 'To'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'طَعَامِ', 'Ṭaʿāmi', 'Feed'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'ٱلۡمِسۡكِينِ', 'Lmis''kīni', 'The poor'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 4
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'فَوَيۡلٞ', 'Fawaylun', 'So woe'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'لِّلۡمُصَلِّينَ', 'Lil''muṣallīna', 'To those who pray'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 5
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'ٱلَّذِينَ', 'Alladhīna', 'Those who'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'هُمۡ', 'Hum', '[they]'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'عَن', 'ʿan', 'About'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'صَلَاتِهِمۡ', 'Ṣalātihim', 'Their prayers'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'سَاهُونَ', 'Sāhūna', 'Neglectful'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 6
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'ٱلَّذِينَ', 'Alladhīna', 'Those who'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'هُمۡ', 'Hum', '[they]'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'يُرَآءُونَ', 'Yurāūna', 'Make show'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 7
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَيَمۡنَعُونَ', 'Wayamnaʿūna', 'And they deny'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلۡمَاعُونَ', 'Lmāʿūna', '[the] small kindnesses'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 107 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Surah 108

-- Verse 1
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'إِنَّآ', 'Innā', 'Indeed, We'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 108 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'أَعۡطَيۡنَٰكَ', 'Aʿṭaynāka', 'We have given you'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 108 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ٱلۡكَوۡثَرَ', 'Lkawthara', 'Al-Kauthar'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 108 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 2
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'فَصَلِّ', 'Faṣalli', 'So pray'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 108 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'لِرَبِّكَ', 'Lirabbika', 'To your Lord'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 108 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'وَٱنۡحَرۡ', 'Wain''ḥar', 'And sacrifice'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 108 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 3
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'إِنَّ', 'Inna', 'Indeed'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 108 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'شَانِئَكَ', 'Shāniaka', 'Your enemy'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 108 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'هُوَ', 'Huwa', 'He'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 108 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'ٱلۡأَبۡتَرُ', 'Labtaru', 'The one cut off'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 108 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Surah 109

-- Verse 1
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'قُلۡ', 'Qul', 'Say'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'يَـٰٓأَيُّهَا', 'Yāayyuhā', 'O'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ٱلۡكَٰفِرُونَ', 'Lkāfirūna', 'Disbelievers'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 2
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'لَآ', 'Lā', 'Not'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'أَعۡبُدُ', 'Aʿbudu', 'I worship'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'مَا', 'Mā', 'What'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'تَعۡبُدُونَ', 'Taʿbudūna', 'You worship'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 3
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَلَآ', 'Walā', 'And not'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'أَنتُمۡ', 'Antum', 'You'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'عَٰبِدُونَ', 'ʿābidūna', 'Worshippers'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'مَآ', 'Mā', 'What'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'أَعۡبُدُ', 'Aʿbudu', 'I worship'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 4
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَلَآ', 'Walā', 'And not'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'أَنَا۠', 'Anā', 'I am'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'عَابِدٞ', 'ʿābidun', 'A worshipper'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'مَّا', 'Mā', 'What'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'عَبَدتُّمۡ', 'ʿabadttum', 'You worship'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 5
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَلَآ', 'Walā', 'And not'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'أَنتُمۡ', 'Antum', 'You'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'عَٰبِدُونَ', 'ʿābidūna', 'Worshippers'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'مَآ', 'Mā', 'What'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'أَعۡبُدُ', 'Aʿbudu', 'I worship'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 6
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'لَكُمۡ', 'Lakum', 'For you'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'دِينُكُمۡ', 'Dīnukum', 'Your religion'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'وَلِيَ', 'Waliya', 'And for me'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'دِينِ', 'Dīni', 'My religion'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 109 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Surah 110

-- Verse 1
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'إِذَا', 'Idhā', 'When'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 110 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'جَآءَ', 'Jāa', 'Comes'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 110 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'نَصۡرُ', 'Naṣru', 'Help'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 110 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'ٱللَّهِ', 'Llahi', 'Allah'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 110 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'وَٱلۡفَتۡحُ', 'Walfatḥu', 'And the Victory'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 110 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 2
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَرَأَيۡتَ', 'Waraayta', 'And you see'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 110 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلنَّاسَ', 'Lnāsa', 'The people'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 110 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'يَدۡخُلُونَ', 'Yadkhulūna', 'Entering'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 110 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'فِي', 'Fī', 'Into'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 110 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'دِينِ', 'Dīni', 'Religion'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 110 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'ٱللَّهِ', 'Llahi', 'Allah'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 110 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 7, 'أَفۡوَاجٗا', 'Afwājan', 'Multitudes'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 110 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 3
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'فَسَبِّحۡ', 'Fasabbiḥ', 'Then glorify'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 110 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'بِحَمۡدِ', 'Biḥamdi', 'With  praises'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 110 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'رَبِّكَ', 'Rabbika', 'Your Lord'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 110 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'وَٱسۡتَغۡفِرۡهُۚ', 'Wais''taghfir''hu', 'And ask His forgiveness'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 110 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'إِنَّهُۥ', 'Innahu', 'Indeed, He'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 110 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'كَانَ', 'Kāna', 'Is'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 110 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 7, 'تَوَّابَۢا', 'Tawwāban', 'Oft-Returning'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 110 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Surah 111

-- Verse 1
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'تَبَّتۡ', 'Tabbat', 'Perish'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'يَدَآ', 'Yadā', 'Hands'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'أَبِي', 'Abī', 'Abu'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'لَهَبٖ', 'Lahabin', 'Lahab'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'وَتَبَّ', 'Watabba', 'And perish he'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 2
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'مَآ', 'Mā', 'Not'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'أَغۡنَىٰ', 'Aghnā', 'Avail'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'عَنۡهُ', 'ʿanhu', 'Him'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'مَالُهُۥ', 'Māluhu', 'His wealth'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'وَمَا', 'Wamā', 'And what'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'كَسَبَ', 'Kasaba', 'He earned'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 3
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'سَيَصۡلَىٰ', 'Sayaṣlā', 'He will be burnt'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'نَارٗا', 'Nāran', 'A Fire'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ذَاتَ', 'Dhāta', 'Of'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'لَهَبٖ', 'Lahabin', 'Blazing Flames'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 4
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَٱمۡرَأَتُهُۥ', 'Waim''raatuhu', 'And his wife'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'حَمَّالَةَ', 'Ḥammālata', 'Carrier'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ٱلۡحَطَبِ', 'Lḥaṭabi', 'Firewood'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 5
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'فِي', 'Fī', 'In'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'جِيدِهَا', 'Jīdihā', 'Her neck'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'حَبۡلٞ', 'Ḥablun', 'A rope'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'مِّن', 'Min', 'Of'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'مَّسَدِۭ', 'Masadin', 'Palm-fiber'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 111 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Surah 112

-- Verse 1
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'قُلۡ', 'Qul', 'Say'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 112 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'هُوَ', 'Huwa', 'He'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 112 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ٱللَّهُ', 'Llahu', 'Allah'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 112 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'أَحَدٌ', 'Aḥadun', 'The One'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 112 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 2
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'ٱللَّهُ', 'Allahu', 'Allah'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 112 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلصَّمَدُ', 'Lṣamadu', 'The Eternal, the Absolute'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 112 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 3
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'لَمۡ', 'Lam', 'Not'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 112 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'يَلِدۡ', 'Yalid', 'He begets'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 112 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'وَلَمۡ', 'Walam', 'And not'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 112 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'يُولَدۡ', 'Yūlad', 'He is begotten'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 112 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 4
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَلَمۡ', 'Walam', 'And not'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 112 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'يَكُن', 'Yakun', 'Is'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 112 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'لَّهُۥ', 'Lahu', 'For Him'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 112 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'كُفُوًا', 'Kufuwan', 'Equivalent'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 112 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'أَحَدُۢ', 'Aḥadun', 'Any [one]'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 112 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Surah 113

-- Verse 1
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'قُلۡ', 'Qul', 'Say'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'أَعُوذُ', 'Aʿūdhu', 'I seek refuge'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'بِرَبِّ', 'Birabbi', 'In  Lord'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'ٱلۡفَلَقِ', 'Lfalaqi', 'The dawn'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 2
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'مِن', 'Min', 'From'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'شَرِّ', 'Sharri', 'Evil'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'مَا', 'Mā', 'What'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'خَلَقَ', 'Khalaqa', 'He created'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 3
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَمِن', 'Wamin', 'And from'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'شَرِّ', 'Sharri', 'Evil'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'غَاسِقٍ', 'Ghāsiqin', 'Darkness'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'إِذَا', 'Idhā', 'When'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'وَقَبَ', 'Waqaba', 'It spreads'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 4
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَمِن', 'Wamin', 'And from'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'شَرِّ', 'Sharri', 'Evil'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ٱلنَّفَّـٰثَٰتِ', 'Lnafāthāti', 'The blowers'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'فِي', 'Fī', 'In'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'ٱلۡعُقَدِ', 'Lʿuqadi', 'The knots'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 5
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'وَمِن', 'Wamin', 'And from'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'شَرِّ', 'Sharri', 'Evil'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'حَاسِدٍ', 'Ḥāsidin', 'An envier'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'إِذَا', 'Idhā', 'When'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'حَسَدَ', 'Ḥasada', 'He envies'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 113 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Surah 114

-- Verse 1
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'قُلۡ', 'Qul', 'Say'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'أَعُوذُ', 'Aʿūdhu', 'I seek refuge'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'بِرَبِّ', 'Birabbi', 'In  Lord'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'ٱلنَّاسِ', 'Lnāsi', 'Mankind'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 2
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'مَلِكِ', 'Maliki', 'King'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلنَّاسِ', 'Lnāsi', 'Mankind'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 3
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'إِلَٰهِ', 'Ilāhi', 'God'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلنَّاسِ', 'Lnāsi', 'Mankind'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 4
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'مِن', 'Min', 'From'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'شَرِّ', 'Sharri', 'Evil'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'ٱلۡوَسۡوَاسِ', 'Lwaswāsi', 'The whisperer'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'ٱلۡخَنَّاسِ', 'Lkhanāsi', 'The one who withdraws'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 5
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'ٱلَّذِي', 'Alladhī', 'The one who'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'يُوَسۡوِسُ', 'Yuwaswisu', 'Whispers'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'فِي', 'Fī', 'In'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'صُدُورِ', 'Ṣudūri', 'Breasts'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'ٱلنَّاسِ', 'Lnāsi', 'Mankind'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;


-- Verse 6
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'مِنَ', 'Mina', 'From'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'ٱلۡجِنَّةِ', 'Ljinati', 'The jinn'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'وَٱلنَّاسِ', 'Walnāsi', 'And men'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 114 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;


