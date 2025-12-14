/**
 * Generate SQL UPDATE statements to fix misclassified pronouns
 * 
 * This script:
 * 1. Parses the morphology file to find standalone pronouns
 * 2. Generates SQL UPDATE statements to fix them in the database
 * 3. Creates an idempotent SQL file
 * 
 * Usage: npx tsx scripts/generate-pronoun-fix-sql.ts
 */

import * as fs from 'fs';
import * as path from 'path';
import { determineMainPOS } from '../docs/corpus-files/parse-morphology';

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

function generateSQL() {
  const morphologyFile = path.join(process.cwd(), 'docs/corpus-files/quran-morphology.txt');
  
  if (!fs.existsSync(morphologyFile)) {
    console.error(`❌ Morphology file not found: ${morphologyFile}`);
    process.exit(1);
  }
  
  console.log('📖 Parsing morphology file...');
  const morphologyMap = parseMorphologyFile(morphologyFile);
  console.log(`✓ Loaded ${morphologyMap.size} words\n`);
  
  console.log('🔍 Identifying standalone pronouns...');
  
  const pronounFixes: Array<{
    surah: number;
    verse: number;
    word: number;
    arabic: string;
    grammar: any;
  }> = [];
  
  for (const [key, wordData] of morphologyMap.entries()) {
    const [surah, verse, word] = key.split(':').map(Number);
    
    // Get correct grammar info from morphology
    const correctGrammar = determineMainPOS(wordData.segments);
    
    // Check if this is a pronoun
    const isPronoun = correctGrammar?.part_of_speech === 'Pronoun' || 
                     correctGrammar?.part_of_speech === 'pronoun';
    
    if (isPronoun) {
      // Get the Arabic text from the first segment
      const arabic = wordData.segments[0]?.arabic || '';
      
      pronounFixes.push({
        surah,
        verse,
        word,
        arabic,
        grammar: correctGrammar,
      });
    }
  }
  
  console.log(`✓ Found ${pronounFixes.length} pronouns to fix\n`);
  
  // Generate SQL
  const sqlLines: string[] = [];
  sqlLines.push('-- Fix Pronoun Classification from Quranic Arabic Corpus');
  sqlLines.push('-- This script updates grammar_info for standalone pronouns that were misclassified as "Noun"');
  sqlLines.push('-- Source: quran-morphology.txt from https://github.com/mustafa0x/quran-morphology');
  sqlLines.push('-- Generated: ' + new Date().toISOString());
  sqlLines.push('');
  sqlLines.push('-- Total pronouns to fix: ' + pronounFixes.length);
  sqlLines.push('');
  
  // Group by surah for better organization
  const bySurah = new Map<number, typeof pronounFixes>();
  pronounFixes.forEach(fix => {
    if (!bySurah.has(fix.surah)) {
      bySurah.set(fix.surah, []);
    }
    bySurah.get(fix.surah)!.push(fix);
  });
  
  for (const [surah, fixes] of Array.from(bySurah.entries()).sort((a, b) => a[0] - b[0])) {
    sqlLines.push(`-- Surah ${surah} (${fixes.length} pronouns)`);
    
    for (const fix of fixes) {
      // Create the grammar_info JSONB object
      const grammarJson = JSON.stringify(fix.grammar);
      
      sqlLines.push(`UPDATE words`);
      sqlLines.push(`SET grammar_info = '${grammarJson.replace(/'/g, "''")}'::jsonb`);
      sqlLines.push(`WHERE verse_id = (`);
      sqlLines.push(`  SELECT v.id FROM verses v`);
      sqlLines.push(`  JOIN surahs s ON v.surah_id = s.id`);
      sqlLines.push(`  WHERE s.surah_number = ${fix.surah} AND v.verse_number = ${fix.verse}`);
      sqlLines.push(`)`);
      sqlLines.push(`  AND word_position = ${fix.word};`);
      sqlLines.push('');
    }
  }
  
  // Add summary comment
  sqlLines.push('-- Verification query:');
  sqlLines.push('-- SELECT COUNT(*) FROM words WHERE grammar_info->>\'part_of_speech\' = \'Pronoun\';');
  sqlLines.push('');
  
  return sqlLines.join('\n');
}

// Generate and save SQL
(async () => {
  try {
    const sql = generateSQL();
    const outputFile = path.join(process.cwd(), 'supabase/migrations/20241208000001_fix_pronoun_classification.sql');
    
    fs.writeFileSync(outputFile, sql);
    
    console.log('✅ SQL file generated!');
    console.log(`📄 Location: ${outputFile}`);
    console.log(`📊 Total size: ${sql.length} characters`);
    console.log('\n📋 First 5 UPDATE statements:');
    console.log('='.repeat(70));
    
    const lines = sql.split('\n');
    let updateCount = 0;
    let inUpdate = false;
    let currentUpdate: string[] = [];
    
    for (const line of lines) {
      if (line.trim().startsWith('UPDATE words')) {
        if (inUpdate && currentUpdate.length > 0) {
          console.log(currentUpdate.join('\n'));
          console.log();
          updateCount++;
          if (updateCount >= 5) break;
        }
        inUpdate = true;
        currentUpdate = [line];
      } else if (inUpdate) {
        currentUpdate.push(line);
        if (line.trim() === '' && currentUpdate.length > 1) {
          // End of UPDATE statement
          console.log(currentUpdate.join('\n'));
          console.log();
          updateCount++;
          if (updateCount >= 5) break;
          inUpdate = false;
          currentUpdate = [];
        }
      }
    }
    
    console.log('='.repeat(70));
    console.log(`\n✅ Complete SQL file ready at: ${outputFile}`);
    console.log('📝 You can now run this file in Supabase SQL Editor');
  } catch (error: any) {
    console.error('❌ Error:', error.message);
    console.error(error.stack);
    process.exit(1);
  }
})();

