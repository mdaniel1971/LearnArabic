-- Add verb form information to verbs in surahs 97-114
-- Source: quran-morphology.txt
-- Extracted from VF:X code in morphology features (VF:1 = Form I, VF:2 = Form II, etc.)
-- Generated: 2025-12-07T23:30:53.233Z


-- ========== SURAH 97 ==========

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 1
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 2
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 5"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 97
  AND v.verse_number = 4
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

-- ========== SURAH 98 ==========

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 4
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 1
)
AND word_position = 11
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 2
)
AND word_position = 4
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 5"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 4
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 4
)
AND word_position = 4
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 4
)
AND word_position = 10
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 4
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 10
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 5
)
AND word_position = 12
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 6
)
AND word_position = 3
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 7
)
AND word_position = 3
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 7
)
AND word_position = 4
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 6
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 13
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 16
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 98
  AND v.verse_number = 8
)
AND word_position = 20
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

-- ========== SURAH 99 ==========

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 1
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 2
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 3
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 2"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 4
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 5
)
AND word_position = 3
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 6
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 6
)
AND word_position = 5
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 7
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 7
)
AND word_position = 6
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 8
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 99
  AND v.verse_number = 8
)
AND word_position = 6
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

-- ========== SURAH 100 ==========

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 4
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 5
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 9
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 9
)
AND word_position = 4
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 2"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 100
  AND v.verse_number = 10
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

-- ========== SURAH 101 ==========

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 3
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 4
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 5
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 6
)
AND word_position = 3
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 8
)
AND word_position = 3
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 101
  AND v.verse_number = 10
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

-- ========== SURAH 102 ==========

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 1
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 2
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 3
)
AND word_position = 3
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 4
)
AND word_position = 4
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 5
)
AND word_position = 3
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 6
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 7
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 102
  AND v.verse_number = 8
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

-- ========== SURAH 103 ==========

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 3
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 4
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 6"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 6
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 6"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 103
  AND v.verse_number = 3
)
AND word_position = 8
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

-- ========== SURAH 104 ==========

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 2
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 2"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 2
)
AND word_position = 4
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 3
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 3
)
AND word_position = 4
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 4
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 5
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 8"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 104
  AND v.verse_number = 7
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

-- ========== SURAH 105 ==========

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 1
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 1
)
AND word_position = 4
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 2
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 3
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 4
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 105
  AND v.verse_number = 5
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

-- ========== SURAH 106 ==========

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 3
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 4
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 106
  AND v.verse_number = 4
)
AND word_position = 5
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

-- ========== SURAH 107 ==========

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 1
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 2"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 1
)
AND word_position = 3
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 2
)
AND word_position = 3
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 3
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 3"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 6
)
AND word_position = 3
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 107
  AND v.verse_number = 7
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

-- ========== SURAH 108 ==========

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 4"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 1
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 2"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 2
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 108
  AND v.verse_number = 2
)
AND word_position = 3
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

-- ========== SURAH 109 ==========

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 1
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 2
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 2
)
AND word_position = 4
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 3
)
AND word_position = 5
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 4
)
AND word_position = 5
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 109
  AND v.verse_number = 5
)
AND word_position = 5
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

-- ========== SURAH 110 ==========

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 1
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 2
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 2
)
AND word_position = 3
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 2"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 3
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 10"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 3
)
AND word_position = 4
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 110
  AND v.verse_number = 3
)
AND word_position = 6
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

-- ========== SURAH 111 ==========

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 1
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 1
)
AND word_position = 5
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 2
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 2
)
AND word_position = 6
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 111
  AND v.verse_number = 3
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

-- ========== SURAH 112 ==========

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 1
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 3
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 3
)
AND word_position = 4
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 112
  AND v.verse_number = 4
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

-- ========== SURAH 113 ==========

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 1
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 1
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 2
)
AND word_position = 4
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 3
)
AND word_position = 5
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 113
  AND v.verse_number = 5
)
AND word_position = 5
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

-- ========== SURAH 114 ==========

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 1
)
AND word_position = 1
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 1
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"Form 1"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = 114
  AND v.verse_number = 5
)
AND word_position = 2
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');

-- Total verbs updated: 109