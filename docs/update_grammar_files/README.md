# Grammar Data Fix - Complete Package

## Summary

Your grammar data has errors because it was generated using simple pattern-matching heuristics. We're fixing it by using the **Quranic Arabic Corpus** - the gold standard for Quranic grammatical analysis created by Islamic scholars.

## The Problem

**Current state:**
- Word: مِن (min) 
- Your database: `"part_of_speech": "Noun"` ❌ WRONG
- Reality: It's a **Preposition** (حرف جر)

**Root cause:**
- Your `generateGrammarInfo()` function in `scripts/generate-juz-amma-sql.ts` uses heuristics
- Pattern matching is fundamentally unreliable for Arabic grammar
- Only 38 Prepositions detected (should be 150-200+)

## The Solution

Use authentic data from **Quranic Arabic Corpus v0.4**:
- Created by Dr. Kais Dukes (University of Leeds)
- Reviewed by Islamic scholars
- 77,430 words with accurate morphological analysis
- Available under GNU License

## Files I've Created for You

### 1. `CURSOR_PROMPT.md` ⭐ START HERE
**What it is:** A complete prompt you can paste into Cursor  
**What it does:** Tells Cursor exactly how to fix your grammar data  
**How to use:** Copy the entire content and paste it into Cursor

### 2. `fetch-corpus-data.ts`
**What it is:** TypeScript script to download and parse the Corpus data  
**What it does:** 
- Downloads morphology file from Internet Archive
- Parses it for surahs 97-114
- Generates SQL UPDATE statements
- Maps Corpus POS tags to your format

**How to run:**
```bash
npx ts-node fetch-corpus-data.ts
```

**Output:** Creates `update-grammar-from-corpus.sql`

### 3. `INSTRUCTIONS.md`
**What it is:** Detailed step-by-step manual instructions  
**Who it's for:** If you want to understand the process or do it manually  
**Contains:** 
- Three different approaches (TypeScript, Python, Manual)
- File format explanations
- POS tag mappings
- Verification queries

## Recommended Next Steps

### Option A: Use Cursor (Easiest - Recommended)

1. Open Cursor
2. Copy the content from `CURSOR_PROMPT.md`
3. Paste into Cursor's chat
4. Let Cursor generate the script and SQL
5. Review the SQL file it creates
6. Run the SQL in Supabase

### Option B: Run the Script Yourself

1. Make sure you have Node.js and TypeScript installed
2. Run: `npx ts-node fetch-corpus-data.ts`
3. Review the generated `update-grammar-from-corpus.sql`
4. Run it in Supabase SQL Editor

### Option C: Manual Testing First

1. Test with a single word first (مِن):
```sql
UPDATE words 
SET grammar_info = jsonb_set(
  grammar_info,
  '{part_of_speech}',
  '"Preposition"'
)
WHERE arabic_text = 'مِّنۡ';
```

2. Verify it worked:
```sql
SELECT arabic_text, grammar_info->>'part_of_speech' 
FROM words 
WHERE arabic_text = 'مِّنۡ';
```

3. If successful, proceed with full update using Option A or B

## What Will Change

### Before:
```sql
SELECT grammar_info->>'part_of_speech' as pos, COUNT(*) 
FROM words GROUP BY pos ORDER BY COUNT(*) DESC;

-- Results:
-- Noun: 322  ← Many of these are WRONG
-- Verb: 85
-- Conjunction: 67
-- Preposition: 38  ← Way too low!
```

### After:
```sql
-- Expected results:
-- Noun: ~250 (corrected)
-- Preposition: ~180 (fixed!)
-- Verb: ~100
-- Conjunction: ~70
-- Particle: ~50 (new category)
-- Pronoun: ~40 (better identified)
```

## Important Notes

### ✅ What We're Updating
- **Surahs 97-114** (Juz Amma) - auto-generated data with errors

### ❌ What We're NOT Touching
- **Surah 1** (Al-Fatiha) - your manual data is fine, keep it

### 🔒 Safety
- The script only updates `grammar_info` column
- All other columns (arabic_text, translation, etc.) stay the same
- Always backup before running mass updates!

### 📊 Impact on Your App
After this fix:
1. **Grammar tutorials will be accurate** - LLM will receive correct POS tags
2. **No more "noun" when it should be "preposition"**
3. **Better learning experience** - students get correct grammatical info
4. **Professional quality** - using authentic Islamic scholarship

## Data Source Details

**Quranic Arabic Corpus v0.4**
- Website: https://corpus.quran.com
- Download: https://archive.org/details/quranicarabiccorpus
- License: GNU General Public License
- Created by: Dr. Kais Dukes
- Institution: University of Leeds, School of Computing

**File:** `quranic-corpus-morphology-0.4.txt`
- Size: ~269MB
- Format: Plain text with structured annotations
- Coverage: All 77,430 words of the Quran
- Accuracy: Manually verified by scholars

## POS Tag Mapping Reference

| Corpus Tag | Your Format | Arabic | Example |
|------------|-------------|--------|---------|
| PREP | Preposition | حرف جر | مِن، إلى، في |
| N | Noun | اسم | كتاب، رجل |
| V | Verb | فعل | قال، يقول |
| PRON | Pronoun | ضمير | هو، أنت |
| ADJ | Adjective | صفة | كبير، صغير |
| CONJ | Conjunction | حرف عطف | و، ف، ثم |
| DET | Determiner | أل | ال |
| P | Particle | حرف | قد، لن |
| NEG | Negative Particle | حرف نفي | لا، ما |
| INTERROG | Interrogative | حرف استفهام | هل، أ |

## Troubleshooting

### If Cursor gives an error:
- Make sure you included the full prompt
- Check that you have network access (needs to download file)
- Try running the TypeScript script manually

### If the SQL fails:
- Check your database connection
- Make sure surahs 97-114 exist in your database
- Verify the `words` table structure matches expectations

### If you want to verify before applying:
```sql
-- Count how many words will be affected
SELECT COUNT(*) 
FROM words 
WHERE verse_id IN (
  SELECT id FROM verses 
  WHERE surah_id IN (
    SELECT id FROM surahs 
    WHERE surah_number BETWEEN 97 AND 114
  )
);

-- Should be around 600-800 words
```

## Questions?

If you run into issues:
1. Check `INSTRUCTIONS.md` for detailed explanations
2. Review the example in `fetch-corpus-data.ts`
3. Test with the manual fix first (Option C above)
4. Ask me for help with specific errors

## Success Criteria

You'll know it worked when:
1. ✅ The word مِن shows as "Preposition" not "Noun"
2. ✅ Preposition count increases from 38 to ~180
3. ✅ Grammar tutorials no longer say "مِن is a noun"
4. ✅ POS distribution looks natural for Quranic text

---

**Ready to fix your grammar data?**

👉 Start with `CURSOR_PROMPT.md` - copy it into Cursor and let it do the work!

Good luck, mate! 🚀
