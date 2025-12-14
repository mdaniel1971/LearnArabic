# Fix Grammar Data Using Quranic Arabic Corpus

## Overview
Your current grammar data has errors because it was generated using heuristics. We're going to replace it with authentic data from the Quranic Arabic Corpus.

## Option 1: Quick Fix with Pre-Made Script (Recommended for Cursor)

### Step 1: Download the Corpus Data

The easiest way is to download the morphology file directly:

```bash
curl -o quranic-corpus-morphology-0.4.txt https://archive.org/download/quranicarabiccorpus/quranic-corpus-morphology-0.4.txt
```

Or download it manually from: https://archive.org/details/quranicarabiccorpus

### Step 2: Use the TypeScript Parser

I've created `fetch-corpus-data.ts` which will:
1. Parse the downloaded file
2. Extract morphology for Surahs 97-114 only (keeping your manual Al-Fatiha)
3. Generate SQL UPDATE statements

Run it:
```bash
npm install --save-dev @types/node
npx ts-node fetch-corpus-data.ts
```

This will create: `update-grammar-from-corpus.sql`

### Step 3: Apply the Updates

Run the generated SQL in Supabase:
```bash
psql YOUR_DATABASE_URL < update-grammar-from-corpus.sql
```

Or manually copy/paste into Supabase SQL editor.

---

## Option 2: Python Script (Alternative)

If you prefer Python, here's a simpler script:

```python
import requests
import json
import re

# Download the data
url = 'https://archive.org/download/quranicarabiccorpus/quranic-corpus-morphology-0.4.txt'
response = requests.get(url)
data = response.text

# Parse the file
updates = []
current_location = None
morph_parts = []

for line in data.split('\n'):
    # Skip comments
    if line.startswith('#') or not line.strip():
        continue
    
    # Parse location: (surah:verse:word)
    loc_match = re.match(r'LOCATION\s+\((\d+):(\d+):(\d+)\)', line)
    if loc_match:
        surah, verse, word = map(int, loc_match.groups())
        
        # Only process surahs 97-114 (skip Al-Fatiha which you did manually)
        if 97 <= surah <= 114:
            current_location = (surah, verse, word)
            morph_parts = []
        else:
            current_location = None
        continue
    
    # Parse morphology
    morph_match = re.match(r'^(PREFIX|STEM|SUFFIX)\s+\S+\s+(\S+)', line)
    if morph_match and current_location:
        morph_parts.append(morph_match.group(2))

# Convert POS tags to your format
pos_map = {
    'PREP': 'Preposition',
    'N': 'Noun',
    'V': 'Verb',
    'PRON': 'Pronoun',
    'ADJ': 'Adjective',
    'CONJ': 'Conjunction',
    'P': 'Particle',
    # Add more as needed
}

# Generate SQL (simplified version - you'll need to adapt this)
print("-- Update grammar_info from Quranic Arabic Corpus")
```

---

## Option 3: Manual Sample Fix (For Testing)

To quickly verify this works, let's manually fix the word **مِن (min)** first:

### Find the correct data for مِن

According to Quranic Arabic Corpus, **مِن** is classified as:
- **Part of Speech**: Preposition (PREP)
- **Type**: حرف جر (Harf Jarr)

### Update SQL:

```sql
-- Fix the word مِن (min) - it's a PREPOSITION, not a Noun
UPDATE words 
SET grammar_info = jsonb_set(
  grammar_info,
  '{part_of_speech}',
  '"Preposition"'
)
WHERE arabic_text = 'مِّنۡ'
  OR transliteration LIKE '%min%';

-- Verify the fix
SELECT 
  arabic_text,
  transliteration,
  translation,
  grammar_info->>'part_of_speech' as pos
FROM words
WHERE arabic_text = 'مِّنۡ'
  OR transliteration LIKE '%min%'
LIMIT 5;
```

Run this in Supabase to fix just the مِن issue as a test.

---

## Understanding the Corpus Data Format

The file `quranic-corpus-morphology-0.4.txt` looks like this:

```
LOCATION     (1:1:1)  bismil~ahi
PREFIX       bi       PREP    preposition
STEM         {isotam  N       noun
SUFFIX       hi       PRON    pronoun

LOCATION     (1:1:2)  ar-raHoma`ni
PREFIX       Al       DET     determiner
STEM         raHoma`n N       noun
```

**Key fields:**
- LOCATION: (surah:verse:word_position)
- PREFIX/STEM/SUFFIX: The morphological breakdown
- Second column: Arabic transliteration
- Third column: **POS tag** (this is what we need!)
- Fourth column: English description

---

## Part of Speech Mapping

The Corpus uses these tags (map them to your format):

| Corpus Tag | Your Format | Arabic Term |
|------------|-------------|-------------|
| PREP | Preposition | حرف جر |
| N | Noun | اسم |
| V | Verb | فعل |
| PRON | Pronoun | ضمير |
| ADJ | Adjective | صفة |
| CONJ | Conjunction | حرف عطف |
| DET | Determiner | أل |
| P | Particle | حرف |
| NEG | Negative Particle | حرف نفي |

---

## Next Steps

**Choose one approach:**

1. ✅ **Cursor Approach** (Recommended): 
   - Give Cursor the `fetch-corpus-data.ts` file
   - Ask it to run it and generate the SQL
   - Review and apply the SQL updates

2. 🐍 **Python Approach**: 
   - If you're more comfortable with Python
   - Adapt the script above

3. 🔧 **Manual Approach**: 
   - Start with the sample fix for مِن
   - Verify it works
   - Then apply the full dataset

**My recommendation:** Use Cursor with the TypeScript script. It's the cleanest approach and will generate a complete migration file you can review before applying.

---

## Verifying the Fix

After updating, check a few words:

```sql
-- Check مِن (should be Preposition)
SELECT arabic_text, grammar_info->>'part_of_speech' 
FROM words 
WHERE arabic_text = 'مِّنۡ';

-- Check distribution of parts of speech
SELECT 
  grammar_info->>'part_of_speech' as pos,
  COUNT(*) 
FROM words 
GROUP BY pos 
ORDER BY COUNT(*) DESC;
```

You should now see **many more Prepositions** than the 38 you currently have!

---

## Important Notes

1. **Keep Al-Fatiha (Surah 1)** - Your manual data for this is probably better detailed
2. **Backup first** - Always backup before running mass updates
3. **Test on one surah** - Try Surah 114 first to verify the process works
4. **Review edge cases** - Some compound words may need special handling

Let me know which approach you want to take and I'll help you through it!
