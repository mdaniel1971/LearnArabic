-- Update grammar information for all 29 words in Al-Fatiha
-- Based on standard Quranic Arabic grammatical analysis

-- Verse 1: بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ

-- Word 1: بِسْمِ (bismi) - "In the name of"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "preposition_noun",
  "preposition": "بِ",
  "noun": "اسم",
  "case": "genitive",
  "definiteness": "indefinite",
  "number": "singular",
  "notes": "Preposition bi (in) + noun ism (name) in construct state"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 1 
  AND words.word_position = 1;

-- Word 2: اللَّهِ (Allahi) - "of Allah"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "proper_noun",
  "case": "genitive",
  "definiteness": "definite",
  "number": "singular",
  "notes": "Proper noun, genitive case due to preceding preposition bi"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 1 
  AND words.word_position = 2;

-- Word 3: الرَّحْمَٰنِ (Ar-Rahman) - "the Most Gracious"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "adjective",
  "case": "genitive",
  "definiteness": "definite",
  "number": "singular",
  "gender": "masculine",
  "notes": "Divine attribute, genitive case, definite article al-"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 1 
  AND words.word_position = 3;

-- Word 4: الرَّحِيمِ (Ar-Raheem) - "the Most Merciful"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "adjective",
  "case": "genitive",
  "definiteness": "definite",
  "number": "singular",
  "gender": "masculine",
  "notes": "Divine attribute, genitive case, definite article al-"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 1 
  AND words.word_position = 4;

-- Verse 2: الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ

-- Word 5: الْحَمْدُ (Al-hamdu) - "All praise"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "noun",
  "case": "nominative",
  "definiteness": "definite",
  "number": "singular",
  "notes": "Subject of implied verb, nominative case, definite article al-"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 2 
  AND words.word_position = 1;

-- Word 6: لِلَّهِ (lillahi) - "is for Allah"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "preposition_noun",
  "preposition": "لِ",
  "noun": "proper_noun",
  "case": "genitive",
  "definiteness": "definite",
  "number": "singular",
  "notes": "Preposition li (for) + proper noun Allah, genitive case"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 2 
  AND words.word_position = 2;

-- Word 7: رَبِّ (Rabb) - "Lord"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "noun",
  "case": "genitive",
  "definiteness": "definite",
  "number": "singular",
  "notes": "Construct state (mudaf), genitive case, definite by virtue of following genitive"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 2 
  AND words.word_position = 3;

-- Word 8: الْعَالَمِينَ (Al-alameen) - "of the worlds"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "noun",
  "case": "genitive",
  "definiteness": "definite",
  "number": "plural",
  "notes": "Plural form, genitive case (mudaf ilayh), definite article al-"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 2 
  AND words.word_position = 4;

-- Verse 3: الرَّحْمَٰنِ الرَّحِيمِ

-- Word 9: الرَّحْمَٰنِ (Ar-Rahman) - "The Most Gracious"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "adjective",
  "case": "genitive",
  "definiteness": "definite",
  "number": "singular",
  "gender": "masculine",
  "notes": "Divine attribute, genitive case, definite article al-"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 3 
  AND words.word_position = 1;

-- Word 10: الرَّحِيمِ (Ar-Raheem) - "the Most Merciful"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "adjective",
  "case": "genitive",
  "definiteness": "definite",
  "number": "singular",
  "gender": "masculine",
  "notes": "Divine attribute, genitive case, definite article al-"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 3 
  AND words.word_position = 2;

-- Verse 4: مَالِكِ يَوْمِ الدِّينِ

-- Word 11: مَالِكِ (Maliki) - "Master of"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "noun",
  "case": "genitive",
  "definiteness": "definite",
  "number": "singular",
  "notes": "Construct state (mudaf), genitive case, definite by virtue of following genitive"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 4 
  AND words.word_position = 1;

-- Word 12: يَوْمِ (Yawmi) - "the Day"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "noun",
  "case": "genitive",
  "definiteness": "definite",
  "number": "singular",
  "notes": "Genitive case (mudaf ilayh), definite by virtue of following genitive"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 4 
  AND words.word_position = 2;

-- Word 13: الدِّينِ (Ad-deen) - "of Judgment"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "noun",
  "case": "genitive",
  "definiteness": "definite",
  "number": "singular",
  "notes": "Genitive case (mudaf ilayh), definite article al-"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 4 
  AND words.word_position = 3;

-- Verse 5: إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ

-- Word 14: إِيَّاكَ (Iyyaka) - "You alone"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "pronoun",
  "type": "separated_object_pronoun",
  "case": "accusative",
  "person": "second",
  "number": "singular",
  "gender": "masculine",
  "notes": "Separated object pronoun (mafool bihi), accusative case, emphasis"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 5 
  AND words.word_position = 1;

-- Word 15: نَعْبُدُ (na''budu) - "we worship"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "verb",
  "form": "I",
  "tense": "present",
  "person": "first",
  "number": "plural",
  "mood": "indicative",
  "notes": "Present tense verb, first person plural, indicative mood"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 5 
  AND words.word_position = 2;

