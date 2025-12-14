-- Update grammar information for Juz Amma (Surahs 97-114)
-- Based on basic grammatical analysis (simple tags matching Al-Fatiha structure)

-- Word 1: إِنَّآ (innā) - "Indeed, We"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 1 
  AND words.word_position = 1;

-- Word 2: أَنزَلۡنَٰهُ (anzalnāhu) - "revealed it"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 1 
  AND words.word_position = 2;

-- Word 3: فِي (fī) - "in"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 1 
  AND words.word_position = 3;

-- Word 4: لَيۡلَةِ (laylati) - "(the) Night"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 1 
  AND words.word_position = 4;

-- Word 5: ٱلۡقَدۡرِ (l-qadri) - "(of) Power"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 1 
  AND words.word_position = 5;

-- Word 1: وَمَآ (wamā) - "And what"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 2 
  AND words.word_position = 1;

-- Word 2: أَدۡرَىٰكَ (adrāka) - "can make you know"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 2 
  AND words.word_position = 2;

-- Word 3: مَا (mā) - "what"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 2 
  AND words.word_position = 3;

-- Word 4: لَيۡلَةُ (laylatu) - "(the) Night"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 2 
  AND words.word_position = 4;

-- Word 5: ٱلۡقَدۡرِ (l-qadri) - "(of) Power (is)"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 2 
  AND words.word_position = 5;

-- Word 1: لَيۡلَةُ (laylatu) - "(The) Night"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 3 
  AND words.word_position = 1;

-- Word 2: ٱلۡقَدۡرِ (l-qadri) - "(of) Power"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 3 
  AND words.word_position = 2;

-- Word 3: خَيۡرٞ (khayrun) - "(is) better"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 3 
  AND words.word_position = 3;

-- Word 4: مِّنۡ (min) - "than"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 3 
  AND words.word_position = 4;

-- Word 5: أَلۡفِ (alfi) - "a thousand"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 3 
  AND words.word_position = 5;

-- Word 6: شَهۡرٖ (shahrin) - "month(s)"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 3 
  AND words.word_position = 6;

-- Word 1: تَنَزَّلُ (tanazzalu) - "Descend"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 4 
  AND words.word_position = 1;

-- Word 2: ٱلۡمَلَـٰٓئِكَةُ (l-malāikatu) - "the Angels"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 4 
  AND words.word_position = 2;

-- Word 3: وَٱلرُّوحُ (wal-rūḥu) - "and the Spirit"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 4 
  AND words.word_position = 3;

-- Word 4: فِيهَا (fīhā) - "therein"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 4 
  AND words.word_position = 4;

