/**
 * Populate Juz Amma (Surahs 97-114) into the Quranic Arabic Learning Platform database
 * 
 * This script uses @kmaslesa/holy-quran-word-by-word-full-data package and populates:
 * - surahs table: metadata for each surah
 * - verses table: Arabic text for each verse
 * - words table: word-by-word breakdown with transliteration, translation, and basic grammar tags
 * 
 * Grammar tutorials are generated on-the-fly via Mistral AI when users click the 📖 icon,
 * so grammar_info only contains simple tags/labels for reference.
 */

// Load environment variables from .env.local
import { config } from 'dotenv';
import { resolve } from 'path';

// Load .env.local file
config({ path: resolve(process.cwd(), '.env.local') });

import { createClient } from '@supabase/supabase-js';
import { GrammarInfo } from '../types/quran';
import quranWords from '@kmaslesa/holy-quran-word-by-word-full-data';

// ============================================================================
// Type Definitions for @kmaslesa/holy-quran-word-by-word-full-data
// ============================================================================

interface QuranWord {
  text: string; // Arabic text
  translation: {
    text: string; // English translation
  };
  transliteration: {
    text: string; // Transliteration
  };
}

interface QuranAyah {
  ayah: number; // Verse number
  words: QuranWord[];
}

interface QuranSurah {
  surah: number; // Surah number
  ayahs: QuranAyah[];
}

// ============================================================================
// Configuration
// ============================================================================

const START_SURAH = 97;
const END_SURAH = 114;
const TOTAL_SURAHS = END_SURAH - START_SURAH + 1; // 18 surahs

// Surah metadata lookup (since the package doesn't include surah names)
interface SurahMetadata {
  name_arabic: string;
  name_english: string;
  total_verses: number;
}

