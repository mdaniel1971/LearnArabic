/**
 * Extract voice information from quran-morphology.txt and generate SQL
 * to add voice field to grammar_info JSONB column for verbs in surahs 97-114
 */

import * as fs from 'fs';
import { resolve, dirname } from 'path';

const MORPHOLOGY_FILE = '/Users/admin/Coding/LearnArabic/docs/corpus-files/quran-morphology.txt';
const OUTPUT_FILE = '/Users/admin/Coding/LearnArabic/supabase/migrations/20241207000004_add_voice_to_verbs.sql';

interface WordData {
  surah: number;
  verse: number;
  word: number;
  segments: Array<{
    arabic: string;
    pos: string;
    features: string;
  }>;
}

/**
 * Parse the morphology file and extract word data with voice information
 */
function parseMorphologyFile(filePath: string): WordData[] {
  const content = fs.readFileSync(filePath, 'utf-8');
  const lines = content.split('\n').filter(line => line.trim());

  const wordMap: { [key: string]: WordData } = {};

  for (const line of lines) {
    const parts = line.split('\t');
    if (parts.length < 4) continue;

    const [location, arabic, pos, features] = parts;
    const [surah, verse, word] = location.split(':').map(Number);

    // Only process surahs 97-114
    if (surah < 97 || surah > 114) continue;

    const key = `${surah}:${verse}:${word}`;

    if (!wordMap[key]) {
      wordMap[key] = {
        surah,
        verse,
        word,
        segments: []
      };
    }

    wordMap[key].segments.push({ arabic, pos, features });
  }

  return Object.values(wordMap);
}

/**
 * Extract voice from segments for verbs
 */
function extractVoice(segments: Array<{ pos: string; features: string }>): 'active' | 'passive' | null {
  // Check if any segment is a verb
  const hasVerb = segments.some(s => s.pos === 'V');
  if (!hasVerb) return null;

  // Check for PASS in any segment's features
  for (const seg of segments) {
    if (seg.features.includes('PASS')) {
      return 'passive';
    }
  }

  // If it's a verb but no PASS code, it's active
  return 'active';
}

/**
 * Generate SQL to add voice to grammar_info
 */
function generateSQL(words: WordData[]): string {
  const sql: string[] = [];
  sql.push('-- Add voice information to verbs in surahs 97-114');
  sql.push('-- Source: quran-morphology.txt');
  sql.push('-- Extracted from PASS code in morphology features');
  sql.push('-- Generated: ' + new Date().toISOString());
  sql.push('-- Note: Only updates verbs that don\'t already have voice set\n');

  let currentSurah = -1;
  let updateCount = 0;

  for (const word of words) {
    const voice = extractVoice(word.segments);
    
    if (!voice) continue; // Not a verb or no voice info

    if (word.surah !== currentSurah) {
      currentSurah = word.surah;
      sql.push(`\n-- ========== SURAH ${currentSurah} ==========`);
    }

    // Use jsonb_set to add or update the voice field
    sql.push(`
UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{voice}',
  '"${voice}"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = ${word.surah}
  AND v.verse_number = ${word.verse}
)
AND word_position = ${word.word}
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'voice' IS NULL OR grammar_info->>'voice' = '');`);

    updateCount++;
  }

  sql.push(`\n-- Total verbs updated: ${updateCount}`);

  return sql.join('\n');
}

/**
 * Main function
 */
function main() {
  console.log('🚀 Extracting voice information from morphology file...\n');
  console.log('📖 Reading file:', MORPHOLOGY_FILE);

  if (!fs.existsSync(MORPHOLOGY_FILE)) {
    console.error(`❌ File not found: ${MORPHOLOGY_FILE}`);
    process.exit(1);
  }

  const words = parseMorphologyFile(MORPHOLOGY_FILE);
  console.log(`✅ Parsed ${words.length} words from surahs 97-114\n`);

  // Count verbs with voice info
  let verbsWithVoice = 0;
  let passiveVerbs = 0;
  let activeVerbs = 0;

  for (const word of words) {
    const voice = extractVoice(word.segments);
    if (voice) {
      verbsWithVoice++;
      if (voice === 'passive') passiveVerbs++;
      else activeVerbs++;
    }
  }

  console.log(`📊 Voice information found:`);
  console.log(`   Total verbs: ${verbsWithVoice}`);
  console.log(`   Active: ${activeVerbs}`);
  console.log(`   Passive: ${passiveVerbs}\n`);

  console.log('🔨 Generating SQL...');
  const sql = generateSQL(words);

  // Ensure output directory exists
  const outputDir = dirname(OUTPUT_FILE);
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
  }

  // Write the SQL file
  try {
    fs.writeFileSync(OUTPUT_FILE, sql, 'utf-8');
    console.log(`✅ SQL written to: ${OUTPUT_FILE}\n`);
  } catch (error: any) {
    console.error(`❌ Error writing file: ${error.message}`);
    process.exit(1);
  }

  console.log('📝 Next steps:');
  console.log('   1. Review the SQL file');
  console.log('   2. Run it in Supabase SQL Editor');
  console.log('   3. Verify with: SELECT grammar_info->>\'voice\', COUNT(*) FROM words WHERE grammar_info->>\'part_of_speech\' = \'Verb\' GROUP BY 1;');
}

main();
