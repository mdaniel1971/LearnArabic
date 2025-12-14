-- Insert verses for Juz Amma (Surahs 97-114) with fully vowelized Arabic text
-- Note: All Arabic text includes complete tashkeel (diacritical marks)
-- Arabic text uses standard encoding (U+0600-U+06FF) from quran-json CDN

-- Surah 97
INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'إِنَّآ أَنزَلۡنَٰهُ فِي لَيۡلَةِ ٱلۡقَدۡرِ'
FROM surahs s WHERE s.surah_number = 97
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 2, 'وَمَآ أَدۡرَىٰكَ مَا لَيۡلَةُ ٱلۡقَدۡرِ'
FROM surahs s WHERE s.surah_number = 97
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 3, 'لَيۡلَةُ ٱلۡقَدۡرِ خَيۡرٞ مِّنۡ أَلۡفِ شَهۡرٖ'
FROM surahs s WHERE s.surah_number = 97
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 4, 'تَنَزَّلُ ٱلۡمَلَـٰٓئِكَةُ وَٱلرُّوحُ فِيهَا بِإِذۡنِ رَبِّهِم مِّن كُلِّ أَمۡرٖ'
FROM surahs s WHERE s.surah_number = 97
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 5, 'سَلَٰمٌ هِيَ حَتَّىٰ مَطۡلَعِ ٱلۡفَجۡرِ'
FROM surahs s WHERE s.surah_number = 97
ON CONFLICT (surah_id, verse_number) DO NOTHING;


-- Surah 98
INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'لَمۡ يَكُنِ ٱلَّذِينَ كَفَرُواْ مِنۡ أَهۡلِ ٱلۡكِتَٰبِ وَٱلۡمُشۡرِكِينَ مُنفَكِّينَ حَتَّىٰ تَأۡتِيَهُمُ ٱلۡبَيِّنَةُ'
FROM surahs s WHERE s.surah_number = 98
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 2, 'رَسُولٞ مِّنَ ٱللَّهِ يَتۡلُواْ صُحُفٗا مُّطَهَّرَةٗ'
FROM surahs s WHERE s.surah_number = 98
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 3, 'فِيهَا كُتُبٞ قَيِّمَةٞ'
FROM surahs s WHERE s.surah_number = 98
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 4, 'وَمَا تَفَرَّقَ ٱلَّذِينَ أُوتُواْ ٱلۡكِتَٰبَ إِلَّا مِنۢ بَعۡدِ مَا جَآءَتۡهُمُ ٱلۡبَيِّنَةُ'
FROM surahs s WHERE s.surah_number = 98
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 5, 'وَمَآ أُمِرُوٓاْ إِلَّا لِيَعۡبُدُواْ ٱللَّهَ مُخۡلِصِينَ لَهُ ٱلدِّينَ حُنَفَآءَ وَيُقِيمُواْ ٱلصَّلَوٰةَ وَيُؤۡتُواْ ٱلزَّكَوٰةَۚ وَذَٰلِكَ دِينُ ٱلۡقَيِّمَةِ'
FROM surahs s WHERE s.surah_number = 98
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 6, 'إِنَّ ٱلَّذِينَ كَفَرُواْ مِنۡ أَهۡلِ ٱلۡكِتَٰبِ وَٱلۡمُشۡرِكِينَ فِي نَارِ جَهَنَّمَ خَٰلِدِينَ فِيهَآۚ أُوْلَـٰٓئِكَ هُمۡ شَرُّ ٱلۡبَرِيَّةِ'
FROM surahs s WHERE s.surah_number = 98
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 7, 'إِنَّ ٱلَّذِينَ ءَامَنُواْ وَعَمِلُواْ ٱلصَّـٰلِحَٰتِ أُوْلَـٰٓئِكَ هُمۡ خَيۡرُ ٱلۡبَرِيَّةِ'
FROM surahs s WHERE s.surah_number = 98
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 8, 'جَزَآؤُهُمۡ عِندَ رَبِّهِمۡ جَنَّـٰتُ عَدۡنٖ تَجۡرِي مِن تَحۡتِهَا ٱلۡأَنۡهَٰرُ خَٰلِدِينَ فِيهَآ أَبَدٗاۖ رَّضِيَ ٱللَّهُ عَنۡهُمۡ وَرَضُواْ عَنۡهُۚ ذَٰلِكَ لِمَنۡ خَشِيَ رَبَّهُۥ'
FROM surahs s WHERE s.surah_number = 98
ON CONFLICT (surah_id, verse_number) DO NOTHING;


