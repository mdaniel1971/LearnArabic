# Arabic Text Encoding Fix for Surahs 97-114

## Problem Identified

Surahs 97-114 were displaying with broken/incorrect Arabic characters because the `@kmaslesa/holy-quran-word-by-word-full-data` package uses **Arabic Presentation Forms** (U+FB80 range) instead of **standard Arabic characters** (U+0600-U+06FF).

### Comparison

**Al-Fatiha (Correct)**:
- Uses standard Arabic: `'بِسْمِ'` (U+0628 = ب)
- Displays correctly in database and frontend

**Surahs 97-114 (Before Fix)**:
- Used Presentation Forms: `'ﭑ'` (U+FB80)
- Displayed as broken/incorrect characters

## Solution

Updated `scripts/generate-juz-amma-sql.ts` to:
1. **Use `quran-json` CDN** for Arabic text (standard encoding U+0600-U+06FF)
2. **Use `@kmaslesa` package** for translations and transliterations
3. Combine both sources to generate SQL files with correct encoding

## Verification

After running the script, verify the encoding:

```bash
# Check a sample verse
node -e "const fs = require('fs'); const content = fs.readFileSync('supabase/migrations/20240101000008_insert_juz_amma_verses.sql', 'utf-8'); const match = content.match(/'([^']+)'/); if (match) { const arabic = match[1]; console.log('Sample:', arabic); console.log('Is standard Arabic?', /[\u0600-\u06FF]/.test(arabic)); }"
```

Expected output:
- ✅ `Is standard Arabic? true`
- ✅ Arabic text displays correctly: `'إِنَّآ أَنزَلۡنَٰهُ فِي لَيۡلَةِ ٱلۡقَدۡرِ'`

## Next Steps

1. **Delete broken data** (if already inserted):
   ```sql
   -- Run the rollback script
   -- supabase/migrations/20240101000006_rollback_to_al_fatiha.sql
   ```

2. **Regenerate SQL files**:
   ```bash
   npm run generate-juz-amma-sql
   ```

3. **Execute SQL files in Supabase** (in order):
   - `20240101000007_insert_juz_amma_surahs.sql`
   - `20240101000008_insert_juz_amma_verses.sql`
   - `20240101000009_insert_juz_amma_words.sql`
   - `20240101000010_update_juz_amma_grammar.sql`

4. **Verify in database**:
   ```sql
   -- Check a verse from Surah 114
   SELECT text_arabic FROM verses 
   JOIN surahs ON verses.surah_id = surahs.id 
   WHERE surahs.surah_number = 114 AND verses.verse_number = 1;
   
   -- Should display: 'قُلۡ أَعُوذُ بِرَبِّ ٱلنَّاسِ'
   ```

5. **Test in frontend**:
   - Navigate to `/surah/114`
   - Verify Arabic text displays correctly
   - Click words to verify translations appear

## Technical Details

### Encoding Ranges
- **Standard Arabic**: U+0600-U+06FF (used by Al-Fatiha and quran-json CDN)
- **Presentation Forms**: U+FB50-U+FDFF (used by @kmaslesa package)

### Data Sources
- **Arabic Text**: `https://cdn.jsdelivr.net/npm/quran-json@3.1.2/dist/chapters/{surahNumber}.json`
- **Translations**: `@kmaslesa/holy-quran-word-by-word-full-data` package

### Word Matching
The script matches Arabic words from the CDN with translations from the package by position. If a translation is missing for a word, it will be `NULL` in the database.

