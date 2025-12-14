# CURSOR PROMPT: Fix Grammar Data from Quranic Arabic Corpus

## Context
My Quranic Arabic learning platform has incorrect grammar data for Surahs 97-114. The data was generated using heuristics and has errors like classifying the preposition "مِن" (min) as a "Noun" instead of "Preposition".

## What I Need

I need you to:

1. **Download the authentic grammar data** from Quranic Arabic Corpus:
   - URL: https://archive.org/download/quranicarabiccorpus/quranic-corpus-morphology-0.4.txt
   - This is the gold standard for Quranic grammatical analysis

2. **Parse the morphology file** to extract:
   - Surah number
   - Verse number  
   - Word position
   - Part of speech (PREP, N, V, PRON, etc.)
   
3. **Generate SQL UPDATE statements** to fix the `grammar_info` column in my `words` table for:
   - **Surahs 97-114 ONLY** (skip Surah 1 - I did that manually)
   
4. **Map the Corpus POS tags** to my standardized format:
   ```
   PREP → "Preposition"
   N → "Noun"
   V → "Verb"
   PRON → "Pronoun"
   ADJ → "Adjective"
   CONJ → "Conjunction"
   P → "Particle"
   DET → "Determiner"
   NEG → "Negative Particle"
   ```

## File Format Details

The morphology file format looks like this:

```
LOCATION     (97:1:1)  <arabic_text>
PREFIX       <text>    PREP      preposition
STEM         <text>    N         noun
SUFFIX       <text>    PRON      pronoun
```

**Key points:**
- LOCATION shows (surah:verse:word_position)
- A word can have PREFIX, STEM, and/or SUFFIX
- The 3rd column (e.g., "PREP", "N") is the POS tag we need
- For compound words (PREP + N), create appropriate combined tags like "preposition_noun"

## Database Schema

My database structure:
```sql
-- Table: words
-- Columns needed:
--   - verse_id (foreign key to verses table)
--   - word_position (integer)
--   - grammar_info (jsonb)

-- The grammar_info column should be updated to:
{
  "part_of_speech": "Preposition",  // ← This is what we're fixing
  "features": ["preposition"]        // ← Optional additional features
}
```

## Expected Output

Please create:

1. **A TypeScript/JavaScript script** that:
   - Downloads the morphology file
   - Parses it for surahs 97-114
   - Generates SQL UPDATE statements
   - Saves to `update-grammar-from-corpus.sql`

2. **The SQL migration file** containing:
   - One UPDATE statement per word
   - Proper JSONB updates to `grammar_info`
   - Comments showing which surah/verse is being updated

## Example of What Should Be Fixed

**BEFORE (incorrect):**
```sql
SELECT arabic_text, grammar_info 
FROM words 
WHERE arabic_text = 'مِّنۡ';

-- Result: {"part_of_speech": "Noun", "number": "singular"}  ❌ WRONG
```

**AFTER (correct):**
```sql
-- Should be:
{"part_of_speech": "Preposition"}  ✅ CORRECT
```

## Constraints

- ✅ DO update surahs 97-114
- ❌ DO NOT touch Surah 1 (Al-Fatiha) - I did that manually
- ✅ DO handle compound words (PREP+N, PREP+PRON, CONJ+PRON)
- ✅ DO preserve any existing data in other columns
- ✅ DO use proper JSONB syntax for PostgreSQL/Supabase

## Testing

After generating the SQL, please also create a verification query:

```sql
-- This should show the distribution of parts of speech
-- After the fix, we should see many more Prepositions
SELECT 
  grammar_info->>'part_of_speech' as pos,
  COUNT(*) as count
FROM words
WHERE verse_id IN (
  SELECT id FROM verses 
  WHERE surah_id IN (
    SELECT id FROM surahs 
    WHERE surah_number BETWEEN 97 AND 114
  )
)
GROUP BY pos
ORDER BY count DESC;
```

## Additional Context

- Current wrong count: Only 38 Prepositions (way too low for Quranic text)
- Expected: Should be 150-200+ Prepositions after the fix
- Many words currently misclassified as "Noun" should be "Preposition"

## Files to Create

1. `scripts/fetch-corpus-grammar.ts` - The parsing script
2. `supabase/migrations/YYYYMMDD_fix_grammar_from_corpus.sql` - The SQL migration
3. `scripts/verify-grammar-fix.sql` - Verification queries

Please implement this now. Let me know if you need any clarification about the database structure or the expected format.
