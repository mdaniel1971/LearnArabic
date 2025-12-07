# Arabic Text Styling Guide

This guide explains how to properly display Arabic text (with full diacritical marks) throughout the application.

## Font Configuration

All Arabic text uses the **Amiri** font at **24px** for optimal readability of diacritical marks (tashkeel/vowels).

## Usage Methods

### 1. Using the ArabicText Component (Recommended)

```tsx
import ArabicText from '@/components/ArabicText';

// Default styling
<ArabicText>بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ</ArabicText>

// For verses
<ArabicText variant="verse">الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ</ArabicText>

// For individual words
<ArabicText variant="word">اللَّهِ</ArabicText>
```

### 2. Using CSS Classes

```tsx
// Base Arabic class
<span className="arabic">بِسْمِ اللَّهِ</span>

// For verses
<span className="arabic-verse">الْحَمْدُ لِلَّهِ</span>

// For words
<span className="arabic-word">اللَّهِ</span>
```

### 3. Using lang="ar" Attribute

Any element with `lang="ar"` will automatically get Arabic styling:

```tsx
<span lang="ar">بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ</span>
```

### 4. Using Tailwind Classes

```tsx
<span className="font-arabic text-arabic">بِسْمِ اللَّهِ</span>
```

## Styling Details

- **Font**: Amiri (Google Fonts)
- **Size**: 24px
- **Line Height**: 1.8 (for verses: 2.0)
- **Direction**: RTL (right-to-left)
- **Text Align**: Right

## Database Requirements

All Arabic text stored in the database must include **full vowelization (tashkeel)**:

- ✅ Correct: `بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ`
- ❌ Incorrect: `بسم الله الرحمن الرحيم`

The diacritical marks are essential for proper pronunciation learning.

## Example: Displaying a Verse

```tsx
import ArabicText from '@/components/ArabicText';
import { Verse } from '@/types/quran';

function VerseDisplay({ verse }: { verse: Verse }) {
  return (
    <div>
      <ArabicText variant="verse">{verse.text_arabic}</ArabicText>
      <p className="text-sm text-gray-600 mt-2">Verse {verse.verse_number}</p>
    </div>
  );
}
```

## Example: Displaying Words

```tsx
import ArabicText from '@/components/ArabicText';
import { Word } from '@/types/quran';

function WordDisplay({ word }: { word: Word }) {
  return (
    <div className="flex flex-col items-end">
      <ArabicText variant="word">{word.text_arabic}</ArabicText>
      {word.transliteration && (
        <p className="text-sm italic">{word.transliteration}</p>
      )}
      {word.translation_english && (
        <p className="text-sm">{word.translation_english}</p>
      )}
    </div>
  );
}
```

