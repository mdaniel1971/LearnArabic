# Quranic Arabic Learning Platform - Database Population Documentation

## Table of Contents
1. [Overview](#overview)
2. [Database Schema](#database-schema)
3. [Al-Fatiha Population Process](#al-fatiha-population-process)
4. [Data Format Specifications](#data-format-specifications)
5. [Rollback Procedure](#rollback-procedure)
6. [Replication Process for Surahs 97-114](#replication-process-for-surahs-97-114)

---

## Overview

This document details how the Quranic Arabic Learning Platform database is populated, specifically documenting the process used for Al-Fatiha (Surah 1) and how to replicate it for other surahs (97-114).

**Key Principle**: Al-Fatiha was created manually via SQL migrations. To maintain consistency, all other surahs should follow the exact same format and process.

---

## Database Schema

### Tables Structure

#### `surahs` Table
- `id` (BIGINT, PRIMARY KEY, AUTO_INCREMENT)
- `surah_number` (INTEGER, UNIQUE) - The surah number (1-114)
- `name_arabic` (TEXT) - Fully vowelized Arabic name
- `name_english` (TEXT) - English name
- `total_verses` (INTEGER) - Number of verses in the surah

#### `verses` Table
- `id` (BIGINT, PRIMARY KEY, AUTO_INCREMENT)
- `surah_id` (BIGINT, FOREIGN KEY → surahs.id)
- `verse_number` (INTEGER) - Verse number within the surah (1-based)
- `text_arabic` (TEXT) - Fully vowelized Arabic text with complete tashkeel
- UNIQUE constraint on `(surah_id, verse_number)`

#### `words` Table
- `id` (BIGINT, PRIMARY KEY, AUTO_INCREMENT)
- `verse_id` (BIGINT, FOREIGN KEY → verses.id)
- `word_position` (INTEGER) - Position of word within verse (1-based)
- `text_arabic` (TEXT) - Fully vowelized Arabic word with complete tashkeel
- `transliteration` (TEXT) - Simple transliteration
- `translation_english` (TEXT) - English translation
- `grammar_info` (JSONB) - Grammar information (added separately)
- UNIQUE constraint on `(verse_id, word_position)`

---

## Al-Fatiha Population Process

### Step 1: Insert Surah Metadata
**File**: `supabase/migrations/20240101000001_insert_al_fatiha.sql`

```sql
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (1, 'الْفَاتِحَة', 'The Opening', 7)
ON CONFLICT (surah_number) DO UPDATE SET name_english = 'The Opening';
```

**Format**:
- `name_arabic`: Fully vowelized with all diacritics (الْفَاتِحَة)
- `name_english`: Title case English name
- `total_verses`: Exact count

### Step 2: Insert Verses
**File**: `supabase/migrations/20240101000001_insert_al_fatiha.sql`

Each verse is inserted individually:

```sql
INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, 1, 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ'
FROM surahs s WHERE s.surah_number = 1
ON CONFLICT (surah_id, verse_number) DO NOTHING;
```

**Format**:
- Uses `SELECT` to get `surah_id` from `surahs` table
- `text_arabic`: Fully vowelized Arabic with complete tashkeel (all diacritics)
- `ON CONFLICT DO NOTHING` for idempotency

### Step 3: Insert Words
**File**: `supabase/migrations/20240101000002_insert_al_fatiha_words.sql`

Each word is inserted individually:

```sql
INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, 1, 'بِسْمِ', 'bismi', 'In the name of'
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = 1 AND v.verse_number = 1
ON CONFLICT (verse_id, word_position) DO NOTHING;
```

**Format**:
- Uses `SELECT` with `JOIN` to get `verse_id`
- `text_arabic`: Fully vowelized Arabic word (e.g., 'بِسْمِ')
- `transliteration`: Simple format, no hyphens (e.g., 'bismi', not 'bi-smi')
- `translation_english`: Natural English translation (e.g., 'In the name of')
- `ON CONFLICT DO NOTHING` for idempotency

### Step 4: Add Grammar Information
**File**: `supabase/migrations/20240101000004_update_al_fatiha_grammar.sql`

Grammar info is added via `UPDATE` statements:

```sql
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
```

**Format**:
- JSONB format with structured grammar information
- Includes: part_of_speech, case, definiteness, number, gender, tense, person, mood, form, notes
- Uses `FROM` clause with JOINs to identify the word

---

## Data Format Specifications

### Arabic Text Format
- **Must include all diacritical marks (tashkeel)**
- Examples:
  - ✅ Correct: 'بِسْمِ' (with kasrah, sukun)
  - ❌ Incorrect: 'بسم' (without diacritics)
- Full vowelization is critical for pronunciation learning

### Transliteration Format
- **Simple, readable format**
- No hyphens unless necessary for clarity
- Examples:
  - ✅ Correct: 'bismi', 'Allahi', 'Ar-Rahman'
  - ❌ Incorrect: 'bi-smi', 'Al-lahi', 'Ar-Rah-man'
- Capitalize proper nouns and divine names

### Translation Format
- **Natural, readable English**
- Include articles (a, an, the) where appropriate
- Examples:
  - ✅ Correct: 'In the name of', 'of Allah', 'the Most Gracious'
  - ❌ Incorrect: 'In name of', 'Allah', 'Most Gracious'
- Use title case for divine attributes

### Grammar Info Format
- **JSONB structure** with the following fields:
  - `part_of_speech`: string (e.g., "noun", "verb", "preposition")
  - `case`: string (e.g., "nominative", "accusative", "genitive")
  - `definiteness`: string (e.g., "definite", "indefinite")
  - `number`: string (e.g., "singular", "dual", "plural")
  - `gender`: string (e.g., "masculine", "feminine")
  - `tense`: string (e.g., "past", "present", "imperative")
  - `person`: string (e.g., "first", "second", "third")
  - `mood`: string (e.g., "indicative", "subjunctive", "jussive")
  - `form`: string (e.g., "I", "II", "III" for verb forms)
  - `notes`: string (additional grammatical notes)

---

## Rollback Procedure

### SQL Script
**File**: `supabase/migrations/20240101000006_rollback_to_al_fatiha.sql`

Execute in Supabase SQL Editor:

```sql
-- Delete words from surahs other than Fatiha
DELETE FROM words 
WHERE verse_id IN (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number != 1
);

-- Delete verses from surahs other than Fatiha
DELETE FROM verses 
WHERE surah_id IN (
  SELECT id FROM surahs WHERE surah_number != 1
);

-- Delete all surahs except Fatiha
DELETE FROM surahs WHERE surah_number != 1;
```

### Verification Queries

After rollback, run these to verify:

```sql
-- Should return only 1 row (Al-Fatiha)
SELECT * FROM surahs;

-- Should return 7 (Al-Fatiha's verses)
SELECT COUNT(*) FROM verses;

-- Should return 29 (Al-Fatiha's words)
SELECT COUNT(*) FROM words;
```

---

## Replication Process for Surahs 97-114

### Current State

**Al-Fatiha (Surah 1)**:
- ✅ Created manually via SQL migrations
- ✅ Fully vowelized Arabic text
- ✅ Simple transliterations
- ✅ Natural English translations
- ✅ Detailed grammar_info JSONB
- ✅ Works perfectly

**Surahs 97-114 (Juz Amma)**:
- ⚠️ Currently populated via `scripts/populate-juz-amma.ts`
- ⚠️ Uses `@kmaslesa/holy-quran-word-by-word-full-data` package
- ⚠️ Different data source than Al-Fatiha
- ⚠️ May have different formatting/quality

### Ideal Approach: Replicate Al-Fatiha Process

To replicate Al-Fatiha's process exactly for surahs 97-114, we need to:

1. **Use the same data source format** as Al-Fatiha
2. **Follow the exact same SQL structure**
3. **Maintain the same field formats**

### Data Source Challenge

Al-Fatiha was created **manually** with data that had:
- Fully vowelized Arabic text
- Simple transliterations (e.g., 'bismi', not 'bi-smi')
- Natural English translations (e.g., 'In the name of', not 'In name of')
- Detailed grammar information

**Challenge**: Finding a data source that matches Al-Fatiha's format exactly is difficult. The current `populate-juz-amma.ts` script uses a different package that may have different formatting.

### Replication Options

#### Option 1: Manual SQL Files (Ideal but Time-Consuming)
Create SQL migration files following the exact same pattern as Al-Fatiha:

- `20240101000007_insert_juz_amma_surahs.sql` - Surah metadata
- `20240101000008_insert_juz_amma_verses.sql` - Verse text
- `20240101000009_insert_juz_amma_words.sql` - Word-by-word data
- `20240101000010_update_juz_amma_grammar.sql` - Grammar information

**Pros**: Exact same format, guaranteed consistency
**Cons**: Very time-consuming, requires manual data entry

#### Option 2: SQL Generation Script ✅ **IMPLEMENTED**
Create a script that generates SQL files following Al-Fatiha's exact pattern:

**File**: `scripts/generate-juz-amma-sql.ts` ✅

The script:
1. ✅ Uses `@kmaslesa/holy-quran-word-by-word-full-data` package with fully vowelized Arabic
2. ✅ Generates SQL files with the exact same INSERT/UPDATE patterns as Al-Fatiha
3. ✅ Formats transliterations and translations to match Al-Fatiha's style
4. ✅ Generates grammar_info updates with basic tags

**Output Files**:
- `20240101000007_insert_juz_amma_surahs.sql` - Surah metadata
- `20240101000008_insert_juz_amma_verses.sql` - Verse text
- `20240101000009_insert_juz_amma_words.sql` - Word-by-word data
- `20240101000010_update_juz_amma_grammar.sql` - Grammar information

**Usage**:
```bash
npm run generate-juz-amma-sql
```

**Note**: The package uses Arabic Presentation Forms (U+FB80 range) instead of standard Arabic (U+0600-U+06FF), but the SQL structure and format match Al-Fatiha exactly.

**Pros**: Automated, maintains SQL pattern, ready to use
**Cons**: Arabic encoding differs slightly from Al-Fatiha (but still valid)

#### Option 3: Adapt Current Script
Modify `scripts/populate-juz-amma.ts` to:
1. Format data to match Al-Fatiha's style
2. Use the same transliteration format
3. Use the same translation format
4. Generate grammar_info in the same JSONB structure

**Pros**: Already working, just needs formatting adjustments
**Cons**: May not match Al-Fatiha exactly

### Key Requirements for Replication

1. **Same SQL Pattern**: Use identical INSERT/UPDATE patterns as Al-Fatiha
2. **Same Data Quality**: 
   - Fully vowelized Arabic
   - Simple transliterations (no hyphens)
   - Natural English translations (with articles)
3. **Same Grammar Detail**: Comprehensive grammar_info JSONB
4. **Idempotency**: All operations use `ON CONFLICT DO NOTHING` or `ON CONFLICT DO UPDATE`

### Recommended Approach ✅ **IMPLEMENTED**

**Option 2 (SQL Generation Script) is now implemented and ready to use!**

The script `scripts/generate-juz-amma-sql.ts` generates SQL migration files that:
- ✅ Follow Al-Fatiha's exact SQL pattern
- ✅ Use the same INSERT/UPDATE structure
- ✅ Format transliterations and translations to match Al-Fatiha's style
- ✅ Generate grammar_info updates

**To use**:
1. Run: `npm run generate-juz-amma-sql`
2. Review the generated SQL files in `supabase/migrations/`
3. Execute them in Supabase SQL Editor in order (07 → 08 → 09 → 10)
4. Verify the data matches Al-Fatiha's format

**Note**: The Arabic text uses Presentation Forms encoding (valid but different from Al-Fatiha's standard encoding). The SQL structure and format match exactly.

---

## Summary

**Al-Fatiha Process**:
1. Manual SQL migrations
2. Fully vowelized Arabic text
3. Simple transliterations
4. Natural English translations
5. Detailed grammar_info JSONB
6. Idempotent operations

**Replication for 97-114**:
- Follow the exact same pattern
- Use the same data format
- Maintain the same quality standards
- Create similar migration files

**Key Takeaway**: Al-Fatiha works perfectly. Replicate its exact process for consistency and reliability.

---

## Files Reference

### Migration Files
- `20240101000000_create_quran_schema.sql` - Database schema
- `20240101000001_insert_al_fatiha.sql` - Al-Fatiha surah and verses
- `20240101000002_insert_al_fatiha_words.sql` - Al-Fatiha words
- `20240101000003_add_grammar_info.sql` - Grammar_info column
- `20240101000004_update_al_fatiha_grammar.sql` - Al-Fatiha grammar
- `20240101000005_create_quiz_tables.sql` - Quiz tables
- `20240101000006_rollback_to_al_fatiha.sql` - Rollback script

### Scripts
- `scripts/populate-juz-amma.ts` - Direct database population script (uses `@kmaslesa/holy-quran-word-by-word-full-data` package)
- `scripts/add-word-translations.ts` - Adds translations to existing words
- `scripts/generate-juz-amma-sql.ts` - ✅ **SQL Generation Script** - Generates SQL migration files following Al-Fatiha's exact pattern

### Documentation
- `DOCUMENTATION.md` - This file

---

## Quick Reference

### Al-Fatiha Data Format Examples

**Surah**:
- Arabic: `'الْفَاتِحَة'` (fully vowelized)
- English: `'The Opening'`
- Verses: `7`

**Verse**:
- Arabic: `'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ'` (fully vowelized)

**Word**:
- Arabic: `'بِسْمِ'` (fully vowelized)
- Transliteration: `'bismi'` (simple, no hyphens)
- Translation: `'In the name of'` (natural English with articles)

**Grammar Info**:
```json
{
  "part_of_speech": "preposition_noun",
  "preposition": "بِ",
  "noun": "اسم",
  "case": "genitive",
  "definiteness": "indefinite",
  "number": "singular",
  "notes": "Preposition bi (in) + noun ism (name) in construct state"
}
```

---

## Next Steps

1. **Rollback**: Execute `20240101000006_rollback_to_al_fatiha.sql` to restore to Al-Fatiha only
2. **Verify**: Run verification queries to confirm rollback
3. **Replicate**: Create SQL migration files for surahs 97-114 following Al-Fatiha's exact pattern
4. **Test**: Verify data format matches Al-Fatiha exactly

