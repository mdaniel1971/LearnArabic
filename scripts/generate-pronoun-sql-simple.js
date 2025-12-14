/**
 * Simple Node.js script to generate SQL for pronoun fixes
 */

const fs = require('fs');
const path = require('path');

// Parse morphology file
const morphologyFile = path.join(__dirname, '../docs/corpus-files/quran-morphology.txt');
const content = fs.readFileSync(morphologyFile, 'utf-8');
const lines = content.split('\n').filter(l => l.trim());

const wordMap = new Map();

for (const line of lines) {
  const parts = line.split('\t');
  if (parts.length < 4) continue;
  const [location, arabic, pos, features] = parts;
  const [surah, verse, word] = location.split(':').map(Number);
  if (isNaN(surah) || isNaN(verse) || isNaN(word)) continue;
  if (surah !== 1 && (surah < 78 || surah > 114)) continue;
  const key = `${surah}:${verse}:${word}`;
  if (!wordMap.has(key)) {
    wordMap.set(key, { surah, verse, word, segments: [] });
  }
  wordMap.get(key).segments.push({ arabic, pos, features });
}

console.log(`Loaded ${wordMap.size} words from morphology file`);

// Find standalone pronouns
const pronouns = [];
for (const [key, data] of wordMap.entries()) {
  // Check if any segment is a standalone pronoun (has PRON, not SUFF, not PREF)
  const standalonePronoun = data.segments.find(s => 
    s.features.includes('PRON') && !s.features.includes('SUFF') && !s.features.includes('PREF')
  );
  
  if (standalonePronoun) {
    // Extract pronoun details
    const features = standalonePronoun.features;
    const grammar = {
      part_of_speech: 'Pronoun',
      features: ['pronoun']
    };
    
    // Extract person, number, gender from features like "3MP", "2FS", etc.
    if (features.includes('1P') || features.match(/\b1P\b/)) {
      grammar.person = 'first';
      grammar.number = 'plural';
    } else if (features.includes('1S') || features.match(/\b1S\b/)) {
      grammar.person = 'first';
      grammar.number = 'singular';
    } else if (features.includes('2P') || features.match(/\b2P\b/)) {
      grammar.person = 'second';
      grammar.number = 'plural';
    } else if (features.includes('2MS') || features.match(/\b2MS\b/)) {
      grammar.person = 'second';
      grammar.number = 'singular';
      grammar.gender = 'masculine';
    } else if (features.includes('2FS') || features.match(/\b2FS\b/)) {
      grammar.person = 'second';
      grammar.number = 'singular';
      grammar.gender = 'feminine';
    } else if (features.includes('2MP') || features.match(/\b2MP\b/)) {
      grammar.person = 'second';
      grammar.number = 'plural';
      grammar.gender = 'masculine';
    } else if (features.includes('2FP') || features.match(/\b2FP\b/)) {
      grammar.person = 'second';
      grammar.number = 'plural';
      grammar.gender = 'feminine';
    } else if (features.includes('3P') || features.match(/\b3P\b/)) {
      grammar.person = 'third';
      grammar.number = 'plural';
    } else if (features.includes('3MS') || features.match(/\b3MS\b/)) {
      grammar.person = 'third';
      grammar.number = 'singular';
      grammar.gender = 'masculine';
    } else if (features.includes('3FS') || features.match(/\b3FS\b/)) {
      grammar.person = 'third';
      grammar.number = 'singular';
      grammar.gender = 'feminine';
    } else if (features.includes('3MP') || features.match(/\b3MP\b/)) {
      grammar.person = 'third';
      grammar.number = 'plural';
      grammar.gender = 'masculine';
    } else if (features.includes('3FP') || features.match(/\b3FP\b/)) {
      grammar.person = 'third';
      grammar.number = 'plural';
      grammar.gender = 'feminine';
    } else if (features.includes('2D') || features.match(/\b2D\b/)) {
      grammar.person = 'second';
      grammar.number = 'dual';
    } else if (features.includes('3D') || features.match(/\b3D\b/)) {
      grammar.person = 'third';
      grammar.number = 'dual';
    } else if (features.includes('3MD') || features.match(/\b3MD\b/)) {
      grammar.person = 'third';
      grammar.number = 'dual';
      grammar.gender = 'masculine';
    } else if (features.includes('3FD') || features.match(/\b3FD\b/)) {
      grammar.person = 'third';
      grammar.number = 'dual';
      grammar.gender = 'feminine';
    }
    
    // Extract case if present
    if (features.includes('GEN')) grammar.case = 'genitive';
    if (features.includes('NOM')) grammar.case = 'nominative';
    if (features.includes('ACC')) grammar.case = 'accusative';
    
    pronouns.push({
      surah: data.surah,
      verse: data.verse,
      word: data.word,
      arabic: data.segments[0]?.arabic || '',
      grammar
    });
  }
}

console.log(`Found ${pronouns.length} standalone pronouns\n`);

// Generate SQL
const sqlLines = [];
sqlLines.push('-- Fix Pronoun Classification from Quranic Arabic Corpus');
sqlLines.push('-- This script updates grammar_info for standalone pronouns that were misclassified as "Noun"');
sqlLines.push('-- Source: quran-morphology.txt from https://github.com/mustafa0x/quran-morphology');
sqlLines.push(`-- Generated: ${new Date().toISOString()}`);
sqlLines.push('');
sqlLines.push(`-- Total pronouns to fix: ${pronouns.length}`);
sqlLines.push('');

// Group by surah
const bySurah = new Map();
pronouns.forEach(p => {
  if (!bySurah.has(p.surah)) {
    bySurah.set(p.surah, []);
  }
  bySurah.get(p.surah).push(p);
});

// Generate UPDATE statements
for (const [surah, fixes] of Array.from(bySurah.entries()).sort((a, b) => a[0] - b[0])) {
  sqlLines.push(`-- Surah ${surah} (${fixes.length} pronouns)`);
  
  for (const fix of fixes) {
    const grammarJson = JSON.stringify(fix.grammar);
    const escapedJson = grammarJson.replace(/'/g, "''");
    
    sqlLines.push(`UPDATE words`);
    sqlLines.push(`SET grammar_info = '${escapedJson}'::jsonb`);
    sqlLines.push(`WHERE verse_id = (`);
    sqlLines.push(`  SELECT v.id FROM verses v`);
    sqlLines.push(`  JOIN surahs s ON v.surah_id = s.id`);
    sqlLines.push(`  WHERE s.surah_number = ${fix.surah} AND v.verse_number = ${fix.verse}`);
    sqlLines.push(`)`);
    sqlLines.push(`  AND word_position = ${fix.word};`);
    sqlLines.push('');
  }
}

sqlLines.push('-- Verification query:');
sqlLines.push("-- SELECT COUNT(*) FROM words WHERE grammar_info->>'part_of_speech' = 'Pronoun';");
sqlLines.push('');

const sql = sqlLines.join('\n');
const outputFile = path.join(__dirname, '../supabase/migrations/20241208000001_fix_pronoun_classification.sql');

fs.writeFileSync(outputFile, sql);

console.log('✅ SQL file generated!');
console.log(`📄 Location: ${outputFile}`);
console.log(`📊 Total size: ${sql.length} characters`);
console.log('\n📋 First 5 UPDATE statements:');
console.log('='.repeat(70));

const lines = sql.split('\n');
let updateCount = 0;
let inUpdate = false;
let currentUpdate = [];

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