-- Surah 99
INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'إِذَا زُلۡزِلَتِ ٱلۡأَرۡضُ زِلۡزَالَهَا'
FROM surahs s WHERE s.surah_number = 99
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 2, 'وَأَخۡرَجَتِ ٱلۡأَرۡضُ أَثۡقَالَهَا'
FROM surahs s WHERE s.surah_number = 99
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 3, 'وَقَالَ ٱلۡإِنسَٰنُ مَا لَهَا'
FROM surahs s WHERE s.surah_number = 99
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 4, 'يَوۡمَئِذٖ تُحَدِّثُ أَخۡبَارَهَا'
FROM surahs s WHERE s.surah_number = 99
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 5, 'بِأَنَّ رَبَّكَ أَوۡحَىٰ لَهَا'
FROM surahs s WHERE s.surah_number = 99
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 6, 'يَوۡمَئِذٖ يَصۡدُرُ ٱلنَّاسُ أَشۡتَاتٗا لِّيُرَوۡاْ أَعۡمَٰلَهُمۡ'
FROM surahs s WHERE s.surah_number = 99
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 7, 'فَمَن يَعۡمَلۡ مِثۡقَالَ ذَرَّةٍ خَيۡرٗا يَرَهُۥ'
FROM surahs s WHERE s.surah_number = 99
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 8, 'وَمَن يَعۡمَلۡ مِثۡقَالَ ذَرَّةٖ شَرّٗا يَرَهُۥ'
FROM surahs s WHERE s.surah_number = 99
ON CONFLICT (surah_id, verse_number) DO NOTHING;


-- Surah 100
INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'وَٱلۡعَٰدِيَٰتِ ضَبۡحٗا'
FROM surahs s WHERE s.surah_number = 100
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 2, 'فَٱلۡمُورِيَٰتِ قَدۡحٗا'
FROM surahs s WHERE s.surah_number = 100
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 3, 'فَٱلۡمُغِيرَٰتِ صُبۡحٗا'
FROM surahs s WHERE s.surah_number = 100
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 4, 'فَأَثَرۡنَ بِهِۦ نَقۡعٗا'
FROM surahs s WHERE s.surah_number = 100
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 5, 'فَوَسَطۡنَ بِهِۦ جَمۡعًا'
FROM surahs s WHERE s.surah_number = 100
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 6, 'إِنَّ ٱلۡإِنسَٰنَ لِرَبِّهِۦ لَكَنُودٞ'
FROM surahs s WHERE s.surah_number = 100
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 7, 'وَإِنَّهُۥ عَلَىٰ ذَٰلِكَ لَشَهِيدٞ'
FROM surahs s WHERE s.surah_number = 100
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 8, 'وَإِنَّهُۥ لِحُبِّ ٱلۡخَيۡرِ لَشَدِيدٌ'
FROM surahs s WHERE s.surah_number = 100
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 9, '۞أَفَلَا يَعۡلَمُ إِذَا بُعۡثِرَ مَا فِي ٱلۡقُبُورِ'
FROM surahs s WHERE s.surah_number = 100
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 10, 'وَحُصِّلَ مَا فِي ٱلصُّدُورِ'
FROM surahs s WHERE s.surah_number = 100
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 11, 'إِنَّ رَبَّهُم بِهِمۡ يَوۡمَئِذٖ لَّخَبِيرُۢ'
FROM surahs s WHERE s.surah_number = 100
ON CONFLICT (surah_id, verse_number) DO NOTHING;


-- Surah 101
INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'ٱلۡقَارِعَةُ'
FROM surahs s WHERE s.surah_number = 101
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 2, 'مَا ٱلۡقَارِعَةُ'
FROM surahs s WHERE s.surah_number = 101
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 3, 'وَمَآ أَدۡرَىٰكَ مَا ٱلۡقَارِعَةُ'
FROM surahs s WHERE s.surah_number = 101
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 4, 'يَوۡمَ يَكُونُ ٱلنَّاسُ كَٱلۡفَرَاشِ ٱلۡمَبۡثُوثِ'
FROM surahs s WHERE s.surah_number = 101
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 5, 'وَتَكُونُ ٱلۡجِبَالُ كَٱلۡعِهۡنِ ٱلۡمَنفُوشِ'
FROM surahs s WHERE s.surah_number = 101
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 6, 'فَأَمَّا مَن ثَقُلَتۡ مَوَٰزِينُهُۥ'
FROM surahs s WHERE s.surah_number = 101
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 7, 'فَهُوَ فِي عِيشَةٖ رَّاضِيَةٖ'
FROM surahs s WHERE s.surah_number = 101
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 8, 'وَأَمَّا مَنۡ خَفَّتۡ مَوَٰزِينُهُۥ'
FROM surahs s WHERE s.surah_number = 101
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 9, 'فَأُمُّهُۥ هَاوِيَةٞ'
FROM surahs s WHERE s.surah_number = 101
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 10, 'وَمَآ أَدۡرَىٰكَ مَا هِيَهۡ'
FROM surahs s WHERE s.surah_number = 101
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 11, 'نَارٌ حَامِيَةُۢ'
FROM surahs s WHERE s.surah_number = 101
ON CONFLICT (surah_id, verse_number) DO NOTHING;


