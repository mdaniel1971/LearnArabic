-- Update grammar_info from Quranic Arabic Corpus
-- Source: https://github.com/mustafa0x/quran-morphology
-- File: quran-morphology.txt
-- Surahs: 97-114 (Juz Amma only)
-- Note: Surah 1 (Al-Fatiha) is EXCLUDED (manually created)


-- ========== SURAH 97 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:نزل","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ليل","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:قدر","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 1
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:دري","masculine singular","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ليل","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 2
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:قدر","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 2
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ليل","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:قدر","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:خير","masculine singular","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ألف","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 3
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:شهر","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 3
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:نزل","feminine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ملك","masculine plural","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:روح","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 4
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 4
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 4
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ربب","genitive","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 4
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 4
)
AND word_position = 7;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:كلل","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 4
)
AND word_position = 8;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أمر","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 4
)
AND word_position = 9;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:سلم","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 5
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 5
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 5
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:طلع","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 5
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:فجر","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 5
)
AND word_position = 5;

-- ========== SURAH 98 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Preposition","features":["preposition"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:كون","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:كفر","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أهل","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:كتب","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 7;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:شرك","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 8;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:فكك","masculine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 9;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 10;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:أتي","feminine singular","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 11;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:بين","feminine singular","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 12;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:رسل","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أله","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:تلو","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 2
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:صحف","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 2
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:طهر","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 2
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:كتب","masculine plural","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:قوم","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:فرق","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 4
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:أتي","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 4
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:كتب","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 4
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 4
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 4
)
AND word_position = 7;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:بعد","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 4
)
AND word_position = 8;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 4
)
AND word_position = 9;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:جيأ","feminine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 4
)
AND word_position = 10;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:بين","feminine singular","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 4
)
AND word_position = 11;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:أمر","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:عبد","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أله","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:خلص","masculine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 7;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:دين","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 8;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:حنف","masculine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 9;

UPDATE words 
SET grammar_info = '{"part_of_speech":"conjunction_pronoun","features":["conjunction","pronoun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 10;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:صلو","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 11;

UPDATE words 
SET grammar_info = '{"part_of_speech":"conjunction_pronoun","features":["conjunction","pronoun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 12;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:زكو","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 13;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 14;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:دين","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 15;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:قوم","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 16;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:كفر","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أهل","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:كتب","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:شرك","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 7;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 8;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:نور","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 9;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 10;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:خلد","masculine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 11;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 12;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 13;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 14;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:شرر","masculine singular","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 15;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:برأ","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 16;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 7
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 7
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:أمن","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 7
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"conjunction_pronoun","features":["conjunction","pronoun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 7
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:صلح","feminine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 7
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 7
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 7
)
AND word_position = 7;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:خير","masculine singular","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 7
)
AND word_position = 8;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:برأ","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 7
)
AND word_position = 9;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:جزي","nominative","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:عند","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ربب","genitive","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:جنن","feminine plural","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:جري","feminine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 7;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:تحت","genitive","feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 8;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:نهر","masculine plural","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 9;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:خلد","masculine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 10;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 11;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أبد","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 12;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:رضو","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 13;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أله","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 14;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 15;

UPDATE words 
SET grammar_info = '{"part_of_speech":"conjunction_pronoun","features":["conjunction","pronoun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 16;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 17;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 18;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 19;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:خشي","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 20;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ربب","accusative","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 21;

-- ========== SURAH 99 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:زلزل","feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أرض","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:زلزل","accusative","feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:خرج","feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أرض","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ثقل","masculine plural","accusative","feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:قول","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أنس","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:يوم"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:حدث","feminine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:خبر","masculine plural","accusative","feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 4
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Preposition","features":["preposition"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 5
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ربب","accusative","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 5
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:وحي","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 5
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 5
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:يوم"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 6
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:صدر","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 6
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أنس","masculine plural","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 6
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:شتت","masculine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 6
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:رأي","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 6
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:عمل","masculine plural","accusative","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 6
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 7
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:عمل","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 7
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ثقل","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 7
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ذرر","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 7
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:خير","masculine singular","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 7
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:رأي","masculine singular","masculine plural","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 7
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 8
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:عمل","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 8
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ثقل","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 8
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ذرر","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 8
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:شرر","masculine singular","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 8
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:رأي","masculine singular","masculine plural","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 8
)
AND word_position = 6;

