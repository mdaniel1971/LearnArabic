/**
 * Extract verb form (VF:1, VF:2, etc.) from quran-morphology.txt and generate SQL
 * to add form field to grammar_info JSONB column for verbs in surahs 97-114
 */

import * as fs from 'fs';

const MORPHOLOGY_FILE = '/Users/admin/Coding/LearnArabic/docs/corpus-files/quran-morphology.txt';
const OUTPUT_FILE = '/Users/admin/Coding/LearnArabic/supabase/migrations/20241207000005_add_verb_form.sql';

/**
 * Extract verb form from morphology line
 * Format: VF:1, VF:2, etc. (Arabic verb forms I-X)
 */
function extractVerbForm(features: string): string | null {
  const match = features.match(/VF:(\d+)/);
  if (match) {
    return `Form ${match[1]}`;
  }
  return null;
}

/**
 * Generate SQL to add form to grammar_info
 */
function generateSQL(): string {
  const content = fs.readFileSync(MORPHOLOGY_FILE, 'utf-8');
  const lines = content.split('\n');

  const sql: string[] = [];
  sql.push('-- Add verb form information to verbs in surahs 97-114');
  sql.push('-- Source: quran-morphology.txt');
  sql.push('-- Extracted from VF:X code in morphology features (VF:1 = Form I, VF:2 = Form II, etc.)');
  sql.push('-- Generated: ' + new Date().toISOString());
  sql.push('-- Note: Only updates verbs that don\'t already have form set\n');

  let currentSurah = -1;
  let updateCount = 0;

  for (const line of lines) {
    if (!line.includes('\tV\t')) continue;
    
    const parts = line.split('\t');
    if (parts.length < 4) continue;
    
    const [location, , , features] = parts;
    const [surah, verse, word] = location.split(':').map(Number);
    
    if (surah < 97 || surah > 114) continue;
    
    const form = extractVerbForm(features);
    if (!form) continue; // No form information
    
    if (surah !== currentSurah) {
      currentSurah = surah;
      sql.push(`\n-- ========== SURAH ${currentSurah} ==========`);
    }
    
    sql.push(`
UPDATE words 
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{form}',
  '"${form}"'::jsonb
)
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = ${surah}
  AND v.verse_number = ${verse}
)
AND word_position = ${word}
AND grammar_info->>'part_of_speech' = 'Verb'
AND (grammar_info->>'form' IS NULL OR grammar_info->>'form' = '');`);
    
    updateCount++;
  }

  sql.push(`\n-- Total verbs updated: ${updateCount}`);

  return sql.join('\n');
}

/**
 * Main function
 */
function main() {
  console.log('🚀 Extracting verb form information from morphology file...\n');
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
    console.log(`📊 Will update ${updateCount} verbs with form information`);
  } catch (error: any) {
    console.error(`❌ Error writing file: ${error.message}`);
    process.exit(1);
  }

  console.log('\n📝 Next steps:');
  console.log('   1. Review the SQL file');
  console.log('   2. Run it in Supabase SQL Editor');
  console.log('   3. Verify with: SELECT grammar_info->>\'form\', COUNT(*) FROM words WHERE grammar_info->>\'part_of_speech\' = \'Verb\' GROUP BY 1;');
}

main();

