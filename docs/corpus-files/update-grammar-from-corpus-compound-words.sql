-- Update grammar_info from Quranic Arabic Corpus
-- Source: https://github.com/mustafa0x/quran-morphology
-- File: quran-morphology.txt
-- Surahs: 97-114 (Juz Amma only)
-- Note: Surah 1 (Al-Fatiha) is EXCLUDED (manually created)


-- ========== SURAH 97 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","case":"accusative","features":["accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:نزل"],"pronoun_person":"first","pronoun_number":"plural","form":"4","aspect":"perfect","voice":"active","person":"first","tense":"past"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:ليل","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:قدر","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:دري"],"pronoun_person":"second","pronoun_number":"singular","pronoun_gender":"masculine","form":"4","aspect":"perfect","voice":"active","tense":"past"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:ليل","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 2
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:قدر","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 2
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:ليل","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:قدر","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"nominative","features":["root:خير","masculine singular","nominative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:ألف","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 3
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:شهر","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 3
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","tense":"present","mood":"indicative","form":"5","aspect":"imperfect","voice":"active","features":["root:نزل","feminine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"nominative","features":["root:ملك","masculine plural","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:روح","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 4
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","gender":"feminine","number":"singular","features":["feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 4
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 4
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:ربب"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","case":"genitive"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:كلل","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 4
)
AND word_position = 8;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:أمر","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 4
)
AND word_position = 9;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:سلم","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 5
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"feminine","number":"singular","features":["feminine singular"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:طلع","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 5
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:فجر","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"jussive","form":"1","aspect":"imperfect","voice":"active","features":["root:كون","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:كفر"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"perfect","voice":"active","person":"first","tense":"past"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:أهل","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:كتب","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 7;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"genitive","features":["root:شرك","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 8;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"accusative","features":["root:فكك","masculine plural","accusative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:أتي"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"imperfect","voice":"active","person":"first","tense":"present","mood":"subjunctive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 11;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"feminine","number":"singular","case":"nominative","features":["root:بين","feminine singular","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 12;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:رسل","nominative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:أله","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"indicative","form":"1","aspect":"imperfect","voice":"active","features":["root:تلو","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 2
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:صحف","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 2
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:طهر","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 2
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","gender":"feminine","number":"singular","features":["feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"nominative","features":["root:كتب","masculine plural","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:قوم","nominative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"singular","tense":"past","form":"5","aspect":"perfect","voice":"active","features":["root:فرق","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 4
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:أتي"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"4","aspect":"perfect","voice":"passive","tense":"past"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 4
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:كتب","accusative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:بعد","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:جيأ"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"perfect","voice":"active","person":"first","tense":"past"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 4
)
AND word_position = 10;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"feminine","number":"singular","case":"nominative","features":["root:بين","feminine singular","nominative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:أمر"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"perfect","voice":"passive","person":"first","tense":"past"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:عبد"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"imperfect","voice":"active","person":"first","tense":"present","mood":"subjunctive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:أله","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"accusative","features":["root:خلص","masculine plural","accusative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:دين","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 8;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"accusative","features":["root:حنف","masculine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 9;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:قوم"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"4","aspect":"imperfect","voice":"active","tense":"present","mood":"subjunctive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 10;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:صلو","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 11;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:أتي"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"4","aspect":"imperfect","voice":"active","tense":"present","mood":"subjunctive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 12;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:زكو","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 13;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 14;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:دين","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 15;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:قوم","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 16;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","case":"accusative","features":["accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:كفر"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"perfect","voice":"active","person":"first","tense":"past"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:أهل","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:كتب","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"genitive","features":["root:شرك","masculine plural","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:نور","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 9;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 10;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"accusative","features":["root:خلد","masculine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 11;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","gender":"feminine","number":"singular","features":["feminine singular"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 14;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"nominative","features":["root:شرر","masculine singular","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 15;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:برأ","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 16;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","case":"accusative","features":["accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 7
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 7
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:أمن"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"4","aspect":"perfect","voice":"active","tense":"past"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 7
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:عمل"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"perfect","voice":"active","person":"first","tense":"past"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 7
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"feminine","number":"plural","case":"accusative","features":["root:صلح","feminine plural","accusative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 7
)
AND word_position = 7;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"nominative","features":["root:خير","masculine singular","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 7
)
AND word_position = 8;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:برأ","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 7
)
AND word_position = 9;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:جزي"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","case":"nominative"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:عند","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:ربب"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"feminine","number":"plural","case":"nominative","features":["root:جنن","feminine plural","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"indicative","form":"1","aspect":"imperfect","voice":"active","features":["root:جري","feminine singular","masculine plural"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:تحت"],"pronoun_person":"third","pronoun_number":"singular","pronoun_gender":"feminine","case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 8;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"nominative","features":["root:نهر","masculine plural","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 9;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"accusative","features":["root:خلد","masculine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 10;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","gender":"feminine","number":"singular","features":["feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 11;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:أبد","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 12;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"singular","person":"first","tense":"past","form":"1","aspect":"perfect","voice":"active","features":["root:رضو","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 13;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:أله","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 14;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","gender":"masculine","number":"plural","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 15;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:رضو"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"perfect","voice":"active","person":"first","tense":"past"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 16;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","gender":"masculine","number":"singular","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 17;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","features":["masculine singular"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"singular","person":"first","tense":"past","form":"1","aspect":"perfect","voice":"active","features":["root:خشي","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 20;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:ربب"],"pronoun_person":"third","pronoun_number":"singular","pronoun_gender":"masculine","case":"accusative"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"feminine","number":"singular","person":"first","tense":"past","form":"1","aspect":"perfect","voice":"passive","features":["root:زلزل","feminine singular","passive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:أرض","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:زلزل"],"pronoun_person":"third","pronoun_number":"singular","pronoun_gender":"feminine","case":"accusative"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","voice":"active","gender":"feminine","number":"singular","tense":"past","form":"4","aspect":"perfect","features":["root:خرج","feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:أرض","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:ثقل"],"pronoun_person":"third","pronoun_number":"singular","pronoun_gender":"feminine","case":"accusative"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","voice":"active","gender":"masculine","number":"singular","person":"first","tense":"past","form":"1","aspect":"perfect","features":["root:قول","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:أنس","nominative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"second","tense":"present","mood":"indicative","form":"2","aspect":"imperfect","voice":"active","features":["root:حدث","feminine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:خبر"],"pronoun_person":"third","pronoun_number":"singular","pronoun_gender":"feminine","case":"accusative"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:ربب"],"pronoun_person":"second","pronoun_number":"singular","pronoun_gender":"masculine","case":"accusative"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 5
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"singular","tense":"past","form":"4","aspect":"perfect","voice":"active","features":["root:وحي","masculine singular"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"indicative","form":"1","aspect":"imperfect","voice":"active","features":["root:صدر","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 6
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"nominative","features":["root:أنس","masculine plural","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 6
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"accusative","features":["root:شتت","masculine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 6
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:رأي"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"4","aspect":"imperfect","voice":"passive","tense":"present","mood":"subjunctive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 6
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:عمل"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","case":"accusative"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"jussive","form":"1","aspect":"imperfect","voice":"active","features":["root:عمل","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 7
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:ثقل","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 7
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:ذرر","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 7
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"accusative","features":["root:خير","masculine singular","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 7
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:رأي"],"pronoun_person":"third","pronoun_number":"singular","pronoun_gender":"masculine","form":"1","aspect":"imperfect","voice":"active","person":"first","tense":"present","mood":"jussive"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"jussive","form":"1","aspect":"imperfect","voice":"active","features":["root:عمل","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 8
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:ثقل","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 8
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:ذرر","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 8
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"accusative","features":["root:شرر","masculine singular","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 8
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:رأي"],"pronoun_person":"third","pronoun_number":"singular","pronoun_gender":"masculine","form":"1","aspect":"imperfect","voice":"active","person":"first","tense":"present","mood":"jussive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 8
)
AND word_position = 6;

-- ========== SURAH 100 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:ضبح","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"feminine","number":"plural","case":"genitive","features":["root:وري","feminine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:قدح","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"feminine","number":"plural","case":"genitive","features":["root:غير","feminine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:صبح","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:ثور"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"feminine","form":"4","aspect":"perfect","voice":"active","tense":"past"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:نقع","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 4
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:وسط"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"feminine","form":"1","aspect":"perfect","voice":"active","person":"first","tense":"past"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:جمع","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 5
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","case":"accusative","features":["accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 6
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:أنس","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 6
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:ربب"],"pronoun_person":"third","pronoun_number":"singular","pronoun_gender":"masculine","case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 6
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"nominative"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 7
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"nominative"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 8
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"genitive","features":["root:خير","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 8
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"nominative"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"indicative","form":"1","aspect":"imperfect","voice":"active","features":["root:علم","masculine singular","masculine plural"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"singular","person":"first","tense":"past","form":"1","aspect":"perfect","voice":"passive","features":["root:بعثر","masculine singular","passive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"genitive","features":["root:قبر","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 9
)
AND word_position = 7;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","voice":"passive","gender":"masculine","number":"singular","person":"second","tense":"past","form":"2","aspect":"perfect","features":["root:حصل","masculine singular","passive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"genitive","features":["root:صدر","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 10
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","case":"accusative","features":["accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 11
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:ربب"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","case":"accusative"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"nominative"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 11
)
AND word_position = 5;

-- ========== SURAH 101 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:قرع","nominative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:قرع","nominative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:دري"],"pronoun_person":"second","pronoun_number":"singular","pronoun_gender":"masculine","form":"4","aspect":"perfect","voice":"active","tense":"past"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:قرع","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:يوم","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"indicative","form":"1","aspect":"imperfect","voice":"active","features":["root:كون","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"nominative","features":["root:أنس","masculine plural","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 4
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 4
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:بثث","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 4
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","voice":"active","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"indicative","form":"1","aspect":"imperfect","features":["root:كون","feminine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 5
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"nominative","features":["root:جبل","masculine plural","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 5
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 5
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:نفش","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"feminine","number":"singular","person":"first","tense":"past","form":"1","aspect":"perfect","voice":"active","features":["root:ثقل","feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 6
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:وزن"],"pronoun_person":"third","pronoun_number":"singular","pronoun_gender":"masculine","case":"nominative"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 6
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","features":["masculine singular"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:عيش","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 7
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:رضو","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"feminine","number":"singular","person":"first","tense":"past","form":"1","aspect":"perfect","voice":"active","features":["root:خفف","feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 8
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:وزن"],"pronoun_person":"third","pronoun_number":"singular","pronoun_gender":"masculine","case":"nominative"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 8
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:أمم"],"pronoun_person":"third","pronoun_number":"singular","pronoun_gender":"masculine","case":"nominative"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 9
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:هوي","nominative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:دري"],"pronoun_person":"second","pronoun_number":"singular","pronoun_gender":"masculine","form":"4","aspect":"perfect","voice":"active","tense":"past"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","gender":"feminine","number":"singular","features":["feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 10
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:نور","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 11
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:حمي","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 11
)
AND word_position = 2;

-- ========== SURAH 102 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:لهو"],"pronoun_person":"second","pronoun_number":"plural","pronoun_gender":"masculine","form":"4","aspect":"perfect","voice":"active","tense":"past"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:كثر","nominative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:زور"],"pronoun_person":"second","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"perfect","voice":"active","person":"first","tense":"past"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"accusative","features":["root:قبر","masculine plural","accusative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:علم"],"pronoun_person":"second","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"imperfect","voice":"active","person":"first","tense":"present","mood":"indicative"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:علم"],"pronoun_person":"second","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"imperfect","voice":"active","person":"first","tense":"present","mood":"indicative"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:علم"],"pronoun_person":"second","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"imperfect","voice":"active","person":"first","tense":"present","mood":"indicative"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 5
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:علم","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 5
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"genitive","features":["root:يقن","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 5
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","voice":"active","person":"first","tense":"present","mood":"indicative","form":"1","aspect":"imperfect","features":["masculine plural","root:رأي","masculine plural","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 6
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:جحم","accusative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:رأي"],"pronoun_person":"third","pronoun_number":"singular","pronoun_gender":"feminine","form":"1","aspect":"imperfect","voice":"active","person":"first","tense":"present","mood":"indicative"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 7
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:عين","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 7
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"genitive","features":["root:يقن","masculine singular","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","voice":"active","person":"first","tense":"present","mood":"indicative","form":"1","aspect":"imperfect","features":["masculine plural","root:سأل","masculine plural","passive","masculine plural"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:نعم","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 8
)
AND word_position = 5;

-- ========== SURAH 103 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","case":"accusative","features":["accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:أنس","accusative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:خسر","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:أمن"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"4","aspect":"perfect","voice":"active","tense":"past"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:عمل"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"perfect","voice":"active","person":"first","tense":"past"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"feminine","number":"plural","case":"accusative","features":["root:صلح","feminine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:وصي"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"6","aspect":"perfect","voice":"active","tense":"past"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 7;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:وصي"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"6","aspect":"perfect","voice":"active","tense":"past"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 8;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 9;

-- ========== SURAH 104 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:همز","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:لمز","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"singular","person":"first","tense":"past","form":"1","aspect":"perfect","voice":"active","features":["root:جمع","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:مول","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:عدد"],"pronoun_person":"third","pronoun_number":"singular","pronoun_gender":"masculine","form":"2","aspect":"perfect","voice":"active","person":"second","tense":"past"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 2
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"indicative","form":"1","aspect":"imperfect","voice":"active","features":["root:حسب","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","case":"accusative","features":["accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:مول"],"pronoun_person":"third","pronoun_number":"singular","pronoun_gender":"masculine","case":"accusative"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:خلد"],"pronoun_person":"third","pronoun_number":"singular","pronoun_gender":"masculine","form":"4","aspect":"perfect","voice":"active","tense":"past"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","voice":"active","person":"first","tense":"present","mood":"indicative","form":"1","aspect":"imperfect","features":["masculine plural","root:نبذ","masculine singular","masculine plural","passive","masculine plural"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:حطم","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:دري"],"pronoun_person":"second","pronoun_number":"singular","pronoun_gender":"masculine","form":"4","aspect":"perfect","voice":"active","tense":"past"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:حطم","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 5
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:نور","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 6
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:أله","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 6
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:وقد","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 6
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"feminine","number":"singular","features":["feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 7
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","tense":"present","mood":"indicative","form":"8","aspect":"imperfect","voice":"active","features":["root:طلع","feminine singular","masculine plural"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"genitive","features":["root:فأد","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 7
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","case":"accusative","gender":"feminine","number":"singular","features":["accusative","feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 8
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","gender":"masculine","number":"plural","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 8
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:وصد","nominative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"genitive","features":["root:عمد","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 9
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:مدد","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"jussive","form":"1","aspect":"imperfect","voice":"active","features":["root:رأي","masculine singular","masculine plural"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"singular","person":"first","tense":"past","form":"1","aspect":"perfect","voice":"active","features":["root:فعل","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:ربب"],"pronoun_person":"second","pronoun_number":"singular","pronoun_gender":"masculine","case":"nominative"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 1
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 1
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:فيل","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"jussive","form":"1","aspect":"imperfect","voice":"active","features":["root:جعل","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:كيد"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","case":"accusative"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:ضلل","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 2
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","voice":"active","gender":"masculine","number":"singular","tense":"past","form":"4","aspect":"perfect","features":["root:رسل","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","gender":"masculine","number":"plural","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"accusative","features":["root:طير","masculine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"accusative","features":["root:أبل","masculine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:رمي"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"imperfect","voice":"active","person":"first","tense":"present","mood":"indicative"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"genitive"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:سجل","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 4
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:جعل"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"perfect","voice":"active","person":"first","tense":"past"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 5
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 5
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:أكل","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 5
)
AND word_position = 3;

-- ========== SURAH 106 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:قرش","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:ألف"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:رحل","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:شتو","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:صيف","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 2
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:عبد"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"imperfect","voice":"active","person":"first","tense":"present","mood":"jussive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:ربب","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:بيت","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:طعم"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"4","aspect":"perfect","voice":"active","tense":"past"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:جوع","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 4
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:أمن"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"4","aspect":"perfect","voice":"active","tense":"past"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:خوف","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 4
)
AND word_position = 7;

-- ========== SURAH 107 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:رأي"],"pronoun_person":"second","pronoun_number":"singular","pronoun_gender":"masculine","form":"1","aspect":"perfect","voice":"active","person":"first","tense":"past"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"second","tense":"present","mood":"indicative","form":"2","aspect":"imperfect","voice":"active","features":["root:كذب","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"indicative","form":"1","aspect":"imperfect","voice":"active","features":["root:دعع","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"accusative","features":["root:يتم","masculine singular","accusative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"indicative","form":"1","aspect":"imperfect","voice":"active","features":["root:حضض","masculine singular","masculine plural"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:طعم","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"genitive","features":["root:سكن","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 3
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 5
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","features":["masculine plural"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:صلو"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 5
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"nominative","features":["root:سهو","masculine plural","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 5
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 6
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 6
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:رأي"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"3","aspect":"imperfect","voice":"active","person":"third","tense":"present","mood":"indicative"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 6
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:منع"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"imperfect","voice":"active","person":"first","tense":"present","mood":"indicative"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 7
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:عون","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 7
)
AND word_position = 2;

-- ========== SURAH 108 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","case":"accusative","features":["accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:عطو"],"pronoun_person":"first","pronoun_number":"plural","form":"4","aspect":"perfect","voice":"active","person":"first","tense":"past"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:كثر","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","voice":"active","gender":"masculine","number":"plural","person":"second","tense":"imperative","form":"2","aspect":"imperative","features":["root:صلو","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:ربب"],"pronoun_person":"second","pronoun_number":"singular","pronoun_gender":"masculine","case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","voice":"active","gender":"masculine","number":"plural","person":"first","tense":"imperative","form":"1","aspect":"imperative","features":["root:نحر","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","case":"accusative","features":["accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:شنأ"],"pronoun_person":"second","pronoun_number":"singular","pronoun_gender":"masculine","case":"accusative"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:بتر","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 3
)
AND word_position = 4;

-- ========== SURAH 109 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"imperative","form":"1","aspect":"imperative","voice":"active","features":["root:قول","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:أيي","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"nominative","features":["root:كفر","masculine plural","nominative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"indicative","form":"1","aspect":"imperfect","voice":"active","features":["root:عبد","masculine plural"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:عبد"],"pronoun_person":"second","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"imperfect","voice":"active","person":"first","tense":"present","mood":"indicative"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"nominative","features":["root:عبد","masculine plural","nominative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"indicative","form":"1","aspect":"imperfect","voice":"active","features":["root:عبد","masculine plural"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:عبد","nominative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:عبد"],"pronoun_person":"second","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"perfect","voice":"active","person":"first","tense":"past"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","features":["masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 5
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"nominative","features":["root:عبد","masculine plural","nominative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"indicative","form":"1","aspect":"imperfect","voice":"active","features":["root:عبد","masculine plural"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:دين"],"pronoun_person":"second","pronoun_number":"plural","pronoun_gender":"masculine","case":"nominative"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:دين"],"pronoun_person":"first","pronoun_number":"singular","case":"nominative"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"singular","person":"first","tense":"past","form":"1","aspect":"perfect","voice":"active","features":["root:جيأ","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:نصر","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:أله","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:فتح","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 1
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:رأي"],"pronoun_person":"second","pronoun_number":"singular","pronoun_gender":"masculine","form":"1","aspect":"perfect","voice":"active","person":"first","tense":"past"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"accusative","features":["root:أنس","masculine plural","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:دخل"],"pronoun_person":"third","pronoun_number":"plural","pronoun_gender":"masculine","form":"1","aspect":"imperfect","voice":"active","person":"first","tense":"present","mood":"indicative"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:دين","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 2
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:أله","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 2
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:فوج","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 2
)
AND word_position = 7;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","voice":"active","gender":"masculine","number":"plural","person":"second","tense":"imperative","form":"2","aspect":"imperative","features":["root:سبح","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:ربب"],"pronoun_person":"second","pronoun_number":"singular","pronoun_gender":"masculine","case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"verb_pronoun","features":["verb","pronoun","root:غفر"],"pronoun_person":"third","pronoun_number":"singular","pronoun_gender":"masculine","form":"10","aspect":"imperative","voice":"active","tense":"imperative"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","case":"accusative","gender":"masculine","number":"singular","features":["accusative","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 3
)
AND word_position = 5;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"singular","person":"first","tense":"past","form":"1","aspect":"perfect","voice":"active","features":["root:كون","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 3
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"accusative","features":["root:توب","masculine singular","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 3
)
AND word_position = 7;

-- ========== SURAH 111 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"feminine","number":"singular","person":"first","tense":"past","form":"1","aspect":"perfect","voice":"active","features":["root:تبب","feminine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:يدي","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"genitive","features":["root:أبو","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:لهب","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","voice":"active","gender":"masculine","number":"singular","person":"first","tense":"past","form":"1","aspect":"perfect","features":["root:تبب","masculine singular"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"singular","person":"first","tense":"past","form":"1","aspect":"perfect","voice":"active","features":["root:غني","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Particle","gender":"masculine","number":"singular","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 2
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:مول"],"pronoun_person":"third","pronoun_number":"singular","pronoun_gender":"masculine","case":"nominative"}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"singular","person":"first","tense":"past","form":"1","aspect":"perfect","voice":"active","features":["root:كسب","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 2
)
AND word_position = 6;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","voice":"active","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"indicative","form":"1","aspect":"imperfect","features":["root:صلي","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:نور","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"feminine","number":"singular","case":"accusative","features":["feminine singular","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 3
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:لهب","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 3
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:مرأ"],"pronoun_person":"third","pronoun_number":"singular","pronoun_gender":"masculine","case":"nominative"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 4
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"feminine","number":"singular","case":"accusative","features":["root:حمل","feminine singular","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:حطب","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"noun_pronoun","features":["noun","pronoun","root:جيد"],"pronoun_person":"third","pronoun_number":"singular","pronoun_gender":"feminine","case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 5
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:حبل","nominative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:مسد","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 5
)
AND word_position = 5;

-- ========== SURAH 112 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"imperative","form":"1","aspect":"imperative","voice":"active","features":["root:قول","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:أله","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:أحد","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:أله","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"nominative","features":["root:صمد","masculine singular","nominative"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"jussive","form":"1","aspect":"imperfect","voice":"active","features":["root:ولد","masculine singular","masculine plural"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"jussive","form":"1","aspect":"imperfect","voice":"passive","features":["root:ولد","masculine singular","masculine plural","passive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"jussive","form":"1","aspect":"imperfect","voice":"active","features":["root:كون","masculine singular","masculine plural"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"accusative","features":["root:كفأ","accusative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 4
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"nominative","features":["root:أحد","nominative"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 4
)
AND word_position = 5;

-- ========== SURAH 113 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"imperative","form":"1","aspect":"imperative","voice":"active","features":["root:قول","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"indicative","form":"1","aspect":"imperfect","voice":"active","features":["root:عوذ","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:فلق","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"genitive","features":["root:شرر","masculine singular","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"singular","person":"first","tense":"past","form":"1","aspect":"perfect","voice":"active","features":["root:خلق","masculine singular"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"genitive","features":["root:شرر","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 3
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:غسق","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"singular","person":"first","tense":"past","form":"1","aspect":"perfect","voice":"active","features":["root:وقب","masculine singular"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"genitive","features":["root:شرر","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"feminine","number":"plural","case":"genitive","features":["root:نفث","feminine plural","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"genitive","features":["root:عقد","masculine plural","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"genitive","features":["root:شرر","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 5
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:حسد","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"singular","person":"first","tense":"past","form":"1","aspect":"perfect","voice":"active","features":["root:حسد","masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 5
)
AND word_position = 5;

-- ========== SURAH 114 ==========

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"imperative","form":"1","aspect":"imperative","voice":"active","features":["root:قول","masculine singular","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 1
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"indicative","form":"1","aspect":"imperfect","voice":"active","features":["root:عوذ","masculine plural"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 1
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"preposition_noun","features":["preposition","noun"],"case":"genitive"}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 1
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"genitive","features":["root:أنس","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 1
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"genitive","features":["root:ملك","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 2
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"genitive","features":["root:أنس","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 2
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"genitive","features":["root:أله","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 3
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"genitive","features":["root:أنس","masculine plural","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"genitive","features":["root:شرر","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 4
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"genitive","features":["root:وسوس","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 4
)
AND word_position = 3;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","case":"genitive","features":["root:خنس","masculine singular","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 4
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"singular","features":["masculine singular"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 5
)
AND word_position = 1;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Verb","gender":"masculine","number":"plural","person":"first","tense":"present","mood":"indicative","form":"1","aspect":"imperfect","voice":"active","features":["root:وسوس","masculine singular","masculine plural"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"genitive","features":["root:صدر","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 5
)
AND word_position = 4;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"genitive","features":["root:أنس","masculine plural","genitive"]}'::jsonb
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
SET grammar_info = '{"part_of_speech":"Noun","case":"genitive","features":["root:جنن","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 6
)
AND word_position = 2;

UPDATE words 
SET grammar_info = '{"part_of_speech":"Noun","gender":"masculine","number":"plural","case":"genitive","features":["root:أنس","masculine plural","genitive"]}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 6
)
AND word_position = 3;