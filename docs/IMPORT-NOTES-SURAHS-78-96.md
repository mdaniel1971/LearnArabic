# Critical Import Notes for Surahs 78-96 (and Future Juz Imports)

## ⚠️ CRITICAL: Arabic Text Encoding Issue

### Problem
The `@kmaslesa/holy-quran-word-by-word-full-data` package uses **Arabic Presentation Forms** (U+FB50-U+FDFF) instead of **standard Arabic characters** (U+0600-U+06FF). This causes Arabic text to display incorrectly in the database and frontend.

### Solution
**ALWAYS** use the following approach for importing Arabic text:

1. **Arabic Verse Text**: Use `quran-json` CDN
   - URL: `https://cdn.jsdelivr.net/npm/quran-json@3.1.2/dist/chapters/{surahNumber}.json`
   - This provides standard Arabic encoding (U+0600-U+06FF)
   - Extract verse text from `verse.text` or `verse.text_arabic`

2. **Arabic Word Text**: Split verse text from CDN, NOT from @kmaslesa package
   - Use `splitArabicIntoWords(verseText)` function
   - Split by spaces: `verseText.trim().split(/\s+/).filter(w => w.length > 0)`
   - **NEVER** use `word.text` from @kmaslesa package for Arabic text

3. **Translations/Transliterations**: Use @kmaslesa package
   - Use `word.translation.text` and `word.transliteration.text`
   - Match by position: `translationWords[wordIndex]`

### Code Pattern

```typescript
// ✅ CORRECT: Get Arabic from CDN
const verseTexts = await fetchVerseTextFromCDN(surahNumber);
const verseText = verseTexts[ayah.ayah];
const arabicWords = splitArabicIntoWords(verseText); // Split CDN text

// Get translations from @kmaslesa package
const translationWords = ayah.words || [];

const wordsToInsert = arabicWords.map((arabicWord, wordIndex) => {
  const translationWord = translationWords[wordIndex] || null;
  
  return {
    text_arabic: arabicWord, // ✅ CDN word (standard encoding)
    transliteration: translationWord?.transliteration?.text || null, // ✅ From package
    translation_english: translationWord?.translation?.text || null, // ✅ From package
  };
});
```

```typescript
// ❌ WRONG: Using Arabic from @kmaslesa package
const wordsToInsert = ayah.words.map((word) => {
  return {
    text_arabic: word.text, // ❌ Presentation Forms encoding!
  };
});
```

### Verification

After import, verify encoding:

```sql
-- Check a sample word
SELECT text_arabic FROM words 
JOIN verses ON words.verse_id = verses.id
JOIN surahs ON verses.surah_id = surahs.id
WHERE surahs.surah_number = 78 AND verses.verse_number = 1 AND words.word_position = 1;

-- Should display standard Arabic characters, not broken/incorrect characters
```

Or in Node.js:
```javascript
const arabic = "بِسْمِ"; // Sample from database
const isStandard = /[\u0600-\u06FF]/.test(arabic);
console.log('Is standard Arabic?', isStandard); // Should be true
```

### Files to Update

When creating import scripts for future juz sections, ensure:

1. **`fetchVerseTextFromCDN()`** function fetches from quran-json CDN
2. **`splitArabicIntoWords()`** function splits CDN verse text
3. **`insertWords()`** function uses split CDN words, not package words
4. **Translations** are matched by position from @kmaslesa package

### Related Documentation

- See `docs/ENCODING_FIX.md` for original fix documentation
- See `scripts/generate-juz-amma-sql.ts` for reference implementation

## Summary

**Rule of Thumb**: 
- **Arabic text** = Always from CDN (quran-json)
- **Translations/Transliterations** = From @kmaslesa package
- **Grammar data** = From quran-morphology.txt

This ensures all Arabic text uses standard encoding and displays correctly throughout the application.

