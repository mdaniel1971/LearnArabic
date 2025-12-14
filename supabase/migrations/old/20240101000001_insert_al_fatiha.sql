-- Insert Al-Fatiha (Surah 1) with fully vowelized Arabic text
-- This includes all diacritical marks (tashkeel) for proper pronunciation

-- Insert Surah Al-Fatiha
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (1, 'الْفَاتِحَة', 'The Opening', 7)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'The Opening';

-- Insert verses with fully vowelized Arabic text
-- Note: All Arabic text includes complete tashkeel (diacritical marks)

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ'
FROM surahs s WHERE s.surah_number = 1
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 2, 'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ'
FROM surahs s WHERE s.surah_number = 1
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 3, 'الرَّحْمَٰنِ الرَّحِيمِ'
FROM surahs s WHERE s.surah_number = 1
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 4, 'مَالِكِ يَوْمِ الدِّينِ'
FROM surahs s WHERE s.surah_number = 1
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 5, 'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ'
FROM surahs s WHERE s.surah_number = 1
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 6, 'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ'
FROM surahs s WHERE s.surah_number = 1
ON CONFLICT (surah_id, verse_number) DO NOTHING;

INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 7, 'صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ'
FROM surahs s WHERE s.surah_number = 1
ON CONFLICT (surah_id, verse_number) DO NOTHING;

