/**
 * Fix Arabic Encoding for Existing Surahs (78-114)
 * 
 * This script fixes the Arabic text encoding issue for surahs that were imported
 * using the @kmaslesa package (which uses Presentation Forms instead of standard Arabic).
 * 
 * It re-imports Arabic text from quran-json CDN (standard encoding) while preserving
 * translations, transliterations, and grammar_info.
 * 
 * Fixes surahs 78-96 and 97-114 (all surahs except Al-Fatiha which was manually created).
 * 
 * Usage: npx tsx scripts/fix-arabic-encoding-existing-surahs.ts
 */

import { config } from 'dotenv';
import { resolve } from 'path';
import { createClient } from '@supabase/supabase-js';

// Load environment variables
config({ path: resolve(process.cwd(), '.env.local') });
config({ path: resolve(process.cwd(), '.env') });

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_KEY || process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
  console.error('❌ Missing SUPABASE_URL or SUPABASE_SERVICE_KEY');
  process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY, {
  auth: {
    autoRefreshToken: false,
    persistSession: false,
  },
});

// Surahs to fix (78-96 and 97-114)
// These surahs may have been imported with incorrect Arabic encoding from @kmaslesa package
const SURAHS_TO_FIX = [
  // Surahs 78-96
  78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96,
  // Surahs 97-114
  97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114
];

// Split Arabic verse text into words (simple space-based splitting)
function splitArabicIntoWords(verseText: string): string[] {
  return verseText.trim().split(/\s+/).filter(w => w.length > 0);
}

// Fetch Arabic verse text from CDN (standard encoding U+0600-U+06FF)
async function fetchVerseTextFromCDN(surahNumber: number): Promise<Record<number, string>> {
  const url = `https://cdn.jsdelivr.net/npm/quran-json@3.1.2/dist/chapters/${surahNumber}.json`;
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error(`Failed to fetch surah ${surahNumber} from CDN: ${response.statusText}`);
  }
  const data = await response.json();
  
  const verseTexts: Record<number, string> = {};
  if (data.verses && Array.isArray(data.verses)) {
    data.verses.forEach((verse: any) => {
      const verseNum = verse.id || verse.verse || verse.verse_number;
      const verseText = verse.text || verse.text_arabic || '';
      if (verseNum && verseText) {
        verseTexts[verseNum] = verseText;
      }
    });
  }
  
  return verseTexts;
}

async function fixSurah(surahNumber: number) {
  console.log(`\n📖 Fixing Surah ${surahNumber}...`);

  try {
    // Get surah ID
    const { data: surah, error: surahError } = await supabase
      .from('surahs')
      .select('id')
      .eq('surah_number', surahNumber)
      .single();

    if (surahError || !surah) {
      console.error(`  ❌ Surah ${surahNumber} not found`);
      return;
    }

    // Fetch correct Arabic text from CDN
    const verseTexts = await fetchVerseTextFromCDN(surahNumber);
    console.log(`  ✓ Fetched ${Object.keys(verseTexts).length} verses from CDN`);

    // Get all verses for this surah
    const { data: verses, error: versesError } = await supabase
      .from('verses')
      .select('id, verse_number')
      .eq('surah_id', surah.id)
      .order('verse_number', { ascending: true });

    if (versesError || !verses) {
      console.error(`  ❌ Error fetching verses: ${versesError?.message}`);
      return;
    }

    let versesUpdated = 0;
    let wordsUpdated = 0;

    // Update verses with correct Arabic text
    for (const verse of verses) {
      const correctText = verseTexts[verse.verse_number];
      if (!correctText) {
        console.warn(`  ⚠️  Missing CDN text for verse ${verse.verse_number}`);
        continue;
      }

      // Update verse text
      const { error: updateError } = await supabase
        .from('verses')
        .update({ text_arabic: correctText })
        .eq('id', verse.id);

      if (updateError) {
        console.error(`  ❌ Error updating verse ${verse.verse_number}: ${updateError.message}`);
        continue;
      }

      versesUpdated++;

      // Get words for this verse
      const { data: words, error: wordsError } = await supabase
        .from('words')
        .select('id, word_position')
        .eq('verse_id', verse.id)
        .order('word_position', { ascending: true });

      if (wordsError || !words) {
        console.warn(`  ⚠️  Error fetching words for verse ${verse.verse_number}`);
        continue;
      }

      // Split verse text into words
      const arabicWords = splitArabicIntoWords(correctText);

      // Update each word with correct Arabic text
      for (let i = 0; i < words.length && i < arabicWords.length; i++) {
        const word = words[i];
        const correctWord = arabicWords[i];

        const { error: wordUpdateError } = await supabase
          .from('words')
          .update({ text_arabic: correctWord })
          .eq('id', word.id);

        if (wordUpdateError) {
          console.error(`  ❌ Error updating word ${word.word_position} in verse ${verse.verse_number}: ${wordUpdateError.message}`);
        } else {
          wordsUpdated++;
        }
      }

      // Warn if word count mismatch
      if (words.length !== arabicWords.length) {
        console.warn(`  ⚠️  Word count mismatch for verse ${verse.verse_number}: ${words.length} words in DB, ${arabicWords.length} words in CDN text`);
      }
    }

    console.log(`  ✅ Updated ${versesUpdated} verses and ${wordsUpdated} words`);
  } catch (error: any) {
    console.error(`  ❌ Error fixing surah ${surahNumber}:`, error.message);
  }
}

async function main() {
  console.log('🔧 Fixing Arabic Encoding for Existing Surahs (78-114)');
  console.log('='.repeat(70));
  console.log('This script will update Arabic text to use standard encoding from CDN');
  console.log('Translations, transliterations, and grammar_info will be preserved');
  console.log(`\nFixing ${SURAHS_TO_FIX.length} surahs: ${SURAHS_TO_FIX[0]}-${SURAHS_TO_FIX[SURAHS_TO_FIX.length - 1]}\n`);

  for (const surahNumber of SURAHS_TO_FIX) {
    await fixSurah(surahNumber);
  }

  console.log('\n' + '='.repeat(70));
  console.log('✅ Fix complete!');
  console.log('='.repeat(70));
  console.log('\nPlease verify the Arabic text displays correctly in the frontend.');
}

main().catch((error) => {
  console.error('\n💥 Fatal error:', error);
  process.exit(1);
});

