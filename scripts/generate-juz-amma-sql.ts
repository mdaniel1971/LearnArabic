/**
 * Generate SQL Migration Files for Juz Amma (Surahs 97-114)
 * 
 * This script generates SQL files following the EXACT same pattern as Al-Fatiha:
 * - Same INSERT/UPDATE structure
 * - Same formatting style
 * - Same data format (fully vowelized Arabic, simple transliterations, natural English)
 * 
 * Note: The @kmaslesa package uses Arabic Presentation Forms (U+FB80 range) for Arabic text,
 * which is valid but different from Al-Fatiha's standard Arabic encoding (U+0600-U+06FF).
 * The SQL structure and format match Al-Fatiha exactly.
 * 
 * Output files:
 * - supabase/migrations/20240101000007_insert_juz_amma_surahs.sql
 * - supabase/migrations/20240101000008_insert_juz_amma_verses.sql
 * - supabase/migrations/20240101000009_insert_juz_amma_words.sql
 * - supabase/migrations/20240101000010_update_juz_amma_grammar.sql
 */

// Load environment variables from .env.local
import { config } from 'dotenv';
import { resolve } from 'path';
import { writeFileSync, mkdirSync } from 'fs';
import { join } from 'path';

// Load .env.local file
config({ path: resolve(process.cwd(), '.env.local') });

import quranWords from '@kmaslesa/holy-quran-word-by-word-full-data';

// We'll use quran-json CDN for standard Arabic text (U+0600-U+06FF)
// and @kmaslesa package for translations
async function fetchSurahFromCDN(surahNumber: number): Promise<any> {
  const url = `https://cdn.jsdelivr.net/npm/quran-json@3.1.2/dist/chapters/${surahNumber}.json`;
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error(`Failed to fetch surah ${surahNumber} from CDN: ${response.statusText}`);
  }
  return await response.json();
}

// ============================================================================
// Configuration
// ============================================================================

const START_SURAH = 97;
const END_SURAH = 114;

// Surah metadata (Arabic names, English names, verse counts)
const SURAH_METADATA: Record<number, { name_arabic: string; name_english: string; total_verses: number }> = {
  97: { name_arabic: 'الْقَدْرِ', name_english: 'The Night of Decree', total_verses: 5 },
  98: { name_arabic: 'الْبَيِّنَةُ', name_english: 'The Clear Evidence', total_verses: 8 },
  99: { name_arabic: 'الزَّلْزَلَةُ', name_english: 'The Earthquake', total_verses: 8 },
  100: { name_arabic: 'الْعَادِيَاتِ', name_english: 'The Chargers', total_verses: 11 },
  101: { name_arabic: 'الْقَارِعَةُ', name_english: 'The Calamity', total_verses: 11 },
  102: { name_arabic: 'التَّكَاثُرُ', name_english: 'Competition', total_verses: 8 },
  103: { name_arabic: 'الْعَصْرِ', name_english: 'The Declining Day', total_verses: 3 },
  104: { name_arabic: 'الْهُمَزَةُ', name_english: 'The Traducer', total_verses: 9 },
  105: { name_arabic: 'الْفِيلِ', name_english: 'The Elephant', total_verses: 5 },
  106: { name_arabic: 'قُرَيْشٍ', name_english: 'Quraysh', total_verses: 4 },
  107: { name_arabic: 'الْمَاعُونَ', name_english: 'The Small Kindnesses', total_verses: 7 },
  108: { name_arabic: 'الْكَوْثَرُ', name_english: 'The Abundance', total_verses: 3 },
  109: { name_arabic: 'الْكَافِرُونَ', name_english: 'The Disbelievers', total_verses: 6 },
  110: { name_arabic: 'النَّصْرُ', name_english: 'The Help', total_verses: 3 },
  111: { name_arabic: 'الْمَسَدُ', name_english: 'The Palm Fibre', total_verses: 5 },
  112: { name_arabic: 'الْإِخْلَاصُ', name_english: 'The Sincerity', total_verses: 4 },
  113: { name_arabic: 'الْفَلَقِ', name_english: 'The Daybreak', total_verses: 5 },
  114: { name_arabic: 'النَّاسِ', name_english: 'The Mankind', total_verses: 6 },
};