-- Surah 102
INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'أَلۡهَىٰكُمُ ٱلتَّكَاثُرُ'
FROM surahs s WHERE s.surah_number = 102
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 2, 'حَتَّىٰ زُرۡتُمُ ٱلۡمَقَابِرَ'
FROM surahs s WHERE s.surah_number = 102
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 3, 'كَلَّا سَوۡفَ تَعۡلَمُونَ'
FROM surahs s WHERE s.surah_number = 102
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 4, 'ثُمَّ كَلَّا سَوۡفَ تَعۡلَمُونَ'
FROM surahs s WHERE s.surah_number = 102
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 5, 'كَلَّا لَوۡ تَعۡلَمُونَ عِلۡمَ ٱلۡيَقِينِ'
FROM surahs s WHERE s.surah_number = 102
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 6, 'لَتَرَوُنَّ ٱلۡجَحِيمَ'
FROM surahs s WHERE s.surah_number = 102
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 7, 'ثُمَّ لَتَرَوُنَّهَا عَيۡنَ ٱلۡيَقِينِ'
FROM surahs s WHERE s.surah_number = 102
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 8, 'ثُمَّ لَتُسۡـَٔلُنَّ يَوۡمَئِذٍ عَنِ ٱلنَّعِيمِ'
FROM surahs s WHERE s.surah_number = 102
ON CONFLICT (surah_id, verse_number) DO NOTHING;


-- Surah 103
INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'وَٱلۡعَصۡرِ'
FROM surahs s WHERE s.surah_number = 103
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 2, 'إِنَّ ٱلۡإِنسَٰنَ لَفِي خُسۡرٍ'
FROM surahs s WHERE s.surah_number = 103
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 3, 'إِلَّا ٱلَّذِينَ ءَامَنُواْ وَعَمِلُواْ ٱلصَّـٰلِحَٰتِ وَتَوَاصَوۡاْ بِٱلۡحَقِّ وَتَوَاصَوۡاْ بِٱلصَّبۡرِ'
FROM surahs s WHERE s.surah_number = 103
ON CONFLICT (surah_id, verse_number) DO NOTHING;


-- Surah 104
INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'وَيۡلٞ لِّكُلِّ هُمَزَةٖ لُّمَزَةٍ'
FROM surahs s WHERE s.surah_number = 104
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 2, 'ٱلَّذِي جَمَعَ مَالٗا وَعَدَّدَهُۥ'
FROM surahs s WHERE s.surah_number = 104
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 3, 'يَحۡسَبُ أَنَّ مَالَهُۥٓ أَخۡلَدَهُۥ'
FROM surahs s WHERE s.surah_number = 104
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 4, 'كَلَّاۖ لَيُنۢبَذَنَّ فِي ٱلۡحُطَمَةِ'
FROM surahs s WHERE s.surah_number = 104
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 5, 'وَمَآ أَدۡرَىٰكَ مَا ٱلۡحُطَمَةُ'
FROM surahs s WHERE s.surah_number = 104
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 6, 'نَارُ ٱللَّهِ ٱلۡمُوقَدَةُ'
FROM surahs s WHERE s.surah_number = 104
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 7, 'ٱلَّتِي تَطَّلِعُ عَلَى ٱلۡأَفۡـِٔدَةِ'
FROM surahs s WHERE s.surah_number = 104
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 8, 'إِنَّهَا عَلَيۡهِم مُّؤۡصَدَةٞ'
FROM surahs s WHERE s.surah_number = 104
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 9, 'فِي عَمَدٖ مُّمَدَّدَةِۭ'
FROM surahs s WHERE s.surah_number = 104
ON CONFLICT (surah_id, verse_number) DO NOTHING;


