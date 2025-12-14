/**
 * Step 1: Verification Script
 * Verifies Quranic Arabic Corpus has complete coverage for surahs 78-96
 */

import * as fs from 'fs';
import * as path from 'path';

const EXPECTED_SURAHS = [
  { number: 78, name: 'The Tidings', verses: 40 },
  { number: 79, name: 'Those who drag forth', verses: 46 },
  { number: 80, name: 'He Frowned', verses: 42 },
  { number: 81, name: 'The Overthrowing', verses: 29 },
  { number: 82, name: 'The Cleaving', verses: 19 },
  { number: 83, name: 'The Defrauding', verses: 36 },
  { number: 84, name: 'The Splitting Open', verses: 25 },
  { number: 85, name: 'The Constellations', verses: 22 },
  { number: 86, name: 'The Nightcomer', verses: 17 },
  { number: 87, name: 'The Most High', verses: 19 },
  { number: 88, name: 'The Overwhelming', verses: 26 },
  { number: 89, name: 'The Dawn', verses: 30 },
  { number: 90, name: 'The City', verses: 20 },
  { number: 91, name: 'The Sun', verses: 15 },
  { number: 92, name: 'The Night', verses: 21 },
  { number: 93, name: 'The Morning Hours', verses: 11 },
  { number: 94, name: 'The Relief', verses: 8 },
  { number: 95, name: 'The Fig', verses: 8 },
  { number: 96, name: 'The Clot', verses: 19 },
];

function verifyCoverage() {
  const morphologyFile = path.join(process.cwd(), 'docs/corpus-files/quran-morphology.txt');
  
  console.log('🔍 Verifying Quranic Arabic Corpus coverage for Surahs 78-96\n');
  console.log(`📖 Reading: ${morphologyFile}\n`);
  
  if (!fs.existsSync(morphologyFile)) {
    console.error(`❌ File not found: ${morphologyFile}`);
    return false;
  }
  
  const content = fs.readFileSync(morphologyFile, 'utf-8');
  const lines = content.split('\n');
  
  // Count verses per surah
  const verseCounts = new Map<number, Set<number>>();
  const wordCounts = new Map<number, number>();
  
  for (const line of lines) {
    if (!line.trim()) continue;
    const parts = line.split('\t');
    if (parts.length < 4) continue;
    
    const [location] = parts;
    const [surah, verse] = location.split(':').map(Number);
    
    if (isNaN(surah) || isNaN(verse) || surah < 78 || surah > 96) continue;
    
    if (!verseCounts.has(surah)) {
      verseCounts.set(surah, new Set());
      wordCounts.set(surah, 0);
    }
    verseCounts.get(surah)!.add(verse);
    wordCounts.set(surah, (wordCounts.get(surah) || 0) + 1);
  }
  
  let allPassed = true;
  console.log('Results:\n');
  
  for (const expected of EXPECTED_SURAHS) {
    const found = verseCounts.get(expected.number);
    const foundVerses = found ? found.size : 0;
    const words = wordCounts.get(expected.number) || 0;
    const passed = foundVerses === expected.verses;
    
    if (!passed) allPassed = false;
    
    const status = passed ? '✅' : '❌';
    console.log(`${status} Surah ${expected.number} (${expected.name})`);
    console.log(`   Verses: ${foundVerses}/${expected.verses} ${passed ? '' : '❌'}`);
    console.log(`   Words: ${words}`);
    
    if (!passed && found) {
      const missing: number[] = [];
      for (let v = 1; v <= expected.verses; v++) {
        if (!found.has(v)) missing.push(v);
      }
      if (missing.length > 0) {
        console.log(`   ⚠️  Missing verses: ${missing.slice(0, 10).join(', ')}${missing.length > 10 ? '...' : ''}`);
      }
    }
    console.log();
  }
  
  console.log('='.repeat(60));
  const passed = EXPECTED_SURAHS.filter(e => {
    const found = verseCounts.get(e.number);
    return found && found.size === e.verses;
  }).length;
  
  console.log(`✅ Passed: ${passed}/${EXPECTED_SURAHS.length}`);
  console.log(`❌ Failed: ${EXPECTED_SURAHS.length - passed}/${EXPECTED_SURAHS.length}`);
  console.log(`📝 Total words: ${Array.from(wordCounts.values()).reduce((a, b) => a + b, 0)}`);
  
  if (allPassed) {
    console.log('\n✅ All surahs have complete coverage!');
    return true;
  } else {
    console.log('\n❌ Some surahs have incomplete coverage.');
    return false;
  }
}

verifyCoverage();