-- Word 16: وَإِيَّاكَ (wa iyyaka) - "and You alone"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "conjunction_pronoun",
  "conjunction": "وَ",
  "pronoun": "separated_object",
  "case": "accusative",
  "person": "second",
  "number": "singular",
  "gender": "masculine",
  "notes": "Conjunction wa (and) + separated object pronoun, accusative case"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 5 
  AND words.word_position = 3;

-- Word 17: نَسْتَعِينُ (nasta''een) - "we ask for help"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "verb",
  "form": "X",
  "tense": "present",
  "person": "first",
  "number": "plural",
  "mood": "indicative",
  "notes": "Form X verb (istafala), present tense, first person plural, indicative mood"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 5 
  AND words.word_position = 4;

-- Verse 6: اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ

-- Word 18: اهْدِنَا (Ihdina) - "Guide us"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "verb",
  "form": "I",
  "tense": "imperative",
  "person": "second",
  "number": "singular",
  "mood": "imperative",
  "notes": "Imperative verb, second person singular, with attached object pronoun na (us)"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 6 
  AND words.word_position = 1;

-- Word 19: الصِّرَاطَ (As-sirata) - "to the path"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "noun",
  "case": "accusative",
  "definiteness": "definite",
  "number": "singular",
  "notes": "Direct object (mafool bihi), accusative case, definite article al-"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 6 
  AND words.word_position = 2;

-- Word 20: الْمُسْتَقِيمَ (Al-mustaqeem) - "the straight"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "adjective",
  "case": "accusative",
  "definiteness": "definite",
  "number": "singular",
  "gender": "masculine",
  "notes": "Adjective modifying sirat, accusative case, definite article al-"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 6 
  AND words.word_position = 3;

-- Verse 7: صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ

-- Word 21: صِرَاطَ (Sirata) - "The path"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "noun",
  "case": "accusative",
  "definiteness": "definite",
  "number": "singular",
  "notes": "Apposition to previous sirat, accusative case, definite by construct state"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 7 
  AND words.word_position = 1;

-- Word 22: الَّذِينَ (Alladheena) - "of those"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "relative_pronoun",
  "case": "genitive",
  "definiteness": "definite",
  "number": "plural",
  "gender": "masculine",
  "notes": "Relative pronoun, genitive case (mudaf ilayh), masculine plural"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 7 
  AND words.word_position = 2;

-- Word 23: أَنْعَمْتَ (an''amta) - "You have bestowed favor"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "verb",
  "form": "IV",
  "tense": "past",
  "person": "second",
  "number": "singular",
  "gender": "masculine",
  "notes": "Past tense verb, second person singular, Form IV (afala)"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 7 
  AND words.word_position = 3;

-- Word 24: عَلَيْهِمْ (alayhim) - "upon them"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "preposition_pronoun",
  "preposition": "عَلَى",
  "pronoun": "attached",
  "case": "genitive",
  "person": "third",
  "number": "plural",
  "gender": "masculine",
  "notes": "Preposition ala (upon) + attached pronoun hum (them), genitive case"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 7 
  AND words.word_position = 4;

-- Word 25: غَيْرِ (ghayri) - "not"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "noun",
  "case": "genitive",
  "definiteness": "indefinite",
  "number": "singular",
  "notes": "Exception noun, genitive case, indefinite"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 7 
  AND words.word_position = 5;

-- Word 26: الْمَغْضُوبِ (Al-maghdoobi) - "of those who have evoked"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "passive_participle",
  "case": "genitive",
  "definiteness": "definite",
  "number": "plural",
  "gender": "masculine",
  "notes": "Passive participle (ism mafool), genitive case, definite article al-, masculine plural"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 7 
  AND words.word_position = 6;

-- Word 27: عَلَيْهِمْ (alayhim) - "wrath"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "preposition_pronoun",
  "preposition": "عَلَى",
  "pronoun": "attached",
  "case": "genitive",
  "person": "third",
  "number": "plural",
  "gender": "masculine",
  "notes": "Preposition ala (upon) + attached pronoun hum (them), genitive case"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 7 
  AND words.word_position = 7;

-- Word 28: وَلَا (wa la) - "and not"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "conjunction_negative",
  "conjunction": "وَ",
  "negative": "لَا",
  "notes": "Conjunction wa (and) + negative particle la (not)"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 7 
  AND words.word_position = 8;

-- Word 29: الضَّالِّينَ (Ad-dalleen) - "of those who are astray"
UPDATE words
SET grammar_info = '{
  "part_of_speech": "active_participle",
  "case": "accusative",
  "definiteness": "definite",
  "number": "plural",
  "gender": "masculine",
  "notes": "Active participle (ism fail), accusative case, definite article al-, masculine plural"
}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = 1 
  AND v.verse_number = 7 
  AND words.word_position = 9;