-- ========== SURAH 100 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ضبح","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:وري","feminine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:قدح","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:غير","feminine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:صبح","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"conjunction_pronoun","features":["conjunction","pronoun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:نقع","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 4
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"conjunction_pronoun","features":["conjunction","pronoun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 5
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 5
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:جمع","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 5
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 6
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أنس","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 6
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 6
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 6
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"conjunction_pronoun","features":["conjunction","pronoun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 7
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 7
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 7
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 7
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"conjunction_pronoun","features":["conjunction","pronoun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 8
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 8
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:خير","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 8
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 8
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 9
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:علم","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 9
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 9
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:بعثر","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 9
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 9
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 9
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:قبر","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 9
)
AND word_position = 7;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:حصل","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 10
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 10
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 10
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:صدر","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 10
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 11
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ربب","accusative","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 11
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 11
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:يوم"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 11
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 11
)
AND word_position = 5;

-- ========== SURAH 101 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:قرع","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:قرع","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:دري","masculine singular","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:قرع","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:يوم","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:كون","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أنس","masculine plural","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 4
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 4
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:بثث","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 4
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:كون","feminine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 5
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:جبل","masculine plural","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 5
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 5
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:نفش","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 5
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 6
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 6
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:ثقل","feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 6
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:وزن","masculine plural","nominative","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 6
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 7
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 7
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:عيش","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 7
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:رضو","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 7
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 8
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 8
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:خفف","feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 8
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:وزن","masculine plural","nominative","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 8
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أمم","feminine singular","nominative","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 9
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:هوي","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 9
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 10
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:دري","masculine singular","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 10
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 10
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 10
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:نور","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 11
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:حمي","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 11
)
AND word_position = 2;

-- ========== SURAH 102 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:لهو","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:كثر","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:زور","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:قبر","masculine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:علم","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 4
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:علم","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 4
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 5
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Preposition","features":["preposition"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 5
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:علم","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 5
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:علم","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 5
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:يقن","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 5
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["masculine plural","root:رأي","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 6
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:جحم","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 6
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 7
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["masculine plural","root:رأي","masculine plural","masculine plural","feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 7
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:عين","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 7
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:يقن","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 7
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 8
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["masculine plural","root:سأل","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 8
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:يوم"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 8
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 8
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:نعم","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 8
)
AND word_position = 5;

-- ========== SURAH 103 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أنس","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Preposition","features":["preposition"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:خسر","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 2
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:أمن","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"conjunction_pronoun","features":["conjunction","pronoun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:صلح","feminine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"conjunction_pronoun","features":["conjunction","pronoun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 7;

UPDATE words 
SET grammar_info = '{"part_of_speech":"conjunction_pronoun","features":["conjunction","pronoun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 8;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 9;

-- ========== SURAH 104 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:همز","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:لمز","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:جمع","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:مول","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"conjunction_pronoun","features":["conjunction","pronoun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 2
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:حسب","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:مول","accusative","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:خلد","masculine singular","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["masculine plural","root:نبذ","masculine singular","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 4
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:حطم","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 4
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 5
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:دري","masculine singular","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 5
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 5
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:حطم","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 5
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:نور","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 6
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أله","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 6
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:وقد","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 6
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 7
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:طلع","feminine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 7
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 7
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:فأد","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 7
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["accusative","feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 8
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 8
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:وصد","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 8
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 9
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:عمد","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 9
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:مدد","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 9
)
AND word_position = 3;

-- ========== SURAH 105 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:رأي","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:كيف"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:فعل","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ربب","nominative","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 1
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 1
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:فيل","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 1
)
AND word_position = 7;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:جعل","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:كيد","accusative","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 2
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ضلل","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 2
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:رسل","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:طير","masculine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أبل","masculine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:رمي","feminine singular","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 4
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:سجل","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 4
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"conjunction_pronoun","features":["conjunction","pronoun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 5
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 5
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أكل","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 5
)
AND word_position = 3;

-- ========== SURAH 106 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:قرش","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ألف","genitive","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:رحل","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:شتو","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:صيف","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 2
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"conjunction_pronoun","features":["conjunction","pronoun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ربب","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:بيت","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:طعم","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 4
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:جوع","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 4
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"conjunction_pronoun","features":["conjunction","pronoun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 4
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 4
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:خوف","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 4
)
AND word_position = 7;

-- ========== SURAH 107 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:رأي","masculine singular","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:كذب","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:دعع","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:يتم","masculine singular","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 2
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:حضض","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:طعم","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:سكن","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 3
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 5
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 5
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 5
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:صلو","genitive","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 5
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:سهو","masculine plural","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 5
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 6
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 6
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:رأي","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 6
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"conjunction_pronoun","features":["conjunction","pronoun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 7
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:عون","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 7
)
AND word_position = 2;

-- ========== SURAH 108 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:عطو","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:كثر","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:صلو","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:نحر","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:شنأ","accusative","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:بتر","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 3
)
AND word_position = 4;

-- ========== SURAH 109 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:قول","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أيي","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:كفر","masculine plural","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Preposition","features":["preposition"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:عبد","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:عبد","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 2
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:عبد","masculine plural","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:عبد","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 3
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:عبد","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 4
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 4
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:عبد","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 4
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 5
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 5
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:عبد","masculine plural","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 5
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 5
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:عبد","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 5
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 6
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:دين","nominative","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 6
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 6
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:دين","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 6
)
AND word_position = 4;

-- ========== SURAH 110 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:جيأ","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:نصر","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أله","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:فتح","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 1
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"conjunction_pronoun","features":["conjunction","pronoun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أنس","masculine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:دخل","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 2
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:دين","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 2
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أله","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 2
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:فوج","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 2
)
AND word_position = 7;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:سبح","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ربب","genitive","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"conjunction_pronoun","features":["conjunction","pronoun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["accusative","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 3
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:كون","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 3
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:توب","masculine singular","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 3
)
AND word_position = 7;

-- ========== SURAH 111 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:تبب","feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:يدي","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أبو","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:لهب","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:تبب","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 1
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:غني","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:مول","nominative","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 2
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 2
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:كسب","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 2
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:صلي","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:نور","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["feminine singular","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:لهب","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"conjunction_pronoun","features":["conjunction","pronoun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:حمل","feminine singular","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:حطب","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 4
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 5
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:جيد","genitive","feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 5
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:حبل","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 5
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 5
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:مسد","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 5
)
AND word_position = 5;

-- ========== SURAH 112 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:قول","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أله","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أحد","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أله","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:صمد","masculine singular","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Preposition","features":["preposition"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:ولد","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:ولد","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:كون","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 4
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:كفأ","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 4
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أحد","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 4
)
AND word_position = 5;

-- ========== SURAH 113 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:قول","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:عوذ","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:فلق","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:شرر","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:خلق","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 2
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:شرر","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:غسق","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:وقب","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 3
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:شرر","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:نفث","feminine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 4
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 4
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:عقد","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 4
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 5
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:شرر","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 5
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:حسد","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 5
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 5
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:حسد","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 5
)
AND word_position = 5;

-- ========== SURAH 114 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:قول","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:عوذ","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أنس","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:ملك","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أنس","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أله","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أنس","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:شرر","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:وسوس","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 4
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:خنس","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 4
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 5
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","features":["root:وسوس","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 5
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 5
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:صدر","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 5
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أنس","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 5
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","features":["particle"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 6
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:جنن","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 6
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","features":["root:أنس","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 6
)
AND word_position = 3;