-- Surah 105
INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'أَلَمۡ تَرَ كَيۡفَ فَعَلَ رَبُّكَ بِأَصۡحَٰبِ ٱلۡفِيلِ'
FROM surahs s WHERE s.surah_number = 105
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 2, 'أَلَمۡ يَجۡعَلۡ كَيۡدَهُمۡ فِي تَضۡلِيلٖ'
FROM surahs s WHERE s.surah_number = 105
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 3, 'وَأَرۡسَلَ عَلَيۡهِمۡ طَيۡرًا أَبَابِيلَ'
FROM surahs s WHERE s.surah_number = 105
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 4, 'تَرۡمِيهِم بِحِجَارَةٖ مِّن سِجِّيلٖ'
FROM surahs s WHERE s.surah_number = 105
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 5, 'فَجَعَلَهُمۡ كَعَصۡفٖ مَّأۡكُولِۭ'
FROM surahs s WHERE s.surah_number = 105
ON CONFLICT (surah_id, verse_number) DO NOTHING;


-- Surah 106
INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'لِإِيلَٰفِ قُرَيۡشٍ'
FROM surahs s WHERE s.surah_number = 106
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 2, 'إِۦلَٰفِهِمۡ رِحۡلَةَ ٱلشِّتَآءِ وَٱلصَّيۡفِ'
FROM surahs s WHERE s.surah_number = 106
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 3, 'فَلۡيَعۡبُدُواْ رَبَّ هَٰذَا ٱلۡبَيۡتِ'
FROM surahs s WHERE s.surah_number = 106
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 4, 'ٱلَّذِيٓ أَطۡعَمَهُم مِّن جُوعٖ وَءَامَنَهُم مِّنۡ خَوۡفِۭ'
FROM surahs s WHERE s.surah_number = 106
ON CONFLICT (surah_id, verse_number) DO NOTHING;


-- Surah 107
INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'أَرَءَيۡتَ ٱلَّذِي يُكَذِّبُ بِٱلدِّينِ'
FROM surahs s WHERE s.surah_number = 107
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 2, 'فَذَٰلِكَ ٱلَّذِي يَدُعُّ ٱلۡيَتِيمَ'
FROM surahs s WHERE s.surah_number = 107
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 3, 'وَلَا يَحُضُّ عَلَىٰ طَعَامِ ٱلۡمِسۡكِينِ'
FROM surahs s WHERE s.surah_number = 107
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 4, 'فَوَيۡلٞ لِّلۡمُصَلِّينَ'
FROM surahs s WHERE s.surah_number = 107
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 5, 'ٱلَّذِينَ هُمۡ عَن صَلَاتِهِمۡ سَاهُونَ'
FROM surahs s WHERE s.surah_number = 107
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 6, 'ٱلَّذِينَ هُمۡ يُرَآءُونَ'
FROM surahs s WHERE s.surah_number = 107
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 7, 'وَيَمۡنَعُونَ ٱلۡمَاعُونَ'
FROM surahs s WHERE s.surah_number = 107
ON CONFLICT (surah_id, verse_number) DO NOTHING;


-- Surah 108
INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'إِنَّآ أَعۡطَيۡنَٰكَ ٱلۡكَوۡثَرَ'
FROM surahs s WHERE s.surah_number = 108
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 2, 'فَصَلِّ لِرَبِّكَ وَٱنۡحَرۡ'
FROM surahs s WHERE s.surah_number = 108
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 3, 'إِنَّ شَانِئَكَ هُوَ ٱلۡأَبۡتَرُ'
FROM surahs s WHERE s.surah_number = 108
ON CONFLICT (surah_id, verse_number) DO NOTHING;


-- Surah 109
INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'قُلۡ يَـٰٓأَيُّهَا ٱلۡكَٰفِرُونَ'
FROM surahs s WHERE s.surah_number = 109
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 2, 'لَآ أَعۡبُدُ مَا تَعۡبُدُونَ'
FROM surahs s WHERE s.surah_number = 109
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 3, 'وَلَآ أَنتُمۡ عَٰبِدُونَ مَآ أَعۡبُدُ'
FROM surahs s WHERE s.surah_number = 109
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 4, 'وَلَآ أَنَا۠ عَابِدٞ مَّا عَبَدتُّمۡ'
FROM surahs s WHERE s.surah_number = 109
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 5, 'وَلَآ أَنتُمۡ عَٰبِدُونَ مَآ أَعۡبُدُ'
FROM surahs s WHERE s.surah_number = 109
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 6, 'لَكُمۡ دِينُكُمۡ وَلِيَ دِينِ'
FROM surahs s WHERE s.surah_number = 109
ON CONFLICT (surah_id, verse_number) DO NOTHING;