const SURAH_METADATA: Record<number, SurahMetadata> = {
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
// Grammar Heuristic Function
// ============================================================================

/**
 * Creates basic grammar tags based on word patterns and translations
 * These are simple labels for reference - full tutorials generated on-demand via 📖 icon
 */
function generateGrammarInfo(
  arabicText: string,
  transliteration: string,
  translation: string
): GrammarInfo | null {
  const arabic = arabicText.trim();
  const trans = transliteration.toLowerCase().trim();
  const transEng = translation.toLowerCase().trim();

  // Definite article (ال)
  if (arabic.startsWith('ال') || arabic.startsWith('وَال') || arabic.startsWith('بِال') || arabic.startsWith('فَال')) {
    return {
      part_of_speech: 'Definite Noun',
      definiteness: 'definite',
    };
  }

  // Prepositions
  const prepositions = ['bi', 'fi', 'li', 'min', 'ila', 'ala', 'an', 'ma', 'wa', 'fa'];
  if (prepositions.some(prep => trans.startsWith(prep) || arabic.startsWith('بِ') || arabic.startsWith('فِي') || arabic.startsWith('لِ'))) {
    return {
      part_of_speech: 'Preposition',
    };
  }

  // Conjunctions
  if (arabic.startsWith('وَ') || arabic.startsWith('فَ') || trans.startsWith('wa') || trans.startsWith('fa')) {
    if (transEng.includes('and') || transEng.includes('then') || transEng.includes('so')) {
      return {
        part_of_speech: 'Conjunction',
      };
    }
  }

  // Common verbs (imperfect/present tense indicators)
  if (transEng.includes('he') || transEng.includes('she') || transEng.includes('they') || 
      transEng.includes('we') || transEng.includes('you') || transEng.includes('i')) {
    if (transEng.includes('worship') || transEng.includes('seek') || transEng.includes('guide') || 
        transEng.includes('give') || transEng.includes('say') || transEng.includes('do')) {
      return {
        part_of_speech: 'Verb',
        tense: 'present',
      };
    }
  }

  // Past tense verbs (common patterns)
  if (transEng.includes('was') || transEng.includes('were') || transEng.includes('gave') || 
      transEng.includes('sent') || transEng.includes('created') || transEng.includes('made')) {
    return {
      part_of_speech: 'Verb',
      tense: 'past',
    };
  }

  // Pronouns
  if (transEng.includes('he') || transEng.includes('she') || transEng.includes('it') || 
      transEng.includes('they') || transEng.includes('we') || transEng.includes('you') || 
      transEng.includes('i') || transEng.includes('me') || transEng.includes('him') || 
      transEng.includes('her') || transEng.includes('them') || transEng.includes('us')) {
    if (!transEng.includes('worship') && !transEng.includes('seek')) {
      return {
        part_of_speech: 'Pronoun',
      };
    }
  }

  // Particles
  if (transEng.includes('not') || transEng.includes('no') || transEng.includes('never') || 
      arabic === 'لَا' || arabic === 'لَمْ' || arabic === 'لَنْ') {
    return {
      part_of_speech: 'Particle',
      type: 'negative',
    };
  }

  // Default: assume noun if no other pattern matches
  return {
    part_of_speech: 'Noun',
    definiteness: arabic.startsWith('ال') || arabic.startsWith('وَال') || arabic.startsWith('بِال') || arabic.startsWith('فَال') ? 'definite' : 'indefinite',
  };
}

// ============================================================================
// Supabase Client Setup
// ============================================================================

function getSupabaseClient() {
  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

  if (!supabaseUrl) {
    throw new Error('❌ NEXT_PUBLIC_SUPABASE_URL environment variable is not set');
  }

  if (!supabaseServiceKey) {
    throw new Error('❌ SUPABASE_SERVICE_ROLE_KEY environment variable is not set. Please add it to .env.local');
  }

  return createClient(supabaseUrl, supabaseServiceKey, {
    auth: {
      autoRefreshToken: false,
      persistSession: false,
    },
  });
}

// ============================================================================
// Data Fetching
// ============================================================================

// Cache for all Quran words (load once, use many times)
let allQuranWordsCache: any[] | null = null;

/**
 * Fetch surah data from the @kmaslesa/holy-quran-word-by-word-full-data package
 * The package organizes data by pages, so we need to extract surah data by parsing parentAyahVerseKey
 */
async function fetchSurahData(surahNumber: number): Promise<QuranSurah | null> {
  console.log(`  📥 Fetching data from package for surah ${surahNumber}`);
  
  // Load all Quran words once and cache
  if (!allQuranWordsCache) {
    const allQuranWords = await quranWords.getAllQuranWords();
    
    if (!allQuranWords || !Array.isArray(allQuranWords)) {
      throw new Error(`Failed to fetch data from package: invalid data structure`);
    }
    
    allQuranWordsCache = allQuranWords;
  }
  
  // Extract all words for this surah by parsing parentAyahVerseKey (format: "surah:ayah")
  const surahWords: Record<number, QuranWord[]> = {}; // keyed by ayah number
  
  for (const page of allQuranWordsCache) {
    if (!page.ayahs || !Array.isArray(page.ayahs)) continue;
    
    for (const ayah of page.ayahs) {
      if (!ayah.words || !Array.isArray(ayah.words)) continue;
      
      for (const word of ayah.words) {
        // Parse parentAyahVerseKey (e.g., "97:1" means surah 97, ayah 1)
        if (word.parentAyahVerseKey) {
          const [surah, ayahNum] = word.parentAyahVerseKey.split(':').map(Number);
          
          if (surah === surahNumber && ayahNum) {
            // Filter out "end" type words (verse numbers) and empty words
            if (word.char_type_name !== 'end' && word.text && word.text.trim()) {
              if (!surahWords[ayahNum]) {
                surahWords[ayahNum] = [];
              }
              surahWords[ayahNum].push({
                text: word.text,
                translation: word.translation || { text: '' },
                transliteration: word.transliteration || { text: '' },
              });
            }
          }
        }
      }
    }
  }
  
  if (Object.keys(surahWords).length === 0) {
    console.warn(`  ⚠️  Surah ${surahNumber} not found in package data`);
    return null;
  }
  
  // Convert to the expected format
  const ayahs: QuranAyah[] = Object.keys(surahWords)
    .sort((a, b) => Number(a) - Number(b))
    .map(ayahNum => ({
      ayah: Number(ayahNum),
      words: surahWords[Number(ayahNum)],
    }));
  
  return {
    surah: surahNumber,
    ayahs: ayahs,
  };
}

// ============================================================================
// Database Operations
// ============================================================================

async function insertSurah(
  supabase: ReturnType<typeof createClient>,
  surahNumber: number,
  metadata: SurahMetadata
) {
  const { data: surah, error } = await supabase
    .from('surahs')
    .upsert({
      surah_number: surahNumber,
      name_arabic: metadata.name_arabic,
      name_english: metadata.name_english,
      total_verses: metadata.total_verses,
    }, {
      onConflict: 'surah_number',
    })
    .select()
    .single();

  if (error) {
    throw new Error(`Failed to insert surah ${surahNumber}: ${error.message}`);
  }

  return surah;
}

async function insertVerses(
  supabase: ReturnType<typeof createClient>,
  surahId: number,
  ayahs: QuranAyah[]
) {
  // Reconstruct verse text from words
  const versesToInsert = ayahs.map((ayah) => {
    // Combine all words in the ayah to form the verse text
    const verseText = ayah.words.map(word => word.text).join(' ');
    
    return {
      surah_id: surahId,
      verse_number: ayah.ayah,
      text_arabic: verseText,
    };
  });

  const { data, error } = await supabase
    .from('verses')
    .upsert(versesToInsert, {
      onConflict: 'surah_id,verse_number',
    })
    .select();

  if (error) {
    throw new Error(`Failed to insert verses: ${error.message}`);
  }

  return data;
}

async function insertWords(
  supabase: ReturnType<typeof createClient>,
  verses: Array<{ id: number; verse_number: number }>,
  ayahs: QuranAyah[]
) {
  let totalWords = 0;

  for (const ayah of ayahs) {
    const verse = verses.find(v => v.verse_number === ayah.ayah);
    
    if (!verse) {
      console.warn(`  ⚠️  Verse ${ayah.ayah} not found in database`);
      continue;
    }

    if (!ayah.words || ayah.words.length === 0) {
      console.warn(`  ⚠️  No words found in verse ${ayah.ayah}`);
      continue;
    }

    const wordsToInsert = ayah.words.map((word, wordIndex) => {
      const grammarInfo = generateGrammarInfo(
        word.text,
        word.transliteration?.text || '',
        word.translation?.text || ''
      );

      return {
        verse_id: verse.id,
        word_position: wordIndex + 1, // Position starts at 1
        text_arabic: word.text,
        transliteration: word.transliteration?.text || null,
        translation_english: word.translation?.text || null, // Now we have translations!
        grammar_info: grammarInfo,
      };
    });

    const { error } = await supabase
      .from('words')
      .upsert(wordsToInsert, {
        onConflict: 'verse_id,word_position',
      });

    if (error) {
      throw new Error(`Failed to insert words for verse ${ayah.ayah}: ${error.message}`);
    }

    totalWords += wordsToInsert.length;
  }

  return totalWords;
}

// ============================================================================
// Main Processing Function
// ============================================================================

async function processSurah(
  supabase: ReturnType<typeof createClient>,
  surahNumber: number
): Promise<{ wordsAdded: number }> {
  console.log(`\n📖 Processing Surah ${surahNumber}...`);

  try {
    // Get surah metadata
    const metadata = SURAH_METADATA[surahNumber];
    if (!metadata) {
      throw new Error(`No metadata found for surah ${surahNumber}`);
    }

    // Fetch data from package
    const quranData = await fetchSurahData(surahNumber);
    
    if (!quranData) {
      throw new Error(`Surah ${surahNumber} not found in package data`);
    }
    
    console.log(`  ✓ Fetched: ${metadata.name_english} (${metadata.name_arabic})`);
    console.log(`  ✓ Total verses: ${metadata.total_verses}`);

    // Insert surah
    const surah = await insertSurah(supabase, surahNumber, metadata);
    console.log(`  ✓ Inserted surah (ID: ${surah.id})`);

    // Insert verses
    const verses = await insertVerses(supabase, surah.id, quranData.ayahs);
    console.log(`  ✓ Inserted ${verses.length} verses`);

    // Insert words
    const wordsAdded = await insertWords(supabase, verses, quranData.ayahs);
    console.log(`  ✓ Inserted ${wordsAdded} words`);

    console.log(`  ✅ Surah ${surahNumber} completed successfully!`);

    return { wordsAdded };
  } catch (error) {
    console.error(`  ❌ Error processing surah ${surahNumber}:`, error);
    throw error;
  }
}

// ============================================================================
// Verification Function
// ============================================================================

async function verifyData(supabase: ReturnType<typeof createClient>) {
  console.log('\n\n🔍 Verifying data...\n');

  // Count surahs 97-114
  const { data: surahs, error: surahsError } = await supabase
    .from('surahs')
    .select('surah_number, name_english, total_verses')
    .gte('surah_number', START_SURAH)
    .lte('surah_number', END_SURAH)
    .order('surah_number', { ascending: true });

  if (surahsError) {
    console.error('❌ Error counting surahs:', surahsError);
    return;
  }

  console.log(`📊 Total surahs (97-114): ${surahs?.length || 0} (expected: ${TOTAL_SURAHS})`);
  
  if (surahs && surahs.length === TOTAL_SURAHS) {
    console.log('  ✅ Correct number of surahs!');
  } else {
    console.log(`  ⚠️  Expected ${TOTAL_SURAHS} surahs, found ${surahs?.length || 0}`);
  }

  // Check An-Nas (Surah 114) - should have 6 verses
  const anNas = surahs?.find(s => s.surah_number === 114);
  if (anNas) {
    console.log(`\n📖 An-Nas (Surah 114):`);
    console.log(`  Name: ${anNas.name_english}`);
    console.log(`  Verses: ${anNas.total_verses} (expected: 6)`);
    
    if (anNas.total_verses === 6) {
      console.log('  ✅ Correct verse count!');
    } else {
      console.log(`  ⚠️  Expected 6 verses, found ${anNas.total_verses}`);
    }

    // Get surah ID and check words
    const { data: surahData } = await supabase
      .from('surahs')
      .select('id')
      .eq('surah_number', 114)
      .single();

    if (surahData) {
      const { data: verses } = await supabase
        .from('verses')
        .select('id, verse_number')
        .eq('surah_id', surahData.id)
        .order('verse_number', { ascending: true });

      if (verses && verses.length > 0) {
        const { data: words } = await supabase
          .from('words')
          .select('text_arabic, transliteration, translation_english, grammar_info')
          .eq('verse_id', verses[0].id)
          .order('word_position', { ascending: true })
          .limit(5);

        console.log(`\n📝 Sample words from first verse of An-Nas:`);
        words?.forEach((word, idx) => {
          console.log(`  ${idx + 1}. ${word.text_arabic} (${word.transliteration}) - ${word.translation_english}`);
          if (word.grammar_info) {
            console.log(`     Grammar: ${word.grammar_info.part_of_speech}`);
          }
        });
      }
    }
  } else {
    console.log('  ⚠️  An-Nas (Surah 114) not found');
  }

  // Count total words for surahs 97-114
  if (surahs && surahs.length > 0) {
    // Get surah IDs
    const { data: surahIds } = await supabase
      .from('surahs')
      .select('id')
      .gte('surah_number', START_SURAH)
      .lte('surah_number', END_SURAH);

    if (surahIds && surahIds.length > 0) {
      const ids = surahIds.map(s => s.id);
      
      // Get verse IDs
      const { data: verseIds } = await supabase
        .from('verses')
        .select('id')
        .in('surah_id', ids);

      if (verseIds && verseIds.length > 0) {
        const verseIdArray = verseIds.map(v => v.id);
        
        // Count words
        const { count: wordCount } = await supabase
          .from('words')
          .select('*', { count: 'exact', head: true })
          .in('verse_id', verseIdArray);

        console.log(`\n📝 Total words in surahs 97-114: ${wordCount?.toLocaleString() || 0}`);
      }
    }
  }

  console.log('\n📊 Data verification complete!');
}

// ============================================================================
// Main Execution
// ============================================================================

async function main() {
  console.log('🚀 Starting Juz Amma Population Script');
  console.log('=' .repeat(60));
  console.log(`📖 Processing surahs ${START_SURAH} through ${END_SURAH} (${TOTAL_SURAHS} surahs)`);
  console.log('=' .repeat(60));

  const startTime = Date.now();
  const supabase = getSupabaseClient();

  let successCount = 0;
  let failureCount = 0;
  let totalWords = 0;
  const failedSurahs: number[] = [];

  // Process each surah
  for (let surahNumber = START_SURAH; surahNumber <= END_SURAH; surahNumber++) {
    try {
      const result = await processSurah(supabase, surahNumber);
      successCount++;
      totalWords += result.wordsAdded;
    } catch (error) {
      failureCount++;
      failedSurahs.push(surahNumber);
      console.error(`\n❌ Failed to process surah ${surahNumber}:`, error);
      // Continue with next surah
    }
  }

  // Summary
  const endTime = Date.now();
  const duration = ((endTime - startTime) / 1000).toFixed(2);

  console.log('\n\n' + '='.repeat(60));
  console.log('📊 POPULATION SUMMARY');
  console.log('='.repeat(60));
  console.log(`✅ Successfully processed: ${successCount}/${TOTAL_SURAHS} surahs`);
  console.log(`❌ Failed: ${failureCount}/${TOTAL_SURAHS} surahs`);
  if (failedSurahs.length > 0) {
    console.log(`⚠️  Failed surahs: ${failedSurahs.join(', ')}`);
  }
  console.log(`📝 Total words added: ${totalWords.toLocaleString()}`);
  console.log(`⏱️  Time taken: ${duration} seconds`);
  console.log('='.repeat(60));

  // Verification
  await verifyData(supabase);

  console.log('\n✨ Script completed!');
  
  if (failureCount > 0) {
    console.log(`\n⚠️  Warning: ${failureCount} surah(s) failed to process. Please review the errors above.`);
    process.exit(1);
  } else {
    console.log('\n🎉 All surahs processed successfully!');
  }
}

// Run the script
main().catch((error) => {
  console.error('\n💥 Fatal error:', error);
  process.exit(1);
});

