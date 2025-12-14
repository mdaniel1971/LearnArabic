/**
 * Step 1: Diagnostic Analysis
 * 
 * This script queries the database to:
 * 1. Show distribution of part_of_speech values
 * 2. Identify potentially misclassified pronouns
 * 3. Show sample data examples
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

async function diagnose() {
  console.log('🔍 Step 1: Diagnostic Analysis');
  console.log('='.repeat(70));
  console.log();
  
  console.log('Connecting to database...');
  if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
    console.error('❌ Missing environment variables');
    return;
  }
  console.log('✓ Connected to database');
  console.log();

  // 1. Distribution of part_of_speech values
  console.log('📊 1. Distribution of part_of_speech values across all surahs (1, 78-114)');
  console.log('-'.repeat(70));
  
  // Get all words from surahs 1, 78-114
  // First get surah IDs
  const { data: surahs, error: surahsError } = await supabase
    .from('surahs')
    .select('id, surah_number')
    .in('surah_number', [1, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114]);

  if (surahsError || !surahs) {
    console.error('❌ Error fetching surahs:', surahsError);
    return;
  }

  const surahIds = surahs.map(s => s.id);

  // Get all verses for these surahs
  const { data: verses, error: versesError } = await supabase
    .from('verses')
    .select('id, verse_number, surah_id')
    .in('surah_id', surahIds);

  if (versesError || !verses) {
    console.error('❌ Error fetching verses:', versesError);
    return;
  }

  const verseIds = verses.map(v => v.id);
  const verseMap = new Map(verses.map(v => [v.id, v]));
  const surahMap = new Map(surahs.map(s => [s.id, s]));

  // Get all words
  const { data: words, error: wordsError } = await supabase
    .from('words')
    .select('id, text_arabic, transliteration, translation_english, grammar_info, word_position, verse_id')
    .in('verse_id', verseIds);

  if (wordsError) {
    console.error('❌ Error fetching words:', wordsError);
    return;
  }

  const posDistribution: Record<string, number> = {};
  words?.forEach((word: any) => {
    const pos = word.grammar_info?.part_of_speech || 'NULL';
    posDistribution[pos] = (posDistribution[pos] || 0) + 1;
  });
  
  if (!words || words.length === 0) {
    console.error('❌ No words found');
    return;
  }

  console.log('Part of Speech Distribution:');
  Object.entries(posDistribution)
    .sort((a, b) => b[1] - a[1])
    .forEach(([pos, count]) => {
      console.log(`  ${pos.padEnd(30)} ${count.toLocaleString()}`);
    });
  console.log();

  // 2. Check specific word: هُمۡ in 78:3
  console.log('🎯 2. Checking هُمۡ (hum) in Surah 78:3');
  console.log('-'.repeat(70));
  
  // Find verse 78:3
  const surah78 = surahs.find(s => s.surah_number === 78);
  if (!surah78) {
    console.error('❌ Surah 78 not found');
  } else {
    const verse78_3 = verses.find(v => v.surah_id === surah78.id && v.verse_number === 3);
    if (!verse78_3) {
      console.error('❌ Verse 78:3 not found');
    } else {
      const { data: humWord, error: humError } = await supabase
        .from('words')
        .select('id, text_arabic, transliteration, translation_english, grammar_info, word_position')
        .eq('verse_id', verse78_3.id)
        .order('word_position', { ascending: true });

      if (humError) {
        console.error('❌ Error fetching word:', humError);
      } else {
        console.log(`Found ${humWord?.length || 0} words in Surah 78:3`);
        humWord?.forEach((word: any) => {
          console.log(`  Position ${word.word_position}: ${word.text_arabic}`);
          console.log(`    Transliteration: ${word.transliteration || 'N/A'}`);
          console.log(`    Translation: ${word.translation_english || 'N/A'}`);
          console.log(`    Part of Speech: ${word.grammar_info?.part_of_speech || 'NULL'}`);
          console.log(`    Grammar Info:`, JSON.stringify(word.grammar_info, null, 2));
          console.log();
        });
      }
    }
  }

  // 3. Find potentially misclassified pronouns
  console.log('🔎 3. Identifying potentially misclassified pronouns');
  console.log('-'.repeat(70));
  console.log('Searching for words containing pronoun patterns (هم, هو, هي, أنت, نحن) labeled as "Noun"');
  console.log();

  // Common Arabic pronoun patterns
  const pronounPatterns = ['هم', 'هو', 'هي', 'أنت', 'نحن', 'أنتم', 'أنتن', 'هما', 'هؤلاء'];
  
  const misclassified: any[] = [];
  
  words?.forEach((word: any) => {
    const arabic = word.text_arabic || '';
    const pos = word.grammar_info?.part_of_speech || '';
    
    // Check if word contains pronoun pattern but is labeled as Noun
    const hasPronounPattern = pronounPatterns.some(pattern => arabic.includes(pattern));
    const isMisclassified = hasPronounPattern && (pos === 'Noun' || pos === 'noun');
    
    if (isMisclassified) {
      const verse = verseMap.get(word.verse_id);
      const surah = verse ? surahMap.get(verse.surah_id) : null;
      
      misclassified.push({
        surah: surah?.surah_number,
        verse: verse?.verse_number,
        position: word.word_position,
        arabic: arabic,
        transliteration: word.transliteration,
        translation: word.translation_english,
        current_pos: pos,
        grammar_info: word.grammar_info,
      });
    }
  });

  console.log(`Found ${misclassified.length} potentially misclassified pronouns`);
  console.log();
  console.log('Sample of misclassified pronouns (showing first 20):');
  console.log();
  
  misclassified.slice(0, 20).forEach((word, idx) => {
    console.log(`${idx + 1}. Surah ${word.surah}:${word.verse}:${word.position}`);
    console.log(`   Arabic: ${word.arabic}`);
    console.log(`   Transliteration: ${word.transliteration || 'N/A'}`);
    console.log(`   Translation: ${word.translation_english || 'N/A'}`);
    console.log(`   Current POS: ${word.current_pos}`);
    console.log(`   Should be: Pronoun`);
    console.log();
  });

  // 4. Show examples of correctly classified pronouns for comparison
  console.log('✅ 4. Examples of correctly classified pronouns (for comparison)');
  console.log('-'.repeat(70));
  
  const correctPronouns = words?.filter((word: any) => {
    const pos = word.grammar_info?.part_of_speech || '';
    return pos === 'Pronoun' || pos === 'pronoun';
  }).slice(0, 10);

  if (correctPronouns && correctPronouns.length > 0) {
    console.log(`Found ${correctPronouns.length} correctly classified pronouns (showing 10):`);
    correctPronouns.forEach((word: any, idx) => {
      const verse = verseMap.get(word.verse_id);
      const surah = verse ? surahMap.get(verse.surah_id) : null;
      console.log(`${idx + 1}. Surah ${surah?.surah_number}:${verse?.verse_number}:${word.word_position}`);
      console.log(`   Arabic: ${word.text_arabic}`);
      console.log(`   Transliteration: ${word.transliteration || 'N/A'}`);
      console.log(`   Translation: ${word.translation_english || 'N/A'}`);
      console.log(`   POS: ${word.grammar_info?.part_of_speech}`);
      console.log();
    });
  } else {
    console.log('No correctly classified pronouns found in sample.');
  }

  console.log('='.repeat(70));
  console.log('✅ Diagnostic analysis complete!');
  console.log('='.repeat(70));
}

// Run diagnosis
(async () => {
  try {
    await diagnose();
    process.exit(0);
  } catch (error: any) {
    console.error('\n💥 Fatal error:', error);
    process.exit(1);
  }
})();

