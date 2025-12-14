-- Insert word-by-word breakdown of Al-Fatiha (Surah 1)
-- Each word includes full vowelization (tashkeel) for proper pronunciation

-- Verse 1: بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'بِسْمِ', 'bismi', 'In the name of'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'اللَّهِ', 'Allahi', 'of Allah'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'الرَّحْمَٰنِ', 'Ar-Rahman', 'the Most Gracious'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'الرَّحِيمِ', 'Ar-Raheem', 'the Most Merciful'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;

-- Verse 2: الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'الْحَمْدُ', 'Al-hamdu', 'All praise'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'لِلَّهِ', 'lillahi', 'is for Allah'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'رَبِّ', 'Rabb', 'Lord'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'الْعَالَمِينَ', 'Al-alameen', 'of the worlds'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 2
ON CONFLICT (verse_id, word_position) DO NOTHING;

-- Verse 3: الرَّحْمَٰنِ الرَّحِيمِ
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'الرَّحْمَٰنِ', 'Ar-Rahman', 'The Most Gracious'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'الرَّحِيمِ', 'Ar-Raheem', 'the Most Merciful'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 3
ON CONFLICT (verse_id, word_position) DO NOTHING;

-- Verse 4: مَالِكِ يَوْمِ الدِّينِ
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'مَالِكِ', 'Maliki', 'Master of'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'يَوْمِ', 'Yawmi', 'the Day'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'الدِّينِ', 'Ad-deen', 'of Judgment'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 4
ON CONFLICT (verse_id, word_position) DO NOTHING;

-- Verse 5: إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'إِيَّاكَ', 'Iyyaka', 'You alone'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'نَعْبُدُ', 'na''budu', 'we worship'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'وَإِيَّاكَ', 'wa iyyaka', 'and You alone'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'نَسْتَعِينُ', 'nasta''een', 'we ask for help'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 5
ON CONFLICT (verse_id, word_position) DO NOTHING;

-- Verse 6: اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'اهْدِنَا', 'Ihdina', 'Guide us'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'الصِّرَاطَ', 'As-sirata', 'to the path'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'الْمُسْتَقِيمَ', 'Al-mustaqeem', 'the straight'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 6
ON CONFLICT (verse_id, word_position) DO NOTHING;

-- Verse 7: صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'صِرَاطَ', 'Sirata', 'The path'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 2, 'الَّذِينَ', 'Alladheena', 'of those'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 3, 'أَنْعَمْتَ', 'an''amta', 'You have bestowed favor'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 4, 'عَلَيْهِمْ', 'alayhim', 'upon them'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 5, 'غَيْرِ', 'ghayri', 'not'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 6, 'الْمَغْضُوبِ', 'Al-maghdoobi', 'of those who have evoked'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 7, 'عَلَيْهِمْ', 'alayhim', 'wrath'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 8, 'وَلَا', 'wa la', 'and not'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 9, 'الضَّالِّينَ', 'Ad-dalleen', 'of those who are astray'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 7
ON CONFLICT (verse_id, word_position) DO NOTHING;