// ============================================================================
// Helper Functions
// ============================================================================

/**
 * Escape single quotes in SQL strings
 */
function escapeSqlString(str: string): string {
  return str.replace(/'/g, "''");
}

/**
 * Format transliteration to match Al-Fatiha style (simple, no hyphens unless needed)
 */
function formatTransliteration(transliteration: string): string {
  if (!transliteration) return '';
  
  // Remove hyphens, but keep capitalization for proper nouns
  let formatted = transliteration.replace(/-/g, '');
  
  // Capitalize first letter if it's a proper noun or starts a sentence
  if (formatted.length > 0) {
    formatted = formatted.charAt(0).toUpperCase() + formatted.slice(1);
  }
  
  return formatted;
}

/**
 * Format translation to match Al-Fatiha style (natural English with articles)
 */
function formatTranslation(translation: string): string {
  if (!translation) return '';
  
  // Remove parentheses content (e.g., "(of)" -> "")
  let formatted = translation.replace(/\([^)]*\)/g, '').trim();
  
  // Ensure proper capitalization
  if (formatted.length > 0) {
    formatted = formatted.charAt(0).toUpperCase() + formatted.slice(1);
  }
  
  return formatted;
}

/**
 * Generate basic grammar_info JSONB (simple tags, matching Al-Fatiha structure)
 */
function generateGrammarInfo(arabicWord: string, transliteration: string, translation: string): string {
  const arabic = arabicWord.trim();
  const trans = transliteration.toLowerCase().trim();
  const transEng = translation.toLowerCase().trim();
  
  const grammar: any = {};
  
  // Definite article
  if (arabic.startsWith('ال') || arabic.startsWith('وَال') || arabic.startsWith('بِال') || arabic.startsWith('فَال')) {
    grammar.part_of_speech = 'Definite Noun';
    grammar.definiteness = 'definite';
  }
  // Prepositions
  else if (arabic.startsWith('بِ') || arabic.startsWith('فِي') || arabic.startsWith('لِ') || 
           arabic.startsWith('مِنْ') || arabic.startsWith('عَلَى') || arabic.startsWith('إِلَى')) {
    grammar.part_of_speech = 'Preposition';
  }
  // Conjunctions
  else if (arabic.startsWith('وَ') || arabic.startsWith('فَ')) {
    grammar.part_of_speech = 'Conjunction';
  }
  // Verbs (basic detection)
  else if (transEng.includes('he ') || transEng.includes('she ') || transEng.includes('they ') ||
           transEng.includes('we ') || transEng.includes('you ') || transEng.includes('i ') ||
           transEng.includes('worship') || transEng.includes('seek') || transEng.includes('guide')) {
    grammar.part_of_speech = 'Verb';
    if (arabic.startsWith('ي') || arabic.startsWith('ت') || arabic.startsWith('ن') || arabic.startsWith('أ')) {
      grammar.tense = 'present';
    } else {
      grammar.tense = 'past';
    }
  }
  // Default to Noun
  else {
    grammar.part_of_speech = 'Noun';
  }
  
  // Number detection
  if (arabic.endsWith('ون') || arabic.endsWith('ين') || arabic.endsWith('ات')) {
    grammar.number = 'plural';
  } else {
    grammar.number = 'singular';
  }
  
  // Gender detection
  if (arabic.endsWith('ة') || arabic.endsWith('اء')) {
    grammar.gender = 'feminine';
  }
  
  // Convert to JSON string, then escape for SQL
  const jsonStr = JSON.stringify(grammar);
  return escapeSqlString(jsonStr);
}

