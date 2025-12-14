/**
 * Fix Pronoun Classification from Quranic Arabic Corpus
 * 
 * This script re-imports grammar classifications from the authentic corpus data,
 * specifically fixing standalone pronouns that were misclassified as "Noun".
 * 
 * Usage: npx tsx scripts/fix-pronoun-classification.ts [--preview-only] [--dry-run]
 */

import { config } from 'dotenv';
import { resolve } from 'path';
import * as fs from 'fs';
import { createClient } from '@supabase/supabase-js';
import { determineMainPOS } from '../docs/corpus-files/parse-morphology';

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

// Parse command line arguments
const previewOnly = process.argv.includes('--preview-only');
const dryRun = process.argv.includes('--dry-run');

interface WordMorphology {
  surah: number;
  verse: number;
  word: number;
  segments: Array<{ arabic: string; pos: string; features: string }>;
}

function parseMorphologyFile(filePath: string): Map<string, WordMorphology> {
  const content = fs.readFileSync(filePath, 'utf-8');
  const lines = content.split('\n').filter(line => line.trim());
  
  const wordMap = new Map<string, WordMorphology>();
  
  for (const line of lines) {
    const parts = line.split('\t');
    if (parts.length < 4) continue;
    
    const [location, arabic, pos, features] = parts;
    const [surah, verse, word] = location.split(':').map(Number);
    
    if (isNaN(surah) || isNaN(verse) || isNaN(word)) continue;
    
    // Only process surahs 1, 78-114
    if (surah !== 1 && (surah < 78 || surah > 114)) continue;
    
    const key = `${surah}:${verse}:${word}`;
    
    if (!wordMap.has(key)) {
      wordMap.set(key, {
        surah,
        verse,
        word,
        segments: []
      });
    }
    
    wordMap.get(key)!.segments.push({ arabic, pos, features });
  }
  
  return wordMap;
}

interface ClassificationChange {
  wordId: number;
  surah: number;
  verse: number;
  position: number;
  arabic: string;
  currentPos: string;
  newPos: string;
  currentGrammar: any;
  newGrammar: any;
}

async function findMisclassifiedPronouns(morphologyMap: Map<string, WordMorphology>): Promise<ClassificationChange[]> {
  const changes: ClassificationChange[] = [];
  
  // Get all surahs we care about
  const { data: surahs } = await supabase
    .from('surahs')
    .select('id, surah_number')
    .in('surah_number', [1, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114]);
  
  if (!surahs) return changes;
  
  const surahMap = new Map(surahs.map(s => [s.surah_number, s.id]));
  
  // Process each word in morphology data
  for (const [key, wordData] of morphologyMap.entries()) {
    const [surah, verse, word] = key.split(':').map(Number);
    const surahId = surahMap.get(surah);
    
    if (!surahId) continue;
    
    // Get correct grammar info from morphology
    const correctGrammar = determineMainPOS(wordData.segments);
    
    // Check if this is a pronoun
    const isPronoun = correctGrammar?.part_of_speech === 'Pronoun' || 
                     correctGrammar?.part_of_speech === 'pronoun';
    
    if (!isPronoun) continue;
    
    // Find the word in database
    const { data: verseData } = await supabase
      .from('verses')
      .select('id')
      .eq('surah_id', surahId)
      .eq('verse_number', verse)
      .single();
    
    if (!verseData) continue;
    
    const { data: wordRecord } = await supabase
      .from('words')
      .select('id, text_arabic, grammar_info')
      .eq('verse_id', verseData.id)
      .eq('word_position', word)
      .single();
    
    if (!wordRecord) continue;
    
    const currentPos = wordRecord.grammar_info?.part_of_speech || 'NULL';
    
    // Check if misclassified
    if (currentPos !== 'Pronoun' && currentPos !== 'pronoun') {
      changes.push({
        wordId: wordRecord.id,
        surah,
        verse,
        position: word,
        arabic: wordRecord.text_arabic,
        currentPos,
        newPos: 'Pronoun',
        currentGrammar: wordRecord.grammar_info,
        newGrammar: correctGrammar,
      });
    }
  }
  
  return changes;
}

async function applyFixes(changes: ClassificationChange[]) {
  if (dryRun) {
    console.log('\n🔍 DRY RUN MODE - No changes will be made\n');
  }
  
  let updated = 0;
  let errors = 0;
  
  for (const change of changes) {
    if (dryRun) {
      console.log(`Would update word ${change.wordId} (${change.surah}:${change.verse}:${change.position})`);
      continue;
    }
    
    const { error } = await supabase
      .from('words')
      .update({ grammar_info: change.newGrammar })
      .eq('id', change.wordId);
    
    if (error) {
      console.error(`❌ Error updating word ${change.wordId}: ${error.message}`);
      errors++;
    } else {
      updated++;
    }
  }
  
  if (!dryRun) {
    console.log(`\n✅ Updated ${updated} words`);
    if (errors > 0) {
      console.log(`❌ ${errors} errors`);
    }
  }
}

async function main() {
  console.log('🔧 Fix Pronoun Classification from Quranic Arabic Corpus');
  console.log('='.repeat(70));
  console.log();
  
  // Load morphology data
  const morphologyFile = resolve(process.cwd(), 'docs/corpus-files/quran-morphology.txt');
  if (!fs.existsSync(morphologyFile)) {
    console.error(`❌ Morphology file not found: ${morphologyFile}`);
    process.exit(1);
  }
  
  console.log('📖 Parsing morphology file...');
  const morphologyMap = parseMorphologyFile(morphologyFile);
  console.log(`✓ Loaded ${morphologyMap.size} words from morphology file\n`);
  
  // Find misclassified pronouns
  console.log('🔍 Identifying misclassified pronouns...');
  const changes = await findMisclassifiedPronouns(morphologyMap);
  console.log(`✓ Found ${changes.length} misclassified pronouns\n`);
  
  if (changes.length === 0) {
    console.log('✅ No misclassified pronouns found!');
    return;
  }
  
  // Show preview
  console.log('📋 Preview of changes (first 20):');
  console.log('-'.repeat(70));
  changes.slice(0, 20).forEach((change, idx) => {
    console.log(`${idx + 1}. Surah ${change.surah}:${change.verse}:${change.position} - ${change.arabic}`);
    console.log(`   Current: ${change.currentPos}`);
    console.log(`   New:     ${change.newPos}`);
    console.log(`   Grammar: ${JSON.stringify(change.newGrammar, null, 2)}`);
    console.log();
  });
  
  if (changes.length > 20) {
    console.log(`... and ${changes.length - 20} more changes\n`);
  }
  
  // Check specific word
  const humWord = changes.find(c => c.surah === 78 && c.verse === 3 && c.position === 2);
  if (humWord) {
    console.log('🎯 Specific check: هُمۡ in 78:3:2');
    console.log(`   Current POS: ${humWord.currentPos}`);
    console.log(`   New POS: ${humWord.newPos}`);
    console.log(`   New Grammar: ${JSON.stringify(humWord.newGrammar, null, 2)}`);
    console.log();
  }
  
  if (previewOnly) {
    console.log('✅ Preview complete. Run without --preview-only to apply fixes.');
    return;
  }
  
  // Apply fixes
  console.log('='.repeat(70));
  console.log(`Ready to update ${changes.length} words`);
  console.log('='.repeat(70));
  
  await applyFixes(changes);
  
  console.log('\n✅ Fix complete!');
}

main().catch((error) => {
  console.error('\n💥 Fatal error:', error);
  process.exit(1);
});

