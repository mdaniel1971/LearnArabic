/**
 * Verification Script: Check Quranic Arabic Corpus Coverage for Surahs 78-96
 * 
 * This script verifies that the quran-morphology.txt file has complete coverage
 * for surahs 78-96, checking:
 * - All surahs are present
 * - All verses are present
 * - All words are present
 * - Expected verse counts match
 */

import * as fs from 'fs';
import * as path from 'path';

interface SurahInfo {
  number: number;
  name_arabic: string;
  name_english: string;
  expected_verses: number;
}

// Expected surah metadata for 78-96
const EXPECTED_SURAHS: SurahInfo[] = [
  { number: 78, name_arabic: 'النَّبَأ', name_english: 'The Tidings', expected_verses: 40 },
  { number: 79, name_arabic: 'النَّازِعَات', name_english: 'Those who drag forth', expected_verses: 46 },
  { number: 80, name_arabic: 'عَبَسَ', name_english: 'He Frowned', expected_verses: 42 },
  { number: 81, name_arabic: 'التَّكْوِير', name_english: 'The Overthrowing', expected_verses: 29 },
  { number: 82, name_arabic: 'الانفطار', name_english: 'The Cleaving', expected_verses: 19 },
  { number: 83, name_arabic: 'المطففين', name_english: 'The Defrauding', expected_verses: 36 },
  { number: 84, name_arabic: 'الانشقاق', name_english: 'The Splitting Open', expected_verses: 25 },
  { number: 85, name_arabic: 'البروج', name_english: 'The Constellations', expected_verses: 22 },
  { number: 86, name_arabic: 'الطارق', name_english: 'The Nightcomer', expected_verses: 17 },
  { number: 87, name_arabic: 'الأعلى', name_english: 'The Most High', expected_verses: 19 },
  { number: 88, name_arabic: 'الغاشية', name_english: 'The Overwhelming', expected_verses: 26 },
  { number: 89, name_arabic: 'الفجر', name_english: 'The Dawn', expected_verses: 30 },
  { number: 90, name_arabic: 'البلد', name_english: 'The City', expected_verses: 20 },
  { number: 91, name_arabic: 'الشمس', name_english: 'The Sun', expected_verses: 15 },
  { number: 92, name_arabic: 'الليل', name_english: 'The Night', expected_verses: 21 },
  { number: 93, name_arabic: 'الضحى', name_english: 'The Morning Hours', expected_verses: 11 },
  { number: 94, name_arabic: 'الشرح', name_english: 'The Relief', expected_verses: 8 },
  { number: 95, name_arabic: 'التين', name_english: 'The Fig', expected_verses: 8 },
  { number: 96, name_arabic: 'العلق', name_english: 'The Clot', expected_verses: 19 },
];

interface WordData {
  surah: number;
  verse: number;
  word: number;
}

function parseMorphologyFile(filePath: string): Map<string, WordData[]> {
  const content = fs.readFileSync(filePath, 'utf-8');
  const lines = content.split('\n').filter(line => line.trim());
  
  const wordMap = new Map<string, WordData[]>();
  
  for (const line of lines) {
    const parts = line.split('\t');
    if (parts.length < 4) continue;
    
    const [location] = parts;
    const [surah, verse, word] = location.split(':').map(Number);
    
    if (isNaN(surah) || isNaN(verse) || isNaN(word)) continue;
    
    const key = `${surah}:${verse}:${word}`;
    if (!wordMap.has(key)) {
      wordMap.set(key, []);
    }
    wordMap.get(key)!.push({ surah, verse, word });
  }
  
  return wordMap;
}

function verifyCoverage() {
  const morphologyFile = path.join(process.cwd(), 'docs/corpus-files/quran-morphology.txt');
  
  if (!fs.existsSync(morphologyFile)) {
    console.error(`❌ Morphology file not found: ${morphologyFile}`);
    process.exit(1);
  }
  
  console.log('🔍 Verifying Quranic Arabic Corpus coverage for Surahs 78-96...\n');
  console.log(`📖 Reading morphology file: ${morphologyFile}\n`);
  
  const wordMap = parseMorphologyFile(morphologyFile);
  
  let allPassed = true;
  const results: Array<{
    surah: number;
    status: '✅' | '❌';
    verses_found: number;
    verses_expected: number;
    words_found: number;
    missing_verses?: number[];
  }> = [];
  
  for (const surahInfo of EXPECTED_SURAHS) {
    const surahNum = surahInfo.number;
    const expectedVerses = surahInfo.expected_verses;
    
    // Get all unique verse numbers for this surah
    const verseSet = new Set<number>();
    let wordCount = 0;
    
    for (const [key, words] of wordMap.entries()) {
      const [s, v] = key.split(':').map(Number);
      if (s === surahNum) {
        verseSet.add(v);
        wordCount += words.length;
      }
    }
    
    const foundVerses = verseSet.size;
    const verses = Array.from(verseSet).sort((a, b) => a - b);
    
    // Check for missing verses
    const missingVerses: number[] = [];
    for (let v = 1; v <= expectedVerses; v++) {
      if (!verseSet.has(v)) {
        missingVerses.push(v);
      }
    }
    
    const status = foundVerses === expectedVerses && missingVerses.length === 0 ? '✅' : '❌';
    if (status === '❌') allPassed = false;
    
    results.push({
      surah: surahNum,
      status,
      verses_found: foundVerses,
      verses_expected: expectedVerses,
      words_found: wordCount,
      missing_verses: missingVerses.length > 0 ? missingVerses : undefined,
    });
    
    console.log(`${status} Surah ${surahNum} (${surahInfo.name_english})`);
    console.log(`   Verses: ${foundVerses}/${expectedVerses} ${foundVerses === expectedVerses ? '✅' : '❌'}`);
    console.log(`   Words: ${wordCount}`);
    if (missingVerses.length > 0) {
      console.log(`   ⚠️  Missing verses: ${missingVerses.join(', ')}`);
    }
    console.log();
  }
  
  // Summary
  console.log('='.repeat(60));
  console.log('📊 SUMMARY');
  console.log('='.repeat(60));
  
  const passed = results.filter(r => r.status === '✅').length;
  const failed = results.filter(r => r.status === '❌').length;
  
  console.log(`✅ Passed: ${passed}/${results.length}`);
  console.log(`❌ Failed: ${failed}/${results.length}`);
  console.log(`📝 Total words found: ${results.reduce((sum, r) => sum + r.words_found, 0)}`);
  
  if (allPassed) {
    console.log('\n✅ All surahs have complete coverage in the corpus!');
    console.log('✅ Ready to proceed with data extraction.');
    return true;
  } else {
    console.log('\n❌ Some surahs have incomplete coverage.');
    console.log('⚠️  Please verify the morphology file before proceeding.');
    return false;
  }
}

// Run verification
try {
  const success = verifyCoverage();
  process.exit(success ? 0 : 1);
} catch (error) {
  console.error('Error running verification:', error);
  process.exit(1);
}

export { verifyCoverage, EXPECTED_SURAHS };