// ============================================================================
// SQL Generation Functions
// ============================================================================

/**
 * Generate SQL for inserting surahs
 */
function generateSurahsSQL(surahs: Array<{ number: number; metadata: typeof SURAH_METADATA[number] }>): string {
  let sql = `-- Insert Juz Amma Surahs (97-114) with fully vowelized Arabic text
-- This includes all diacritical marks (tashkeel) for proper pronunciation

`;

  for (const surah of surahs) {
    sql += `-- Insert Surah ${surah.number}: ${surah.metadata.name_english}
INSERT INTO surahs (surah_number, name_arabic, name_english, total_verses)
VALUES (${surah.number}, '${escapeSqlString(surah.metadata.name_arabic)}', '${escapeSqlString(surah.metadata.name_english)}', ${surah.metadata.total_verses})
ON CONFLICT (surah_number) DO UPDATE SET name_english = '${escapeSqlString(surah.metadata.name_english)}';

`;
  }

  return sql;
}

/**
 * Generate SQL for inserting verses
 * Uses quran-json CDN for standard Arabic text (U+0600-U+06FF)
 */
function generateVersesSQL(surahs: Array<{ number: number; ayahs: Array<{ ayah: number; verseText: string }> }>): string {
  let sql = `-- Insert verses for Juz Amma (Surahs 97-114) with fully vowelized Arabic text
-- Note: All Arabic text includes complete tashkeel (diacritical marks)
-- Arabic text uses standard encoding (U+0600-U+06FF) from quran-json CDN

`;

  for (const surah of surahs) {
    sql += `-- Surah ${surah.number}\n`;
    
    for (const ayah of surah.ayahs) {
      if (ayah.verseText) {
        sql += `INSERT INTO verses (surah_id, verse_number, text_arabic)
SELECT s.id, ${ayah.ayah}, '${escapeSqlString(ayah.verseText)}'
FROM surahs s WHERE s.surah_number = ${surah.number}
ON CONFLICT (surah_id, verse_number) DO NOTHING;

`;
      }
    }
    
    sql += '\n';
  }

  return sql;
}

/**
 * Generate SQL for inserting words
 * Uses quran-json CDN for standard Arabic text, @kmaslesa package for translations
 */
function generateWordsSQL(surahs: Array<{ number: number; ayahs: Array<{ ayah: number; words: Array<{ arabic: string; transliteration: string; translation: string }> }> }>): string {
  let sql = `-- Insert word-by-word breakdown of Juz Amma (Surahs 97-114)
-- Each word includes full vowelization (tashkeel) for proper pronunciation
-- Arabic text uses standard encoding (U+0600-U+06FF) from quran-json CDN
-- Transliterations and translations from @kmaslesa package, formatted to match Al-Fatiha's style

`;

  for (const surah of surahs) {
    sql += `-- Surah ${surah.number}\n\n`;
    
    for (const ayah of surah.ayahs) {
      sql += `-- Verse ${ayah.ayah}\n`;
      
      ayah.words.forEach((word, index) => {
        const arabicText = word.arabic.trim();
        const transliteration = formatTransliteration(word.transliteration);
        const translation = formatTranslation(word.translation);
        
        sql += `INSERT INTO words (verse_id, word_position, text_arabic, transliteration, translation_english)
SELECT v.id, ${index + 1}, '${escapeSqlString(arabicText)}', ${transliteration ? `'${escapeSqlString(transliteration)}'` : 'NULL'}, ${translation ? `'${escapeSqlString(translation)}'` : 'NULL'}
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number = ${surah.number} AND v.verse_number = ${ayah.ayah}
ON CONFLICT (verse_id, word_position) DO NOTHING;

`;
      });
      
      sql += '\n';
    }
  }

  return sql;
}

/**
 * Generate SQL for updating grammar_info
 */
