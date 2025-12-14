/**
 * Extract verb aspect (perfect/imperfect) from quran-morphology.txt and generate SQL
 * to add aspect field to grammar_info JSONB column for verbs in surahs 97-114
 * 
 * PERF = perfect (past tense, completed action)
 * IMPF = imperfect (present/future tense, ongoing or incomplete action)
 * IMPV = imperative (command form)
 */

import * as fs from 'fs';

const MORPHOLOGY_FILE = '/Users/admin/Coding/LearnArabic/docs/corpus-files/quran-morphology.txt';
const OUTPUT_FILE = '/Users/admin/Coding/LearnArabic/supabase/migrations/20241207000006_add_verb_aspect.sql';

/**
 * Extract verb aspect from morphology features
 */
function extractAspect(features: string): string | null {
  if (features.includes('PERF')) {
    return 'perfect';
  } else if (features.includes('IMPF')) {
    return 'imperfect';
  } else if (features.includes('IMPV')) {
    return 'imperative';
  }
  return null;
}

/**
 * Generate SQL to add aspect to grammar_info
 */
function generateSQL(): string {
  const content = fs.readFileSync(MORPHOLOGY_FILE, 'utf-8');
  const lines = content.split('\n');

  const sql: string[] = [];
  sql.push('-- Add verb aspect information (perfect/imperfect/imperative) to verbs in surahs 97-114');
  sql.push('-- Source: quran-morphology.txt');
  sql.push('-- Extracted from PERF/IMPF/IMPV codes in morphology features');
  sql.push('-- PERF = perfect (past tense, completed action)');
  sql.push('-- IMPF = imperfect (present/future tense, ongoing or incomplete action)');
  sql.push('-- IMPV = imperative (command form)');
  sql.push('-- Generated: ' + new Date().toISOString());
  sql.push('-- Note: Only updates verbs that don\'t already have aspect set\n');

  let currentSurah = -1;
  let updateCount = 0;
  const aspectCounts: Record<string, number> = {};

  for (const line of lines) {
    if (!line.includes('\tV\t')) continue;
    
    const parts = line.split('\t');
    if (parts.length < 4) continue;
    
    const [location, , , features] = parts;
    const [surah, verse, word] = location.split(':').map(Number);
    
    if (surah < 97 || surah > 114) continue;
    
    const aspect = extractAspect(features);
    if (!aspect) continue; // No aspect information
    
    aspectCounts[aspect] = (aspectCounts[aspect] || 0) + 1;
    
    if (surah !== currentSurah) {
      currentSurah = surah;
      sql.push(`\n-- ========== SURAH ${currentSurah} ==========`);
    }
    
    sql.push(`
UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{aspect}',
  '"${aspect}"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = ${surah}
  AND v.verse_number = ${verse}
)
AND word_position = ${word}
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'aspect' IS NULL OR grammar_info->>'aspect' = '');`);
    
    updateCount++;
  }

  sql.push(`\n-- Total verbs updated: ${updateCount}`);
  sql.push(`-- Breakdown: ${Object.entries(aspectCounts).map(([a, c]) => `${a}: ${c}`).join(', ')}`);

  return sql.join('\n');
}

/**
 * Main function
 */
function main() {
  console.log('🚀 Extracting verb aspect information from morphology file...\n');
  console.log('📖 Reading file:', MORPHOLOGY_FILE);

  if (!fs.existsSync(MORPHOLOGY_FILE)) {
    console.error(`❌ File not found: ${MORPHOLOGY_FILE}`);
    process.exit(1);
  }

  console.log('🔨 Generating SQL...');
  const sql = generateSQL();

  // Ensure output directory exists
  const outputDir = require('path').dirname(OUTPUT_FILE);
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
  }

  // Write the SQL file
  try {
    fs.writeFileSync(OUTPUT_FILE, sql, 'utf-8');
    console.log(`✅ SQL written to: ${OUTPUT_FILE}\n`);
    
    // Count how many verbs will be updated
    const updateCount = (sql.match(/UPDATE words/g) || []).length;
    console.log(`📊 Will update ${updateCount} verbs with aspect information`);
    
    // Show breakdown
    const perfectCount = (sql.match(/"perfect"/g) || []).length;
    const imperfectCount = (sql.match(/"imperfect"/g) || []).length;
    const imperativeCount = (sql.match(/"imperative"/g) || []).length;
    console.log(`   Perfect: ${perfectCount}`);
    console.log(`   Imperfect: ${imperfectCount}`);
    console.log(`   Imperative: ${imperativeCount}`);
  } catch (error: any) {
    console.error(`❌ Error writing file: ${error.message}`);
    process.exit(1);
  }

  console.log('\n📝 Next steps:');
  console.log('   1. Review the SQL file');
  console.log('   2. Run it in Supabase SQL Editor');
  console.log('   3. Verify with: SELECT grammar_info->>\'aspect\', COUNT(*) FROM words WHERE grammar_info->>\'part_of_speech\' = \'Verb\' GROUP BY 1;');
}

main();