-- Word 5: بِإِذۡنِ (bi-idh'ni) - "by (the) permission"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 4 
  AND words.word_position = 5;

-- Word 6: رَبِّهِم (rabbihim) - "(of) their Lord"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 4 
  AND words.word_position = 6;

-- Word 7: مِّن (min) - "for"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 4 
  AND words.word_position = 7;

-- Word 8: كُلِّ (kulli) - "every"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 4 
  AND words.word_position = 8;

-- Word 9: أَمۡرٖ (amrin) - "affair"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 4 
  AND words.word_position = 9;

-- Word 1: سَلَٰمٌ (salāmun) - "Peace"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 5 
  AND words.word_position = 1;

-- Word 2: هِيَ (hiya) - "it (is)"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 5 
  AND words.word_position = 2;

-- Word 3: حَتَّىٰ (ḥattā) - "until"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 5 
  AND words.word_position = 3;

-- Word 4: مَطۡلَعِ (maṭlaʿi) - "(the) emergence"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 5 
  AND words.word_position = 4;

-- Word 5: ٱلۡفَجۡرِ (l-fajri) - "(of) the dawn"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 97 
  AND v.verse_number = 5 
  AND words.word_position = 5;

-- Word 1: لَمۡ (lam) - "Not"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 1 
  AND words.word_position = 1;

-- Word 2: يَكُنِ (yakuni) - "were"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 1 
  AND words.word_position = 2;

-- Word 3: ٱلَّذِينَ (alladhīna) - "those who"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 1 
  AND words.word_position = 3;

-- Word 4: كَفَرُواْ (kafarū) - "disbelieved"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 1 
  AND words.word_position = 4;

-- Word 5: مِنۡ (min) - "from"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 1 
  AND words.word_position = 5;

-- Word 6: أَهۡلِ (ahli) - "(the) People"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 1 
  AND words.word_position = 6;

-- Word 7: ٱلۡكِتَٰبِ (l-kitābi) - "of the Book"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 1 
  AND words.word_position = 7;

-- Word 8: وَٱلۡمُشۡرِكِينَ (wal-mush'rikīna) - "and the polytheists"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 1 
  AND words.word_position = 8;

-- Word 9: مُنفَكِّينَ (munfakkīna) - "to be abandoned"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 1 
  AND words.word_position = 9;

-- Word 10: حَتَّىٰ (ḥattā) - "until"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 1 
  AND words.word_position = 10;

-- Word 11: تَأۡتِيَهُمُ (tatiyahumu) - "(there) comes to them"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 1 
  AND words.word_position = 11;

-- Word 12: ٱلۡبَيِّنَةُ (l-bayinatu) - "the clear evidence"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 1 
  AND words.word_position = 12;

-- Word 1: رَسُولٞ (rasūlun) - "A Messenger"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 2 
  AND words.word_position = 1;

-- Word 2: مِّنَ (mina) - "from"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 2 
  AND words.word_position = 2;

-- Word 3: ٱللَّهِ (l-lahi) - "Allah"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 2 
  AND words.word_position = 3;

-- Word 4: يَتۡلُواْ (yatlū) - "reciting"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 2 
  AND words.word_position = 4;

-- Word 5: صُحُفٗا (ṣuḥufan) - "pages"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 2 
  AND words.word_position = 5;

-- Word 6: مُّطَهَّرَةٗ (muṭahharatan) - "purified"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 2 
  AND words.word_position = 6;

-- Word 1: فِيهَا (fīhā) - "Wherein"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 3 
  AND words.word_position = 1;

-- Word 2: كُتُبٞ (kutubun) - "(are) writings"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 3 
  AND words.word_position = 2;

-- Word 3: قَيِّمَةٞ (qayyimatun) - "correct"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 3 
  AND words.word_position = 3;

-- Word 1: وَمَا (wamā) - "And not"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 4 
  AND words.word_position = 1;

-- Word 2: تَفَرَّقَ (tafarraqa) - "became divided"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 4 
  AND words.word_position = 2;

-- Word 3: ٱلَّذِينَ (alladhīna) - "those who"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 4 
  AND words.word_position = 3;

-- Word 4: أُوتُواْ (ūtū) - "were given"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 4 
  AND words.word_position = 4;

-- Word 5: ٱلۡكِتَٰبَ (l-kitāba) - "the Book"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 4 
  AND words.word_position = 5;

-- Word 6: إِلَّا (illā) - "until"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 4 
  AND words.word_position = 6;

-- Word 7: مِنۢ (min) - "from"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 4 
  AND words.word_position = 7;

-- Word 8: بَعۡدِ (baʿdi) - "after"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 4 
  AND words.word_position = 8;

-- Word 9: مَا (mā) - "what"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 4 
  AND words.word_position = 9;

-- Word 10: جَآءَتۡهُمُ (jāathumu) - "came (to) them"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 4 
  AND words.word_position = 10;

-- Word 11: ٱلۡبَيِّنَةُ (l-bayinatu) - "(of) the clear evidence"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 4 
  AND words.word_position = 11;

-- Word 1: وَمَآ (wamā) - "And not"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 5 
  AND words.word_position = 1;

-- Word 2: أُمِرُوٓاْ (umirū) - "they were commanded"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 5 
  AND words.word_position = 2;

-- Word 3: إِلَّا (illā) - "except"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 5 
  AND words.word_position = 3;

-- Word 4: لِيَعۡبُدُواْ (liyaʿbudū) - "to worship"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 5 
  AND words.word_position = 4;

-- Word 5: ٱللَّهَ (l-laha) - "Allah"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 5 
  AND words.word_position = 5;

-- Word 6: مُخۡلِصِينَ (mukh'liṣīna) - "(being) sincere"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 5 
  AND words.word_position = 6;

-- Word 7: لَهُ (lahu) - "to Him"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 5 
  AND words.word_position = 7;

-- Word 8: ٱلدِّينَ (l-dīna) - "(in) the religion"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 5 
  AND words.word_position = 8;

-- Word 9: حُنَفَآءَ (ḥunafāa) - "upright"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 5 
  AND words.word_position = 9;

-- Word 10: وَيُقِيمُواْ (wayuqīmū) - "and to establish"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 5 
  AND words.word_position = 10;

-- Word 11: ٱلصَّلَوٰةَ (l-ṣalata) - "the prayer"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 5 
  AND words.word_position = 11;

-- Word 12: وَيُؤۡتُواْ (wayu'tū) - "and to give"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 5 
  AND words.word_position = 12;

-- Word 13: ٱلزَّكَوٰةَۚ (l-zakata) - "the zakah"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 5 
  AND words.word_position = 13;

-- Word 14: وَذَٰلِكَ (wadhālika) - "And that"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 5 
  AND words.word_position = 14;

-- Word 15: دِينُ (dīnu) - "(is the) religion"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 5 
  AND words.word_position = 15;

-- Word 16: ٱلۡقَيِّمَةِ (l-qayimati) - "the correct"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 5 
  AND words.word_position = 16;

-- Word 1: إِنَّ (inna) - "Indeed"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 6 
  AND words.word_position = 1;

-- Word 2: ٱلَّذِينَ (alladhīna) - "those who"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 6 
  AND words.word_position = 2;

-- Word 3: كَفَرُواْ (kafarū) - "disbelieve"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 6 
  AND words.word_position = 3;

-- Word 4: مِنۡ (min) - "from"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 6 
  AND words.word_position = 4;

-- Word 5: أَهۡلِ (ahli) - "(the) People"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 6 
  AND words.word_position = 5;

-- Word 6: ٱلۡكِتَٰبِ (l-kitābi) - "(of) the Book"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 6 
  AND words.word_position = 6;

-- Word 7: وَٱلۡمُشۡرِكِينَ (wal-mush'rikīna) - "and the polytheists"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 6 
  AND words.word_position = 7;

-- Word 8: فِي (fī) - "(will be) in"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 6 
  AND words.word_position = 8;

-- Word 9: نَارِ (nāri) - "(the) Fire"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 6 
  AND words.word_position = 9;

-- Word 10: جَهَنَّمَ (jahannama) - "(of) Hell"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 6 
  AND words.word_position = 10;

-- Word 11: خَٰلِدِينَ (khālidīna) - "abiding eternally"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 6 
  AND words.word_position = 11;

-- Word 12: فِيهَآۚ (fīhā) - "therein"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 6 
  AND words.word_position = 12;

-- Word 13: أُوْلَـٰٓئِكَ (ulāika) - "Those "
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 6 
  AND words.word_position = 13;

-- Word 14: هُمۡ (hum) - "they"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 6 
  AND words.word_position = 14;

-- Word 15: شَرُّ (sharru) - "(are the) worst"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 6 
  AND words.word_position = 15;

-- Word 16: ٱلۡبَرِيَّةِ (l-bariyati) - "(of) the creatures"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 6 
  AND words.word_position = 16;

-- Word 1: إِنَّ (inna) - "Indeed"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 7 
  AND words.word_position = 1;

-- Word 2: ٱلَّذِينَ (alladhīna) - "those who"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 7 
  AND words.word_position = 2;

-- Word 3: ءَامَنُواْ (āmanū) - "believe"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 7 
  AND words.word_position = 3;

-- Word 4: وَعَمِلُواْ (waʿamilū) - "and do"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 7 
  AND words.word_position = 4;

-- Word 5: ٱلصَّـٰلِحَٰتِ (l-ṣāliḥāti) - "righteous deeds"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 7 
  AND words.word_position = 5;

-- Word 6: أُوْلَـٰٓئِكَ (ulāika) - "those "
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 7 
  AND words.word_position = 6;

-- Word 7: هُمۡ (hum) - "they"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 7 
  AND words.word_position = 7;

-- Word 8: خَيۡرُ (khayru) - "(are the) best"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 7 
  AND words.word_position = 8;

-- Word 9: ٱلۡبَرِيَّةِ (l-bariyati) - "(of) the creatures"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 7 
  AND words.word_position = 9;

-- Word 1: جَزَآؤُهُمۡ (jazāuhum) - "Their reward"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 1;

-- Word 2: عِندَ (ʿinda) - "(is) with"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 2;

-- Word 3: رَبِّهِمۡ (rabbihim) - "their Lord "
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 3;

-- Word 4: جَنَّـٰتُ (jannātu) - "Gardens"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 4;

-- Word 5: عَدۡنٖ (ʿadnin) - "(of) Eternity"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 5;

-- Word 6: تَجۡرِي (tajrī) - "flow"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 6;

-- Word 7: مِن (min) - "from"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 7;

-- Word 8: تَحۡتِهَا (taḥtihā) - "underneath them"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 8;

-- Word 9: ٱلۡأَنۡهَٰرُ (l-anhāru) - "the rivers"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 9;

-- Word 10: خَٰلِدِينَ (khālidīna) - "will abide"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 10;

-- Word 11: فِيهَآ (fīhā) - "therein"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 11;

-- Word 12: أَبَدٗاۖ (abadan) - "forever"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 12;

-- Word 13: رَّضِيَ (raḍiya) - "(will be) pleased"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 13;

-- Word 14: ٱللَّهُ (l-lahu) - "Allah"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 14;

-- Word 15: عَنۡهُمۡ (ʿanhum) - "with them"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 15;

-- Word 16: وَرَضُواْ (waraḍū) - "and they (will be) pleased"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 16;

-- Word 17: عَنۡهُۚ (ʿanhu) - "with Him"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 17;

-- Word 18: ذَٰلِكَ (dhālika) - "That"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 18;

-- Word 19: لِمَنۡ (liman) - "(is) for whoever"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 19;

-- Word 20: خَشِيَ (khashiya) - "feared"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 20;

-- Word 21: رَبَّهُۥ (rabbahu) - "his Lord"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 98 
  AND v.verse_number = 8 
  AND words.word_position = 21;

-- Word 1: إِذَا (idhā) - "When"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 1 
  AND words.word_position = 1;

-- Word 2: زُلۡزِلَتِ (zul'zilati) - "is shaken"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 1 
  AND words.word_position = 2;

-- Word 3: ٱلۡأَرۡضُ (l-arḍu) - "the earth"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 1 
  AND words.word_position = 3;

-- Word 4: زِلۡزَالَهَا (zil'zālahā) - "(with) its earthquake"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 1 
  AND words.word_position = 4;

-- Word 1: وَأَخۡرَجَتِ (wa-akhrajati) - "And brings forth"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 2 
  AND words.word_position = 1;

-- Word 2: ٱلۡأَرۡضُ (l-arḍu) - "the earth"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 2 
  AND words.word_position = 2;

-- Word 3: أَثۡقَالَهَا (athqālahā) - "its burdens"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 2 
  AND words.word_position = 3;

-- Word 1: وَقَالَ (waqāla) - "And says"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 3 
  AND words.word_position = 1;

-- Word 2: ٱلۡإِنسَٰنُ (l-insānu) - "man"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 3 
  AND words.word_position = 2;

-- Word 3: مَا (mā) - "What"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 3 
  AND words.word_position = 3;

-- Word 4: لَهَا (lahā) - "(is) with it"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 3 
  AND words.word_position = 4;

-- Word 1: يَوۡمَئِذٖ (yawma-idhin) - "That Day"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 4 
  AND words.word_position = 1;

-- Word 2: تُحَدِّثُ (tuḥaddithu) - "it will report"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 4 
  AND words.word_position = 2;

-- Word 3: أَخۡبَارَهَا (akhbārahā) - "its news"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 4 
  AND words.word_position = 3;

-- Word 1: بِأَنَّ (bi-anna) - "Because"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 5 
  AND words.word_position = 1;

-- Word 2: رَبَّكَ (rabbaka) - "your Lord"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 5 
  AND words.word_position = 2;

-- Word 3: أَوۡحَىٰ (awḥā) - "inspired"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 5 
  AND words.word_position = 3;

-- Word 4: لَهَا (lahā) - "[to] it"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 5 
  AND words.word_position = 4;

-- Word 1: يَوۡمَئِذٖ (yawma-idhin) - "That Day"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 6 
  AND words.word_position = 1;

-- Word 2: يَصۡدُرُ (yaṣduru) - "will proceed"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 6 
  AND words.word_position = 2;

-- Word 3: ٱلنَّاسُ (l-nāsu) - "the mankind"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 6 
  AND words.word_position = 3;

-- Word 4: أَشۡتَاتٗا (ashtātan) - "(in) scattered groups"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 6 
  AND words.word_position = 4;

-- Word 5: لِّيُرَوۡاْ (liyuraw) - "to be shown"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 6 
  AND words.word_position = 5;

-- Word 6: أَعۡمَٰلَهُمۡ (aʿmālahum) - "their deeds"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 6 
  AND words.word_position = 6;

-- Word 1: فَمَن (faman) - "So whoever"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 7 
  AND words.word_position = 1;

-- Word 2: يَعۡمَلۡ (yaʿmal) - "does"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 7 
  AND words.word_position = 2;

-- Word 3: مِثۡقَالَ (mith'qāla) - "(equal to the) weight"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 7 
  AND words.word_position = 3;

-- Word 4: ذَرَّةٍ (dharratin) - "(of) an atom"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 7 
  AND words.word_position = 4;

-- Word 5: خَيۡرٗا (khayran) - "good"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 7 
  AND words.word_position = 5;

-- Word 6: يَرَهُۥ (yarahu) - "will see it"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 7 
  AND words.word_position = 6;

-- Word 1: وَمَن (waman) - "And whoever"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 8 
  AND words.word_position = 1;

-- Word 2: يَعۡمَلۡ (yaʿmal) - "does"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 8 
  AND words.word_position = 2;

-- Word 3: مِثۡقَالَ (mith'qāla) - "(equal to the) weight"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 8 
  AND words.word_position = 3;

-- Word 4: ذَرَّةٖ (dharratin) - "(of) an atom"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 8 
  AND words.word_position = 4;

-- Word 5: شَرّٗا (sharran) - "evil"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 8 
  AND words.word_position = 5;

-- Word 6: يَرَهُۥ (yarahu) - "will see it"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 99 
  AND v.verse_number = 8 
  AND words.word_position = 6;

-- Word 1: وَٱلۡعَٰدِيَٰتِ (wal-ʿādiyāti) - "By the racers"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 1 
  AND words.word_position = 1;

-- Word 2: ضَبۡحٗا (ḍabḥan) - "panting"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 1 
  AND words.word_position = 2;

-- Word 1: فَٱلۡمُورِيَٰتِ (fal-mūriyāti) - "And the producers of sparks"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 2 
  AND words.word_position = 1;

-- Word 2: قَدۡحٗا (qadḥan) - "striking"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 2 
  AND words.word_position = 2;

-- Word 1: فَٱلۡمُغِيرَٰتِ (fal-mughīrāti) - "And the chargers"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 3 
  AND words.word_position = 1;

-- Word 2: صُبۡحٗا (ṣub'ḥan) - "(at) dawn"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 3 
  AND words.word_position = 2;

-- Word 1: فَأَثَرۡنَ (fa-atharna) - "Then raise"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 4 
  AND words.word_position = 1;

-- Word 2: بِهِۦ (bihi) - "thereby"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 4 
  AND words.word_position = 2;

-- Word 3: نَقۡعٗا (naqʿan) - "dust"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 4 
  AND words.word_position = 3;

-- Word 1: فَوَسَطۡنَ (fawasaṭna) - "Then penetrate (in the) center"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 5 
  AND words.word_position = 1;

-- Word 2: بِهِۦ (bihi) - "thereby"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 5 
  AND words.word_position = 2;

-- Word 3: جَمۡعًا (jamʿan) - "collectively"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 5 
  AND words.word_position = 3;

-- Word 1: إِنَّ (inna) - "Indeed"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 6 
  AND words.word_position = 1;

-- Word 2: ٱلۡإِنسَٰنَ (l-insāna) - "mankind"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 6 
  AND words.word_position = 2;

-- Word 3: لِرَبِّهِۦ (lirabbihi) - "to his Lord"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 6 
  AND words.word_position = 3;

-- Word 4: لَكَنُودٞ (lakanūdun) - "(is) surely ungrateful"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 6 
  AND words.word_position = 4;

-- Word 1: وَإِنَّهُۥ (wa-innahu) - "And indeed, he"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 7 
  AND words.word_position = 1;

-- Word 2: عَلَىٰ (ʿalā) - "on"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 7 
  AND words.word_position = 2;

-- Word 3: ذَٰلِكَ (dhālika) - "that"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 7 
  AND words.word_position = 3;

-- Word 4: لَشَهِيدٞ (lashahīdun) - "surely (is) a witness"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 7 
  AND words.word_position = 4;

-- Word 1: وَإِنَّهُۥ (wa-innahu) - "And indeed he"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 8 
  AND words.word_position = 1;

-- Word 2: لِحُبِّ (liḥubbi) - "in (the) love"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 8 
  AND words.word_position = 2;

-- Word 3: ٱلۡخَيۡرِ (l-khayri) - "(of) wealth"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 8 
  AND words.word_position = 3;

-- Word 4: لَشَدِيدٌ (lashadīdun) - "(is) surely intense"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 8 
  AND words.word_position = 4;

-- Word 1: ۞أَفَلَا (afalā) - "But does not"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 9 
  AND words.word_position = 1;

-- Word 2: يَعۡلَمُ (yaʿlamu) - "he know"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 9 
  AND words.word_position = 2;

-- Word 3: إِذَا (idhā) - "when"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 9 
  AND words.word_position = 3;

-- Word 4: بُعۡثِرَ (buʿ'thira) - "will be scattered"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 9 
  AND words.word_position = 4;

-- Word 5: مَا (mā) - "what"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 9 
  AND words.word_position = 5;

-- Word 6: فِي (fī) - "(is) in"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 9 
  AND words.word_position = 6;

-- Word 7: ٱلۡقُبُورِ (l-qubūri) - "the graves"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 9 
  AND words.word_position = 7;

-- Word 1: وَحُصِّلَ (waḥuṣṣila) - "And is made apparent"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 10 
  AND words.word_position = 1;

-- Word 2: مَا (mā) - "what"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 10 
  AND words.word_position = 2;

-- Word 3: فِي (fī) - "(is) in"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 10 
  AND words.word_position = 3;

-- Word 4: ٱلصُّدُورِ (l-ṣudūri) - "the breasts"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 10 
  AND words.word_position = 4;

-- Word 1: إِنَّ (inna) - "Indeed"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 11 
  AND words.word_position = 1;

-- Word 2: رَبَّهُم (rabbahum) - "their Lord"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 11 
  AND words.word_position = 2;

-- Word 3: بِهِمۡ (bihim) - "about them"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 11 
  AND words.word_position = 3;

-- Word 4: يَوۡمَئِذٖ (yawma-idhin) - "that Day"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 11 
  AND words.word_position = 4;

-- Word 5: لَّخَبِيرُۢ (lakhabīrun) - "(is) surely All-Aware"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 100 
  AND v.verse_number = 11 
  AND words.word_position = 5;

-- Word 1: ٱلۡقَارِعَةُ (al-qāriʿatu) - "The Striking Calamity"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 1 
  AND words.word_position = 1;

-- Word 1: مَا (mā) - "What"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 2 
  AND words.word_position = 1;

-- Word 2: ٱلۡقَارِعَةُ (l-qāriʿatu) - "(is) the Striking Calamity"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 2 
  AND words.word_position = 2;

-- Word 1: وَمَآ (wamā) - "And what"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 3 
  AND words.word_position = 1;

-- Word 2: أَدۡرَىٰكَ (adrāka) - "will make you know"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 3 
  AND words.word_position = 2;

-- Word 3: مَا (mā) - "what"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 3 
  AND words.word_position = 3;

-- Word 4: ٱلۡقَارِعَةُ (l-qāriʿatu) - "(is) the Striking Calamity"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 3 
  AND words.word_position = 4;

-- Word 1: يَوۡمَ (yawma) - "(The) Day"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 4 
  AND words.word_position = 1;

-- Word 2: يَكُونُ (yakūnu) - "will be"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 4 
  AND words.word_position = 2;

-- Word 3: ٱلنَّاسُ (l-nāsu) - "the mankind"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 4 
  AND words.word_position = 3;

-- Word 4: كَٱلۡفَرَاشِ (kal-farāshi) - "like moths"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 4 
  AND words.word_position = 4;

-- Word 5: ٱلۡمَبۡثُوثِ (l-mabthūthi) - "scattered"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 4 
  AND words.word_position = 5;

-- Word 1: وَتَكُونُ (watakūnu) - "And will be"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 5 
  AND words.word_position = 1;

-- Word 2: ٱلۡجِبَالُ (l-jibālu) - "the mountains"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 5 
  AND words.word_position = 2;

-- Word 3: كَٱلۡعِهۡنِ (kal-ʿih'ni) - "like wool"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 5 
  AND words.word_position = 3;

-- Word 4: ٱلۡمَنفُوشِ (l-manfūshi) - "fluffed up"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 5 
  AND words.word_position = 4;

-- Word 1: فَأَمَّا (fa-ammā) - "Then as for"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 6 
  AND words.word_position = 1;

-- Word 2: مَن (man) - "(him) whose"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 6 
  AND words.word_position = 2;

-- Word 3: ثَقُلَتۡ (thaqulat) - "(are) heavy"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 6 
  AND words.word_position = 3;

-- Word 4: مَوَٰزِينُهُۥ (mawāzīnuhu) - "his scales"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 6 
  AND words.word_position = 4;

-- Word 1: فَهُوَ (fahuwa) - "Then he"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 7 
  AND words.word_position = 1;

-- Word 2: فِي (fī) - "(will be) in"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 7 
  AND words.word_position = 2;

-- Word 3: عِيشَةٖ (ʿīshatin) - "a life"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 7 
  AND words.word_position = 3;

-- Word 4: رَّاضِيَةٖ (rāḍiyatin) - "pleasant"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 7 
  AND words.word_position = 4;

-- Word 1: وَأَمَّا (wa-ammā) - "But as for"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 8 
  AND words.word_position = 1;

-- Word 2: مَنۡ (man) - "(him) whose"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 8 
  AND words.word_position = 2;

-- Word 3: خَفَّتۡ (khaffat) - "(are) light"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 8 
  AND words.word_position = 3;

-- Word 4: مَوَٰزِينُهُۥ (mawāzīnuhu) - "his scales"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 8 
  AND words.word_position = 4;

-- Word 1: فَأُمُّهُۥ (fa-ummuhu) - "His abode"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 9 
  AND words.word_position = 1;

-- Word 2: هَاوِيَةٞ (hāwiyatun) - "(will be the) Pit"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 9 
  AND words.word_position = 2;

-- Word 1: وَمَآ (wamā) - "And what"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 10 
  AND words.word_position = 1;

-- Word 2: أَدۡرَىٰكَ (adrāka) - "will make you know"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 10 
  AND words.word_position = 2;

-- Word 3: مَا (mā) - "what"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 10 
  AND words.word_position = 3;

-- Word 4: هِيَهۡ (hiyah) - "it is"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 10 
  AND words.word_position = 4;

-- Word 1: نَارٌ (nārun) - "A Fire"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 11 
  AND words.word_position = 1;

-- Word 2: حَامِيَةُۢ (ḥāmiyatun) - "intensely hot"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 101 
  AND v.verse_number = 11 
  AND words.word_position = 2;

-- Word 1: أَلۡهَىٰكُمُ (alhākumu) - "Diverts you"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 1 
  AND words.word_position = 1;

-- Word 2: ٱلتَّكَاثُرُ (l-takāthuru) - "the competition to increase"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 1 
  AND words.word_position = 2;

-- Word 1: حَتَّىٰ (ḥattā) - "Until"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 2 
  AND words.word_position = 1;

-- Word 2: زُرۡتُمُ (zur'tumu) - "you visit"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 2 
  AND words.word_position = 2;

-- Word 3: ٱلۡمَقَابِرَ (l-maqābira) - "the graves"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 2 
  AND words.word_position = 3;

-- Word 1: كَلَّا (kallā) - "Nay"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 3 
  AND words.word_position = 1;

-- Word 2: سَوۡفَ (sawfa) - "Soon"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 3 
  AND words.word_position = 2;

-- Word 3: تَعۡلَمُونَ (taʿlamūna) - "you will know"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 3 
  AND words.word_position = 3;

-- Word 1: ثُمَّ (thumma) - "Then"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 4 
  AND words.word_position = 1;

-- Word 2: كَلَّا (kallā) - "nay"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 4 
  AND words.word_position = 2;

-- Word 3: سَوۡفَ (sawfa) - "Soon"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 4 
  AND words.word_position = 3;

-- Word 4: تَعۡلَمُونَ (taʿlamūna) - "you will know"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 4 
  AND words.word_position = 4;

-- Word 1: كَلَّا (kallā) - "Nay"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 5 
  AND words.word_position = 1;

-- Word 2: لَوۡ (law) - "If"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 5 
  AND words.word_position = 2;

-- Word 3: تَعۡلَمُونَ (taʿlamūna) - "you know"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 5 
  AND words.word_position = 3;

-- Word 4: عِلۡمَ (ʿil'ma) - "(with) a knowledge"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 5 
  AND words.word_position = 4;

-- Word 5: ٱلۡيَقِينِ (l-yaqīni) - "(of) certainty"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 5 
  AND words.word_position = 5;

-- Word 1: لَتَرَوُنَّ (latarawunna) - "Surely you will see"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 6 
  AND words.word_position = 1;

-- Word 2: ٱلۡجَحِيمَ (l-jaḥīma) - "the Hellfire"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 6 
  AND words.word_position = 2;

-- Word 1: ثُمَّ (thumma) - "Then"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 7 
  AND words.word_position = 1;

-- Word 2: لَتَرَوُنَّهَا (latarawunnahā) - "surely you will see it"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 7 
  AND words.word_position = 2;

-- Word 3: عَيۡنَ (ʿayna) - "(with the) eye"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 7 
  AND words.word_position = 3;

-- Word 4: ٱلۡيَقِينِ (l-yaqīni) - "(of) certainty"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 7 
  AND words.word_position = 4;

-- Word 1: ثُمَّ (thumma) - "Then"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 8 
  AND words.word_position = 1;

-- Word 2: لَتُسۡـَٔلُنَّ (latus'alunna) - "surely you will be asked"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 8 
  AND words.word_position = 2;

-- Word 3: يَوۡمَئِذٍ (yawma-idhin) - "that Day"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 8 
  AND words.word_position = 3;

-- Word 4: عَنِ (ʿani) - "about"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 8 
  AND words.word_position = 4;

-- Word 5: ٱلنَّعِيمِ (l-naʿīmi) - "the pleasures"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 102 
  AND v.verse_number = 8 
  AND words.word_position = 5;

-- Word 1: وَٱلۡعَصۡرِ (wal-ʿaṣri) - "By the time"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 103 
  AND v.verse_number = 1 
  AND words.word_position = 1;

-- Word 1: إِنَّ (inna) - "Indeed"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 103 
  AND v.verse_number = 2 
  AND words.word_position = 1;

-- Word 2: ٱلۡإِنسَٰنَ (l-insāna) - "mankind"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 103 
  AND v.verse_number = 2 
  AND words.word_position = 2;

-- Word 3: لَفِي (lafī) - "(is) surely, in"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 103 
  AND v.verse_number = 2 
  AND words.word_position = 3;

-- Word 4: خُسۡرٍ (khus'rin) - "loss"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 103 
  AND v.verse_number = 2 
  AND words.word_position = 4;

-- Word 1: إِلَّا (illā) - "Except"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 103 
  AND v.verse_number = 3 
  AND words.word_position = 1;

-- Word 2: ٱلَّذِينَ (alladhīna) - "those who"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 103 
  AND v.verse_number = 3 
  AND words.word_position = 2;

-- Word 3: ءَامَنُواْ (āmanū) - "believe"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 103 
  AND v.verse_number = 3 
  AND words.word_position = 3;

-- Word 4: وَعَمِلُواْ (waʿamilū) - "and do"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 103 
  AND v.verse_number = 3 
  AND words.word_position = 4;

-- Word 5: ٱلصَّـٰلِحَٰتِ (l-ṣāliḥāti) - "righteous deeds"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 103 
  AND v.verse_number = 3 
  AND words.word_position = 5;

-- Word 6: وَتَوَاصَوۡاْ (watawāṣaw) - "and enjoin (each other)"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 103 
  AND v.verse_number = 3 
  AND words.word_position = 6;

-- Word 7: بِٱلۡحَقِّ (bil-ḥaqi) - "to the truth"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 103 
  AND v.verse_number = 3 
  AND words.word_position = 7;

-- Word 8: وَتَوَاصَوۡاْ (watawāṣaw) - "and enjoin (each other)"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 103 
  AND v.verse_number = 3 
  AND words.word_position = 8;

-- Word 9: بِٱلصَّبۡرِ (bil-ṣabri) - "to [the] patience"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 103 
  AND v.verse_number = 3 
  AND words.word_position = 9;

-- Word 1: وَيۡلٞ (waylun) - "Woe"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 1 
  AND words.word_position = 1;

-- Word 2: لِّكُلِّ (likulli) - "to every"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 1 
  AND words.word_position = 2;

-- Word 3: هُمَزَةٖ (humazatin) - "slanderer"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 1 
  AND words.word_position = 3;

-- Word 4: لُّمَزَةٍ (lumazatin) - "backbiter"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 1 
  AND words.word_position = 4;

-- Word 1: ٱلَّذِي (alladhī) - "The one who"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 2 
  AND words.word_position = 1;

-- Word 2: جَمَعَ (jamaʿa) - "collects"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 2 
  AND words.word_position = 2;

-- Word 3: مَالٗا (mālan) - "wealth"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 2 
  AND words.word_position = 3;

-- Word 4: وَعَدَّدَهُۥ (waʿaddadahu) - "and counts it"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 2 
  AND words.word_position = 4;

-- Word 1: يَحۡسَبُ (yaḥsabu) - "Thinking"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 3 
  AND words.word_position = 1;

-- Word 2: أَنَّ (anna) - "that"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 3 
  AND words.word_position = 2;

-- Word 3: مَالَهُۥٓ (mālahu) - "his wealth"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 3 
  AND words.word_position = 3;

-- Word 4: أَخۡلَدَهُۥ (akhladahu) - "will make him immortal"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 3 
  AND words.word_position = 4;

-- Word 1: كَلَّاۖ (kallā) - "Nay"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 4 
  AND words.word_position = 1;

-- Word 2: لَيُنۢبَذَنَّ (layunbadhanna) - "Surely he will be thrown"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 4 
  AND words.word_position = 2;

-- Word 3: فِي (fī) - "in"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 4 
  AND words.word_position = 3;

-- Word 4: ٱلۡحُطَمَةِ (l-ḥuṭamati) - "the Crusher"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 4 
  AND words.word_position = 4;

-- Word 1: وَمَآ (wamā) - "And what"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 5 
  AND words.word_position = 1;

-- Word 2: أَدۡرَىٰكَ (adrāka) - "will make you know"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 5 
  AND words.word_position = 2;

-- Word 3: مَا (mā) - "what"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 5 
  AND words.word_position = 3;

-- Word 4: ٱلۡحُطَمَةُ (l-ḥuṭamatu) - "the Crusher (is)"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 5 
  AND words.word_position = 4;

-- Word 1: نَارُ (nāru) - "A Fire"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 6 
  AND words.word_position = 1;

-- Word 2: ٱللَّهِ (l-lahi) - "Allah"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 6 
  AND words.word_position = 2;

-- Word 3: ٱلۡمُوقَدَةُ (l-mūqadatu) - "kindled"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 6 
  AND words.word_position = 3;

-- Word 1: ٱلَّتِي (allatī) - "Which"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 7 
  AND words.word_position = 1;

-- Word 2: تَطَّلِعُ (taṭṭaliʿu) - "mounts up"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 7 
  AND words.word_position = 2;

-- Word 3: عَلَى (ʿalā) - "to"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 7 
  AND words.word_position = 3;

-- Word 4: ٱلۡأَفۡـِٔدَةِ (l-afidati) - "the hearts"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 7 
  AND words.word_position = 4;

-- Word 1: إِنَّهَا (innahā) - "Indeed, it"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 8 
  AND words.word_position = 1;

-- Word 2: عَلَيۡهِم (ʿalayhim) - "(will be) upon them"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 8 
  AND words.word_position = 2;

-- Word 3: مُّؤۡصَدَةٞ (mu'ṣadatun) - "closed over"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 8 
  AND words.word_position = 3;

-- Word 1: فِي (fī) - "In"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 9 
  AND words.word_position = 1;

-- Word 2: عَمَدٖ (ʿamadin) - "columns"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 9 
  AND words.word_position = 2;

-- Word 3: مُّمَدَّدَةِۭ (mumaddadatin) - "extended"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 104 
  AND v.verse_number = 9 
  AND words.word_position = 3;

-- Word 1: أَلَمۡ (alam) - "Have not"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 1 
  AND words.word_position = 1;

-- Word 2: تَرَ (tara) - "you seen"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 1 
  AND words.word_position = 2;

-- Word 3: كَيۡفَ (kayfa) - "how"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 1 
  AND words.word_position = 3;

-- Word 4: فَعَلَ (faʿala) - "dealt"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 1 
  AND words.word_position = 4;

-- Word 5: رَبُّكَ (rabbuka) - "your Lord"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 1 
  AND words.word_position = 5;

-- Word 6: بِأَصۡحَٰبِ (bi-aṣḥābi) - "with (the) Companions"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 1 
  AND words.word_position = 6;

-- Word 7: ٱلۡفِيلِ (l-fīli) - "(of the) Elephant"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 1 
  AND words.word_position = 7;

-- Word 1: أَلَمۡ (alam) - "Did not"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 2 
  AND words.word_position = 1;

-- Word 2: يَجۡعَلۡ (yajʿal) - "He make"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 2 
  AND words.word_position = 2;

-- Word 3: كَيۡدَهُمۡ (kaydahum) - "their plan"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 2 
  AND words.word_position = 3;

-- Word 4: فِي (fī) - "go"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 2 
  AND words.word_position = 4;

-- Word 5: تَضۡلِيلٖ (taḍlīlin) - "astray"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 2 
  AND words.word_position = 5;

-- Word 1: وَأَرۡسَلَ (wa-arsala) - "And He sent"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 3 
  AND words.word_position = 1;

-- Word 2: عَلَيۡهِمۡ (ʿalayhim) - "against them"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 3 
  AND words.word_position = 2;

-- Word 3: طَيۡرًا (ṭayran) - "birds"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 3 
  AND words.word_position = 3;

-- Word 4: أَبَابِيلَ (abābīla) - "(in) flocks"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 3 
  AND words.word_position = 4;

-- Word 1: تَرۡمِيهِم (tarmīhim) - "Striking them"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 4 
  AND words.word_position = 1;

-- Word 2: بِحِجَارَةٖ (biḥijāratin) - "with stones"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 4 
  AND words.word_position = 2;

-- Word 3: مِّن (min) - "of"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 4 
  AND words.word_position = 3;

-- Word 4: سِجِّيلٖ (sijjīlin) - "baked clay"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 4 
  AND words.word_position = 4;

-- Word 1: فَجَعَلَهُمۡ (fajaʿalahum) - "Then He made them"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 5 
  AND words.word_position = 1;

-- Word 2: كَعَصۡفٖ (kaʿaṣfin) - "like straw"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 5 
  AND words.word_position = 2;

-- Word 3: مَّأۡكُولِۭ (makūlin) - "eaten up"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 105 
  AND v.verse_number = 5 
  AND words.word_position = 3;

-- Word 1: لِإِيلَٰفِ (liīlāfi) - "For (the) familiarity"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 106 
  AND v.verse_number = 1 
  AND words.word_position = 1;

-- Word 2: قُرَيۡشٍ (qurayshin) - "(of the) Quraish"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 106 
  AND v.verse_number = 1 
  AND words.word_position = 2;

-- Word 1: إِۦلَٰفِهِمۡ (īlāfihim) - "Their familiarity"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 106 
  AND v.verse_number = 2 
  AND words.word_position = 1;

-- Word 2: رِحۡلَةَ (riḥ'lata) - "(with the) journey"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 106 
  AND v.verse_number = 2 
  AND words.word_position = 2;

-- Word 3: ٱلشِّتَآءِ (l-shitāi) - "(of) winter"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 106 
  AND v.verse_number = 2 
  AND words.word_position = 3;

-- Word 4: وَٱلصَّيۡفِ (wal-ṣayfi) - "and summer"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 106 
  AND v.verse_number = 2 
  AND words.word_position = 4;

-- Word 1: فَلۡيَعۡبُدُواْ (falyaʿbudū) - "So let them worship"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 106 
  AND v.verse_number = 3 
  AND words.word_position = 1;

-- Word 2: رَبَّ (rabba) - "(the) Lord"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 106 
  AND v.verse_number = 3 
  AND words.word_position = 2;

-- Word 3: هَٰذَا (hādhā) - "(of) this"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 106 
  AND v.verse_number = 3 
  AND words.word_position = 3;

-- Word 4: ٱلۡبَيۡتِ (l-bayti) - "House"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 106 
  AND v.verse_number = 3 
  AND words.word_position = 4;

-- Word 1: ٱلَّذِيٓ (alladhī) - "The One Who"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 106 
  AND v.verse_number = 4 
  AND words.word_position = 1;

-- Word 2: أَطۡعَمَهُم (aṭʿamahum) - "feeds them"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 106 
  AND v.verse_number = 4 
  AND words.word_position = 2;

-- Word 3: مِّن (min) - "[from]"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 106 
  AND v.verse_number = 4 
  AND words.word_position = 3;

-- Word 4: جُوعٖ (jūʿin) - "(against) hunger"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 106 
  AND v.verse_number = 4 
  AND words.word_position = 4;

-- Word 5: وَءَامَنَهُم (waāmanahum) - "and gives them security"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 106 
  AND v.verse_number = 4 
  AND words.word_position = 5;

-- Word 6: مِّنۡ (min) - "from"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 106 
  AND v.verse_number = 4 
  AND words.word_position = 6;

-- Word 7: خَوۡفِۭ (khawfin) - "fear"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 106 
  AND v.verse_number = 4 
  AND words.word_position = 7;

-- Word 1: أَرَءَيۡتَ (ara-ayta) - "Have you seen"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 1 
  AND words.word_position = 1;

-- Word 2: ٱلَّذِي (alladhī) - "the one who"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 1 
  AND words.word_position = 2;

-- Word 3: يُكَذِّبُ (yukadhibu) - "denies"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 1 
  AND words.word_position = 3;

-- Word 4: بِٱلدِّينِ (bil-dīni) - "the Judgment"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 1 
  AND words.word_position = 4;

-- Word 1: فَذَٰلِكَ (fadhālika) - "Then that"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 2 
  AND words.word_position = 1;

-- Word 2: ٱلَّذِي (alladhī) - "(is) the one who"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 2 
  AND words.word_position = 2;

-- Word 3: يَدُعُّ (yaduʿʿu) - "repulses"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 2 
  AND words.word_position = 3;

-- Word 4: ٱلۡيَتِيمَ (l-yatīma) - "the orphan"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 2 
  AND words.word_position = 4;

-- Word 1: وَلَا (walā) - "And (does) not"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 3 
  AND words.word_position = 1;

-- Word 2: يَحُضُّ (yaḥuḍḍu) - "feel the urge"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 3 
  AND words.word_position = 2;

-- Word 3: عَلَىٰ (ʿalā) - "to"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 3 
  AND words.word_position = 3;

-- Word 4: طَعَامِ (ṭaʿāmi) - "feed"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 3 
  AND words.word_position = 4;

-- Word 5: ٱلۡمِسۡكِينِ (l-mis'kīni) - "the poor"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 3 
  AND words.word_position = 5;

-- Word 1: فَوَيۡلٞ (fawaylun) - "So woe"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 4 
  AND words.word_position = 1;

-- Word 2: لِّلۡمُصَلِّينَ (lil'muṣallīna) - "to those who pray"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 4 
  AND words.word_position = 2;

-- Word 1: ٱلَّذِينَ (alladhīna) - "Those who"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 5 
  AND words.word_position = 1;

-- Word 2: هُمۡ (hum) - "[they]"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 5 
  AND words.word_position = 2;

-- Word 3: عَن (ʿan) - "about"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 5 
  AND words.word_position = 3;

-- Word 4: صَلَاتِهِمۡ (ṣalātihim) - "their prayers"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 5 
  AND words.word_position = 4;

-- Word 5: سَاهُونَ (sāhūna) - "(are) neglectful"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 5 
  AND words.word_position = 5;

-- Word 1: ٱلَّذِينَ (alladhīna) - "Those who"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 6 
  AND words.word_position = 1;

-- Word 2: هُمۡ (hum) - "[they]"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 6 
  AND words.word_position = 2;

-- Word 3: يُرَآءُونَ (yurāūna) - "make show"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 6 
  AND words.word_position = 3;

-- Word 1: وَيَمۡنَعُونَ (wayamnaʿūna) - "And they deny"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 7 
  AND words.word_position = 1;

-- Word 2: ٱلۡمَاعُونَ (l-māʿūna) - "[the] small kindnesses"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 107 
  AND v.verse_number = 7 
  AND words.word_position = 2;

-- Word 1: إِنَّآ (innā) - "Indeed, We"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 108 
  AND v.verse_number = 1 
  AND words.word_position = 1;

-- Word 2: أَعۡطَيۡنَٰكَ (aʿṭaynāka) - "We have given you"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 108 
  AND v.verse_number = 1 
  AND words.word_position = 2;

-- Word 3: ٱلۡكَوۡثَرَ (l-kawthara) - "Al-Kauthar"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 108 
  AND v.verse_number = 1 
  AND words.word_position = 3;

-- Word 1: فَصَلِّ (faṣalli) - "So pray"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 108 
  AND v.verse_number = 2 
  AND words.word_position = 1;

-- Word 2: لِرَبِّكَ (lirabbika) - "to your Lord"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 108 
  AND v.verse_number = 2 
  AND words.word_position = 2;

-- Word 3: وَٱنۡحَرۡ (wa-in'ḥar) - "and sacrifice"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 108 
  AND v.verse_number = 2 
  AND words.word_position = 3;

-- Word 1: إِنَّ (inna) - "Indeed"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 108 
  AND v.verse_number = 3 
  AND words.word_position = 1;

-- Word 2: شَانِئَكَ (shāni-aka) - "your enemy "
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 108 
  AND v.verse_number = 3 
  AND words.word_position = 2;

-- Word 3: هُوَ (huwa) - "he (is)"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 108 
  AND v.verse_number = 3 
  AND words.word_position = 3;

-- Word 4: ٱلۡأَبۡتَرُ (l-abtaru) - "the one cut off"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 108 
  AND v.verse_number = 3 
  AND words.word_position = 4;

-- Word 1: قُلۡ (qul) - "Say"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 1 
  AND words.word_position = 1;

-- Word 2: يَـٰٓأَيُّهَا (yāayyuhā) - "O"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 1 
  AND words.word_position = 2;

-- Word 3: ٱلۡكَٰفِرُونَ (l-kāfirūna) - "disbelievers"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 1 
  AND words.word_position = 3;

-- Word 1: لَآ (lā) - "Not"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 2 
  AND words.word_position = 1;

-- Word 2: أَعۡبُدُ (aʿbudu) - "I worship"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 2 
  AND words.word_position = 2;

-- Word 3: مَا (mā) - "what"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 2 
  AND words.word_position = 3;

-- Word 4: تَعۡبُدُونَ (taʿbudūna) - "you worship"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 2 
  AND words.word_position = 4;

-- Word 1: وَلَآ (walā) - "And not"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 3 
  AND words.word_position = 1;

-- Word 2: أَنتُمۡ (antum) - "you"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 3 
  AND words.word_position = 2;

-- Word 3: عَٰبِدُونَ (ʿābidūna) - "(are) worshippers"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 3 
  AND words.word_position = 3;

-- Word 4: مَآ (mā) - "(of) what"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 3 
  AND words.word_position = 4;

-- Word 5: أَعۡبُدُ (aʿbudu) - "I worship"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 3 
  AND words.word_position = 5;

-- Word 1: وَلَآ (walā) - "And not"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 4 
  AND words.word_position = 1;

-- Word 2: أَنَا۠ (anā) - "I am"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 4 
  AND words.word_position = 2;

-- Word 3: عَابِدٞ (ʿābidun) - "a worshipper"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 4 
  AND words.word_position = 3;

-- Word 4: مَّا (mā) - "(of) what"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 4 
  AND words.word_position = 4;

-- Word 5: عَبَدتُّمۡ (ʿabadttum) - "you worship"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 4 
  AND words.word_position = 5;

-- Word 1: وَلَآ (walā) - "And not"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 5 
  AND words.word_position = 1;

-- Word 2: أَنتُمۡ (antum) - "you"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 5 
  AND words.word_position = 2;

-- Word 3: عَٰبِدُونَ (ʿābidūna) - "(are) worshippers"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 5 
  AND words.word_position = 3;

-- Word 4: مَآ (mā) - "(of) what"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 5 
  AND words.word_position = 4;

-- Word 5: أَعۡبُدُ (aʿbudu) - "I worship"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 5 
  AND words.word_position = 5;

-- Word 1: لَكُمۡ (lakum) - "For you"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 6 
  AND words.word_position = 1;

-- Word 2: دِينُكُمۡ (dīnukum) - "(is) your religion"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 6 
  AND words.word_position = 2;

-- Word 3: وَلِيَ (waliya) - "and for me"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 6 
  AND words.word_position = 3;

-- Word 4: دِينِ (dīni) - "(is) my religion"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 109 
  AND v.verse_number = 6 
  AND words.word_position = 4;

-- Word 1: إِذَا (idhā) - "When"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 110 
  AND v.verse_number = 1 
  AND words.word_position = 1;

-- Word 2: جَآءَ (jāa) - "comes"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 110 
  AND v.verse_number = 1 
  AND words.word_position = 2;

-- Word 3: نَصۡرُ (naṣru) - "(the) Help"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 110 
  AND v.verse_number = 1 
  AND words.word_position = 3;

-- Word 4: ٱللَّهِ (l-lahi) - "(of) Allah"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 110 
  AND v.verse_number = 1 
  AND words.word_position = 4;

-- Word 5: وَٱلۡفَتۡحُ (wal-fatḥu) - "and the Victory"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 110 
  AND v.verse_number = 1 
  AND words.word_position = 5;

-- Word 1: وَرَأَيۡتَ (wara-ayta) - "And you see"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 110 
  AND v.verse_number = 2 
  AND words.word_position = 1;

-- Word 2: ٱلنَّاسَ (l-nāsa) - "the people"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 110 
  AND v.verse_number = 2 
  AND words.word_position = 2;

-- Word 3: يَدۡخُلُونَ (yadkhulūna) - "entering"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 110 
  AND v.verse_number = 2 
  AND words.word_position = 3;

-- Word 4: فِي (fī) - "into"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 110 
  AND v.verse_number = 2 
  AND words.word_position = 4;

-- Word 5: دِينِ (dīni) - "(the) religion"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 110 
  AND v.verse_number = 2 
  AND words.word_position = 5;

-- Word 6: ٱللَّهِ (l-lahi) - "(of) Allah"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 110 
  AND v.verse_number = 2 
  AND words.word_position = 6;

-- Word 7: أَفۡوَاجٗا (afwājan) - "(in) multitudes"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 110 
  AND v.verse_number = 2 
  AND words.word_position = 7;

-- Word 1: فَسَبِّحۡ (fasabbiḥ) - "Then glorify"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 110 
  AND v.verse_number = 3 
  AND words.word_position = 1;

-- Word 2: بِحَمۡدِ (biḥamdi) - "with (the) praises"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 110 
  AND v.verse_number = 3 
  AND words.word_position = 2;

-- Word 3: رَبِّكَ (rabbika) - "(of) your Lord"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 110 
  AND v.verse_number = 3 
  AND words.word_position = 3;

-- Word 4: وَٱسۡتَغۡفِرۡهُۚ (wa-is'taghfir'hu) - "and ask His forgiveness"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 110 
  AND v.verse_number = 3 
  AND words.word_position = 4;

-- Word 5: إِنَّهُۥ (innahu) - "Indeed, He"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 110 
  AND v.verse_number = 3 
  AND words.word_position = 5;

-- Word 6: كَانَ (kāna) - "is"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 110 
  AND v.verse_number = 3 
  AND words.word_position = 6;

-- Word 7: تَوَّابَۢا (tawwāban) - "Oft-Returning"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 110 
  AND v.verse_number = 3 
  AND words.word_position = 7;

-- Word 1: تَبَّتۡ (tabbat) - "Perish"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 1 
  AND words.word_position = 1;

-- Word 2: يَدَآ (yadā) - "(the) hands"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 1 
  AND words.word_position = 2;

-- Word 3: أَبِي (abī) - "(of) Abu"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 1 
  AND words.word_position = 3;

-- Word 4: لَهَبٖ (lahabin) - "Lahab"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 1 
  AND words.word_position = 4;

-- Word 5: وَتَبَّ (watabba) - "and perish he"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 1 
  AND words.word_position = 5;

-- Word 1: مَآ (mā) - "Not"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 2 
  AND words.word_position = 1;

-- Word 2: أَغۡنَىٰ (aghnā) - "(will) avail"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 2 
  AND words.word_position = 2;

-- Word 3: عَنۡهُ (ʿanhu) - "him"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 2 
  AND words.word_position = 3;

-- Word 4: مَالُهُۥ (māluhu) - "his wealth"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 2 
  AND words.word_position = 4;

-- Word 5: وَمَا (wamā) - "and what"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 2 
  AND words.word_position = 5;

-- Word 6: كَسَبَ (kasaba) - "he earned"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 2 
  AND words.word_position = 6;

-- Word 1: سَيَصۡلَىٰ (sayaṣlā) - "He will be burnt"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 3 
  AND words.word_position = 1;

-- Word 2: نَارٗا (nāran) - "(in) a Fire"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 3 
  AND words.word_position = 2;

-- Word 3: ذَاتَ (dhāta) - "of"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 3 
  AND words.word_position = 3;

-- Word 4: لَهَبٖ (lahabin) - "Blazing Flames"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 3 
  AND words.word_position = 4;

-- Word 1: وَٱمۡرَأَتُهُۥ (wa-im'ra-atuhu) - "And his wife"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 4 
  AND words.word_position = 1;

-- Word 2: حَمَّالَةَ (ḥammālata) - "(the) carrier"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 4 
  AND words.word_position = 2;

-- Word 3: ٱلۡحَطَبِ (l-ḥaṭabi) - "(of) firewood"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 4 
  AND words.word_position = 3;

-- Word 1: فِي (fī) - "In"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 5 
  AND words.word_position = 1;

-- Word 2: جِيدِهَا (jīdihā) - "her neck"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 5 
  AND words.word_position = 2;

-- Word 3: حَبۡلٞ (ḥablun) - "(will be) a rope"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 5 
  AND words.word_position = 3;

-- Word 4: مِّن (min) - "of"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 5 
  AND words.word_position = 4;

-- Word 5: مَّسَدِۭ (masadin) - "palm-fiber"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 111 
  AND v.verse_number = 5 
  AND words.word_position = 5;

-- Word 1: قُلۡ (qul) - "Say"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 112 
  AND v.verse_number = 1 
  AND words.word_position = 1;

-- Word 2: هُوَ (huwa) - "He"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 112 
  AND v.verse_number = 1 
  AND words.word_position = 2;

-- Word 3: ٱللَّهُ (l-lahu) - "(is) Allah"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 112 
  AND v.verse_number = 1 
  AND words.word_position = 3;

-- Word 4: أَحَدٌ (aḥadun) - "the One"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 112 
  AND v.verse_number = 1 
  AND words.word_position = 4;

-- Word 1: ٱللَّهُ (al-lahu) - "Allah"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 112 
  AND v.verse_number = 2 
  AND words.word_position = 1;

-- Word 2: ٱلصَّمَدُ (l-ṣamadu) - "the Eternal, the Absolute"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 112 
  AND v.verse_number = 2 
  AND words.word_position = 2;

-- Word 1: لَمۡ (lam) - "Not"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 112 
  AND v.verse_number = 3 
  AND words.word_position = 1;

-- Word 2: يَلِدۡ (yalid) - "He begets"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 112 
  AND v.verse_number = 3 
  AND words.word_position = 2;

-- Word 3: وَلَمۡ (walam) - "and not"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 112 
  AND v.verse_number = 3 
  AND words.word_position = 3;

-- Word 4: يُولَدۡ (yūlad) - "He is begotten"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 112 
  AND v.verse_number = 3 
  AND words.word_position = 4;

-- Word 1: وَلَمۡ (walam) - "And not"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 112 
  AND v.verse_number = 4 
  AND words.word_position = 1;

-- Word 2: يَكُن (yakun) - "is"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 112 
  AND v.verse_number = 4 
  AND words.word_position = 2;

-- Word 3: لَّهُۥ (lahu) - "for Him"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 112 
  AND v.verse_number = 4 
  AND words.word_position = 3;

-- Word 4: كُفُوًا (kufuwan) - "equivalent"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 112 
  AND v.verse_number = 4 
  AND words.word_position = 4;

-- Word 5: أَحَدُۢ (aḥadun) - "any [one]"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 112 
  AND v.verse_number = 4 
  AND words.word_position = 5;

-- Word 1: قُلۡ (qul) - "Say"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 1 
  AND words.word_position = 1;

-- Word 2: أَعُوذُ (aʿūdhu) - "I seek refuge"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 1 
  AND words.word_position = 2;

-- Word 3: بِرَبِّ (birabbi) - "in (the) Lord"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 1 
  AND words.word_position = 3;

-- Word 4: ٱلۡفَلَقِ (l-falaqi) - "(of) the dawn"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 1 
  AND words.word_position = 4;

-- Word 1: مِن (min) - "From"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 2 
  AND words.word_position = 1;

-- Word 2: شَرِّ (sharri) - "(the) evil"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 2 
  AND words.word_position = 2;

-- Word 3: مَا (mā) - "(of) what"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 2 
  AND words.word_position = 3;

-- Word 4: خَلَقَ (khalaqa) - "He created"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 2 
  AND words.word_position = 4;

-- Word 1: وَمِن (wamin) - "And from"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 3 
  AND words.word_position = 1;

-- Word 2: شَرِّ (sharri) - "(the) evil"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 3 
  AND words.word_position = 2;

-- Word 3: غَاسِقٍ (ghāsiqin) - "(of) darkness"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 3 
  AND words.word_position = 3;

-- Word 4: إِذَا (idhā) - "when"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 3 
  AND words.word_position = 4;

-- Word 5: وَقَبَ (waqaba) - "it spreads"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 3 
  AND words.word_position = 5;

-- Word 1: وَمِن (wamin) - "And from"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 4 
  AND words.word_position = 1;

-- Word 2: شَرِّ (sharri) - "(the) evil"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 4 
  AND words.word_position = 2;

-- Word 3: ٱلنَّفَّـٰثَٰتِ (l-nafāthāti) - "(of) the blowers"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 4 
  AND words.word_position = 3;

-- Word 4: فِي (fī) - "in"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 4 
  AND words.word_position = 4;

-- Word 5: ٱلۡعُقَدِ (l-ʿuqadi) - "the knots"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 4 
  AND words.word_position = 5;

-- Word 1: وَمِن (wamin) - "And from"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 5 
  AND words.word_position = 1;

-- Word 2: شَرِّ (sharri) - "(the) evil"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 5 
  AND words.word_position = 2;

-- Word 3: حَاسِدٍ (ḥāsidin) - "(of) an envier"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 5 
  AND words.word_position = 3;

-- Word 4: إِذَا (idhā) - "when"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 5 
  AND words.word_position = 4;

-- Word 5: حَسَدَ (ḥasada) - "he envies"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 113 
  AND v.verse_number = 5 
  AND words.word_position = 5;

-- Word 1: قُلۡ (qul) - "Say"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 1 
  AND words.word_position = 1;

-- Word 2: أَعُوذُ (aʿūdhu) - "I seek refuge"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"present","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 1 
  AND words.word_position = 2;

-- Word 3: بِرَبِّ (birabbi) - "in (the) Lord"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 1 
  AND words.word_position = 3;

-- Word 4: ٱلنَّاسِ (l-nāsi) - "(of) mankind"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 1 
  AND words.word_position = 4;

-- Word 1: مَلِكِ (maliki) - "(The) King"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 2 
  AND words.word_position = 1;

-- Word 2: ٱلنَّاسِ (l-nāsi) - "(of) mankind"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 2 
  AND words.word_position = 2;

-- Word 1: إِلَٰهِ (ilāhi) - "(The) God"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 3 
  AND words.word_position = 1;

-- Word 2: ٱلنَّاسِ (l-nāsi) - "(of) mankind"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 3 
  AND words.word_position = 2;

-- Word 1: مِن (min) - "From"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 4 
  AND words.word_position = 1;

-- Word 2: شَرِّ (sharri) - "(the) evil"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 4 
  AND words.word_position = 2;

-- Word 3: ٱلۡوَسۡوَاسِ (l-waswāsi) - "(of) the whisperer"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 4 
  AND words.word_position = 3;

-- Word 4: ٱلۡخَنَّاسِ (l-khanāsi) - "the one who withdraws"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 4 
  AND words.word_position = 4;

-- Word 1: ٱلَّذِي (alladhī) - "The one who"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 5 
  AND words.word_position = 1;

-- Word 2: يُوَسۡوِسُ (yuwaswisu) - "whispers"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 5 
  AND words.word_position = 2;

-- Word 3: فِي (fī) - "in"
UPDATE words
SET grammar_info = '{"part_of_speech":"Preposition","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 5 
  AND words.word_position = 3;

-- Word 4: صُدُورِ (ṣudūri) - "(the) breasts"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 5 
  AND words.word_position = 4;

-- Word 5: ٱلنَّاسِ (l-nāsi) - "(of) mankind"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 5 
  AND words.word_position = 5;

-- Word 1: مِنَ (mina) - "From"
UPDATE words
SET grammar_info = '{"part_of_speech":"Noun","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 6 
  AND words.word_position = 1;

-- Word 2: ٱلۡجِنَّةِ (l-jinati) - "the jinn"
UPDATE words
SET grammar_info = '{"part_of_speech":"Verb","tense":"past","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 6 
  AND words.word_position = 2;

-- Word 3: وَٱلنَّاسِ (wal-nāsi) - "and men"
UPDATE words
SET grammar_info = '{"part_of_speech":"Conjunction","number":"singular"}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 114 
  AND v.verse_number = 6 
  AND words.word_position = 3;