function generateGrammarSQL(surahs: Array<{ number: number; ayahs: Array<{ ayah: number; words: Array<{ arabic: string; transliteration: string; translation: string }> }> }>): string {
  let sql = `-- Update grammar information for Juz Amma (Surahs 97-114)
-- Based on basic grammatical analysis (simple tags matching Al-Fatiha structure)

`;

  for (const surah of surahs) {
    for (const ayah of surah.ayahs) {
      ayah.words.forEach((word, index) => {
        const arabicText = word.arabic.trim();
        const transliteration = word.transliteration;
        const translation = word.translation;
        const grammarJson = generateGrammarInfo(arabicText, transliteration, translation);
        
        sql += `-- Word ${index + 1}: ${arabicText} (${transliteration || 'N/A'}) - "${translation || 'N/A'}"
UPDATE words
SET grammar_info = '${grammarJson}'::jsonb
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = ${surah.number} 
  AND v.verse_number = ${ayah.ayah} 
  AND words.word_position = ${index + 1};

`;
      });
    }
  }

  return sql;
}

// ============================================================================
// Main Processing Function
// ============================================================================

/**
 * Split Arabic verse text into words (simple space-based splitting)
 */
function splitArabicIntoWords(verseText: string): string[] {
  // Remove extra spaces and split
  return verseText.trim().split(/\s+/).filter(w => w.length > 0);
}

