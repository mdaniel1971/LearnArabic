# Pronoun Classification Issue - Diagnostic Results

## Step 1: Diagnostic Analysis

### Issue Identified
The word **هُمۡ** (hum - "they") in Surah 78:3 is incorrectly classified as "Noun" when it should be "Pronoun".

### Root Cause Found

Looking at the Quranic Arabic Corpus data for 78:3:2:1:
```
78:3:2:1	هُمْ	N	PRON|3MP
```

**The Problem:**
- The corpus POS tag is `N` (which our code maps to "Noun")
- But the features include `PRON|3MP` (indicating it's a pronoun - 3rd person masculine plural)
- Our `determineMainPOS` function in `parse-morphology.ts` checks the POS tag first (`N` → "Noun") and doesn't properly check for `PRON` in the features array

### Current Classification Logic Issue

In `docs/corpus-files/parse-morphology.ts`, the `determineMainPOS` function:
1. Looks at the stem POS tag first (`N`, `V`, `P`, etc.)
2. Maps `N` → "Noun" 
3. Only checks for pronoun suffixes (`SUFF` with `PRON`), not standalone pronouns

**Missing Logic:** When a segment has POS=`N` but features include `PRON`, it should be classified as "Pronoun", not "Noun".

### SQL Diagnostic Queries

Run these queries in Supabase SQL Editor to see the full extent of the issue:

See `scripts/diagnostic-queries.sql` for:
1. Distribution of part_of_speech values
2. Specific check of هُمۡ in 78:3
3. All potentially misclassified pronouns
4. Examples of correctly classified pronouns

## Step 2: Root Cause Investigation

### Corpus Data Format
Format: `surah:verse:word:segment TAB arabic TAB pos TAB features`

Example for هُمۡ:
- Location: `78:3:2:1`
- Arabic: `هُمْ`
- POS: `N`
- Features: `PRON|3MP`

### Mapping Logic
Current mapping in `parse-morphology.ts`:
- `N` → "Noun" (incorrect for standalone pronouns)
- Should check: If features contain `PRON` and no stem (not a suffix), then → "Pronoun"

### Where It Went Wrong
The `determineMainPOS` function handles:
- ✅ Noun + Pronoun suffix (compound words)
- ✅ Verb + Pronoun suffix (compound words)  
- ❌ **Standalone pronouns** (POS=N with PRON feature) - **MISSING**

## Step 3: Fix Required

Update `determineMainPOS` to:
1. Check if a segment has `PRON` in features
2. If it's a standalone segment (not a suffix), classify as "Pronoun"
3. Extract pronoun details (person, number, gender) from features like `3MP` (3rd person masculine plural)

