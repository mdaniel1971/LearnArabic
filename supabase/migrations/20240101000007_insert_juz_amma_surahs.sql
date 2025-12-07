-- Insert Juz Amma Surahs (97-114) with fully vowelized Arabic text
-- This includes all diacritical marks (tashkeel) for proper pronunciation

-- Insert Surah 97: The Night of Decree
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (97, 'الْقَدْرِ', 'The Night of Decree', 5)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'The Night of Decree';

-- Insert Surah 98: The Clear Evidence
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (98, 'الْبَيِّنَةُ', 'The Clear Evidence', 8)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'The Clear Evidence';

-- Insert Surah 99: The Earthquake
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (99, 'الزَّلْزَلَةُ', 'The Earthquake', 8)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'The Earthquake';

-- Insert Surah 100: The Courser
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (100, 'الْعَادِيَاتِ', 'The Courser', 11)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'The Courser';

-- Insert Surah 101: The Calamity
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (101, 'الْقَارِعَةُ', 'The Calamity', 11)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'The Calamity';

-- Insert Surah 102: Competition
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (102, 'التَّكَاثُرُ', 'Competition', 8)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'Competition';

-- Insert Surah 103: The Declining Day
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (103, 'الْعَصْرِ', 'The Declining Day', 3)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'The Declining Day';

-- Insert Surah 104: The Traducer
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (104, 'الْهُمَزَةُ', 'The Traducer', 9)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'The Traducer';

-- Insert Surah 105: The Elephant
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (105, 'الْفِيلِ', 'The Elephant', 5)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'The Elephant';

-- Insert Surah 106: Quraysh
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (106, 'قُرَيْشٍ', 'Quraysh', 4)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'Quraysh';

-- Insert Surah 107: The Small Kindnesses
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (107, 'الْمَاعُونَ', 'The Small Kindnesses', 7)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'The Small Kindnesses';

-- Insert Surah 108: The Abundance
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (108, 'الْكَوْثَرُ', 'The Abundance', 3)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'The Abundance';

-- Insert Surah 109: The Disbelievers
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (109, 'الْكَافِرُونَ', 'The Disbelievers', 6)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'The Disbelievers';

-- Insert Surah 110: The Help
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (110, 'النَّصْرُ', 'The Help', 3)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'The Help';

-- Insert Surah 111: The Palm Fibre
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (111, 'الْمَسَدُ', 'The Palm Fibre', 5)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'The Palm Fibre';

-- Insert Surah 112: The Sincerity
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (112, 'الْإِخْلَاصُ', 'The Sincerity', 4)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'The Sincerity';

-- Insert Surah 113: The Daybreak
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (113, 'الْفَلَقِ', 'The Daybreak', 5)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'The Daybreak';

-- Insert Surah 114: The Mankind
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (114, 'النَّاسِ', 'The Mankind', 6)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'The Mankind';