async function generateSQLFiles() {
  console.log('🚀 Starting SQL Generation for Juz Amma (Surahs 97-114)');
  console.log('📝 Following Al-Fatiha\'s exact SQL pattern...\n');
  console.log('📥 Using quran-json CDN for standard Arabic text (U+0600-U+06FF)');
  console.log('📥 Using @kmaslesa package for translations\n');

  // Load all Quran words from package for translations
  console.log('📥 Loading translations from @kmaslesa/holy-quran-word-by-word-full-data...');
  const allQuranWords = await quranWords.getAllQuranWords();
  
  if (!allQuranWords || !Array.isArray(allQuranWords)) {
    throw new Error('Failed to load data from package: invalid data structure');
  }

  // Extract surahs 97-114
  const surahsData: Array<{ 
    number: number; 
    metadata: typeof SURAH_METADATA[number]; 
    ayahs: Array<{ 
      ayah: number; 
      verseText: string;
      words: Array<{ arabic: string; transliteration: string; translation: string }> 
    }> 
  }> = [];

  for (let surahNumber = START_SURAH; surahNumber <= END_SURAH; surahNumber++) {
    const metadata = SURAH_METADATA[surahNumber];
    if (!metadata) {
      console.warn(`⚠️  No metadata found for surah ${surahNumber}, skipping...`);
      continue;
    }

    console.log(`📖 Processing surah ${surahNumber}: ${metadata.name_english}...`);

    try {
      // Fetch Arabic text from quran-json CDN (standard Arabic encoding)
      const cdnData = await fetchSurahFromCDN(surahNumber);
      
      if (!cdnData || !cdnData.verses || !Array.isArray(cdnData.verses)) {
        throw new Error(`Invalid data structure from CDN for surah ${surahNumber}`);
      }

      // Extract translations from @kmaslesa package
      const surahWords: Record<number, any[]> = {};
      
      for (const page of allQuranWords) {
        if (!page.ayahs || !Array.isArray(page.ayahs)) continue;
        
        for (const ayah of page.ayahs) {
          if (!ayah.words || !Array.isArray(ayah.words)) continue;
          
          for (const word of ayah.words) {
            if (word.parentAyahVerseKey) {
              const [surah, ayahNum] = word.parentAyahVerseKey.split(':').map(Number);
              
              if (surah === surahNumber && ayahNum) {
                if (word.char_type_name !== 'end' && word.text && word.text.trim()) {
                  if (!surahWords[ayahNum]) {
                    surahWords[ayahNum] = [];
                  }
                  surahWords[ayahNum].push(word);
                }
              }
            }
          }
        }
      }

      // Combine CDN Arabic text with package translations
      const ayahs = cdnData.verses.map((verse: any) => {
        const ayahNum = verse.verse || verse.verse_number || verse.id;
        const verseText = verse.text || verse.text_arabic || '';
        const arabicWords = splitArabicIntoWords(verseText);
        
        // Get translations for this verse
        const translationWords = surahWords[ayahNum] || [];
        
        // Match Arabic words with translations
        const words = arabicWords.map((arabicWord, index) => {
          // Try to find matching translation by position
          const translationWord = translationWords[index] || translationWords.find((w: any) => 
            w.text && w.text.trim().length > 0
          ) || null;
          
          return {
            arabic: arabicWord,
            transliteration: translationWord?.transliteration?.text || '',
            translation: translationWord?.translation?.text || '',
          };
        });

        return {
          ayah: ayahNum,
          verseText: verseText,
          words: words,
        };
      });

      if (ayahs.length > 0) {
        surahsData.push({
          number: surahNumber,
          metadata,
          ayahs,
        });
        console.log(`  ✓ Extracted surah ${surahNumber}: ${metadata.name_english} (${ayahs.length} verses)`);
      } else {
        console.warn(`  ⚠️  No data found for surah ${surahNumber}`);
      }
    } catch (error: any) {
      console.error(`  ❌ Error processing surah ${surahNumber}:`, error.message);
      throw error;
    }
  }

  console.log(`\n📊 Extracted ${surahsData.length} surahs\n`);

  // Generate SQL files
  console.log('📝 Generating SQL files...\n');

  const migrationsDir = join(process.cwd(), 'supabase', 'migrations');
  
  // Generate surahs SQL
  const surahsSQL = generateSurahsSQL(surahsData.map(s => ({ number: s.number, metadata: s.metadata })));
  writeFileSync(
    join(migrationsDir, '20240101000007_insert_juz_amma_surahs.sql'),
    surahsSQL,
    'utf-8'
  );
  console.log('  ✅ Generated: 20240101000007_insert_juz_amma_surahs.sql');

  // Generate verses SQL
  const versesSQL = generateVersesSQL(surahsData);
  writeFileSync(
    join(migrationsDir, '20240101000008_insert_juz_amma_verses.sql'),
    versesSQL,
    'utf-8'
  );
  console.log('  ✅ Generated: 20240101000008_insert_juz_amma_verses.sql');

  // Generate words SQL
  const wordsSQL = generateWordsSQL(surahsData);
  writeFileSync(
    join(migrationsDir, '20240101000009_insert_juz_amma_words.sql'),
    wordsSQL,
    'utf-8'
  );
  console.log('  ✅ Generated: 20240101000009_insert_juz_amma_words.sql');

  // Generate grammar SQL
  const grammarSQL = generateGrammarSQL(surahsData);
  writeFileSync(
    join(migrationsDir, '20240101000010_update_juz_amma_grammar.sql'),
    grammarSQL,
    'utf-8'
  );
  console.log('  ✅ Generated: 20240101000010_update_juz_amma_grammar.sql');

  console.log('\n✨ SQL generation complete!');
  console.log('\n📋 Next steps:');
  console.log('  1. Review the generated SQL files');
  console.log('  2. Run them in Supabase SQL Editor in order:');
  console.log('     - 20240101000007_insert_juz_amma_surahs.sql');
  console.log('     - 20240101000008_insert_juz_amma_verses.sql');
  console.log('     - 20240101000009_insert_juz_amma_words.sql');
  console.log('     - 20240101000010_update_juz_amma_grammar.sql');
  console.log('  3. Verify the data matches Al-Fatiha\'s format');
}

// ============================================================================
// Run Script
// ============================================================================

generateSQLFiles()
  .then(() => {
    console.log('\n🎉 Script completed successfully!');
    process.exit(0);
  })
  .catch((error) => {
    console.error('\n💥 Fatal error:', error);
    process.exit(1);
  });