-- Surah 110
INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'إِذَا جَآءَ نَصۡرُ ٱللَّهِ وَٱلۡفَتۡحُ'
FROM surahs s WHERE s.surah_number = 110
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 2, 'وَرَأَيۡتَ ٱلنَّاسَ يَدۡخُلُونَ فِي دِينِ ٱللَّهِ أَفۡوَاجٗا'
FROM surahs s WHERE s.surah_number = 110
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 3, 'فَسَبِّحۡ بِحَمۡدِ رَبِّكَ وَٱسۡتَغۡفِرۡهُۚ إِنَّهُۥ كَانَ تَوَّابَۢا'
FROM surahs s WHERE s.surah_number = 110
ON CONFLICT (surah_id, verse_number) DO NOTHING;


-- Surah 111
INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'تَبَّتۡ يَدَآ أَبِي لَهَبٖ وَتَبَّ'
FROM surahs s WHERE s.surah_number = 111
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 2, 'مَآ أَغۡنَىٰ عَنۡهُ مَالُهُۥ وَمَا كَسَبَ'
FROM surahs s WHERE s.surah_number = 111
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 3, 'سَيَصۡلَىٰ نَارٗا ذَاتَ لَهَبٖ'
FROM surahs s WHERE s.surah_number = 111
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 4, 'وَٱمۡرَأَتُهُۥ حَمَّالَةَ ٱلۡحَطَبِ'
FROM surahs s WHERE s.surah_number = 111
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 5, 'فِي جِيدِهَا حَبۡلٞ مِّن مَّسَدِۭ'
FROM surahs s WHERE s.surah_number = 111
ON CONFLICT (surah_id, verse_number) DO NOTHING;


-- Surah 112
INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'قُلۡ هُوَ ٱللَّهُ أَحَدٌ'
FROM surahs s WHERE s.surah_number = 112
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 2, 'ٱللَّهُ ٱلصَّمَدُ'
FROM surahs s WHERE s.surah_number = 112
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 3, 'لَمۡ يَلِدۡ وَلَمۡ يُولَدۡ'
FROM surahs s WHERE s.surah_number = 112
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 4, 'وَلَمۡ يَكُن لَّهُۥ كُفُوًا أَحَدُۢ'
FROM surahs s WHERE s.surah_number = 112
ON CONFLICT (surah_id, verse_number) DO NOTHING;


-- Surah 113
INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'قُلۡ أَعُوذُ بِرَبِّ ٱلۡفَلَقِ'
FROM surahs s WHERE s.surah_number = 113
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 2, 'مِن شَرِّ مَا خَلَقَ'
FROM surahs s WHERE s.surah_number = 113
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 3, 'وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ'
FROM surahs s WHERE s.surah_number = 113
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 4, 'وَمِن شَرِّ ٱلنَّفَّـٰثَٰتِ فِي ٱلۡعُقَدِ'
FROM surahs s WHERE s.surah_number = 113
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 5, 'وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ'
FROM surahs s WHERE s.surah_number = 113
ON CONFLICT (surah_id, verse_number) DO NOTHING;


-- Surah 114
INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'قُلۡ أَعُوذُ بِرَبِّ ٱلنَّاسِ'
FROM surahs s WHERE s.surah_number = 114
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 2, 'مَلِكِ ٱلنَّاسِ'
FROM surahs s WHERE s.surah_number = 114
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 3, 'إِلَٰهِ ٱلنَّاسِ'
FROM surahs s WHERE s.surah_number = 114
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 4, 'مِن شَرِّ ٱلۡوَسۡوَاسِ ٱلۡخَنَّاسِ'
FROM surahs s WHERE s.surah_number = 114
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 5, 'ٱلَّذِي يُوَسۡوِسُ فِي صُدُورِ ٱلنَّاسِ'
FROM surahs s WHERE s.surah_number = 114
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 6, 'مِنَ ٱلۡجِنَّةِ وَٱلنَّاسِ'
FROM surahs s WHERE s.surah_number = 114
ON CONFLICT (surah_id, verse_number) DO NOTHING;


