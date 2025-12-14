/**
 * Script to fetch and parse Quranic Arabic Corpus morphological data
 * 
 * This script:
 * 1. Downloads the morphological data from Quranic Arabic Corpus
 * 2. Parses the data for Surah 1 (Al-Fatiha) and Surahs 97-114 (Juz Amma)
 * 3. Extracts accurate grammar information for each word
 * 4. Generates SQL update statements to fix your database
 * 
 * Data source: https://corpus.quran.com/
 * Archive: https://archive.org/details/quranicarabiccorpus
 */

import * as fs from 'fs';
import * as https from 'https';

// Target surahs: 1 (Al-Fatiha) and 97-114 (Juz Amma)
const TARGET_SURAHS = [1, ...Array.from({length: 18}, (_, i) => 97 + i)]; // [1, 97, 98, ..., 114]

interface MorphologyData {
  surah: number;
  verse: number;
  wordPosition: number;
  arabicText: string;
  morphology: {
    partOfSpeech: string;
    features: string[];
  };
}

/**
 * Download the morphological data file from Internet Archive
 */
async function downloadCorpusData(): Promise<string> {
  const url = 'https://archive.org/download/quranicarabiccorpus/quranic-corpus-morphology-0.4.txt';
  
  return new Promise((resolve, reject) => {
    console.log('Downloading Quranic Arabic Corpus data...');
    
    https.get(url, (response) => {
      let data = '';
      
      response.on('data', (chunk) => {
        data += chunk;
      });
      
      response.on('end', () => {
        console.log('Download complete!');
        resolve(data);
      });
      
    }).on('error', (err) => {
      reject(err);
    });
  });
}

/**
 * Parse the morphological data file
 * 
 * Format example:
 * LOCATION     (1:1:1)  bismil~ahi
 * PREFIX       bi        PREP      preposition
 * STEM         {isotam   N         noun
 * SUFFIX       hi        PRON      pronoun
 */
function parseCorpusData(rawData: string): MorphologyData[] {
  const lines = rawData.split('\n');
  const parsedData: MorphologyData[] = [];
  
  let currentLocation: {surah: number, verse: number, word: number} | null = null;
  let currentArabic = '';
  let morphParts: {type: string, pos: string, features: string[]}[] = [];
  
  for (const line of lines) {
    // Skip comments and empty lines
    if (line.startsWith('#') || line.trim() === '') {
      continue;
    }
    
    // Parse LOCATION line (e.g., "LOCATION (1:1:1) bismil~ahi")
    const locationMatch = line.match(/LOCATION\s+\((\d+):(\d+):(\d+)\)\s+(.+)/);
    if (locationMatch) {
      // If we have previous word data, save it
      if (currentLocation && morphParts.length > 0) {
        parsedData.push({
          surah: currentLocation.surah,
          verse: currentLocation.verse,
          wordPosition: currentLocation.word,
          arabicText: currentArabic,
          morphology: combineMorphology(morphParts)
        });
      }
      
      // Start new word
      currentLocation = {
        surah: parseInt(locationMatch[1]),
        verse: parseInt(locationMatch[2]),
        word: parseInt(locationMatch[3])
      };
      currentArabic = locationMatch[4];
      morphParts = [];
      continue;
    }
    
    // Parse morphology lines (PREFIX, STEM, SUFFIX)
    const morphMatch = line.match(/^(PREFIX|STEM|SUFFIX)\s+(\S+)\s+(\S+)\s+(.+)/);
    if (morphMatch && currentLocation) {
      const [, type, , pos, description] = morphMatch;
      morphParts.push({
        type,
        pos,
        features: [description]
      });
    }
  }
  
  // Don't forget the last word
  if (currentLocation && morphParts.length > 0) {
    parsedData.push({
      surah: currentLocation.surah,
      verse: currentLocation.verse,
      wordPosition: currentLocation.word,
      arabicText: currentArabic,
      morphology: combineMorphology(morphParts)
    });
  }
  
  return parsedData;
}

/**
 * Combine morphological parts into a coherent part of speech
 */
function combineMorphology(parts: {type: string, pos: string}[]): {partOfSpeech: string, features: string[]} {
  // Map Corpus POS tags to our standardized tags
  const posMap: {[key: string]: string} = {
    'N': 'Noun',
    'PRON': 'Pronoun',
    'V': 'Verb',
    'ADJ': 'Adjective',
    'P': 'Particle',
    'PREP': 'Preposition',
    'CONJ': 'Conjunction',
    'INTERROG': 'Interrogative',
    'NEG': 'Negative Particle',
    'DEM': 'Demonstrative',
    'REL': 'Relative Pronoun',
    'T': 'Time Adverb',
    'LOC': 'Locative Adverb',
    'ADV': 'Adverb',
    'ACC': 'Accusative Particle',
    'AMD': 'Amendment Particle',
    'ANS': 'Answer Particle',
    'AVR': 'Aversion Particle',
    'CERT': 'Certainty Particle',
    'CIRC': 'Circumstantial Particle',
    'EMPH': 'Emphasis Particle',
    'EXH': 'Exhortation Particle',
    'EXL': 'Explanation Particle',
    'EXP': 'Exceptive Particle',
    'FUT': 'Future Particle',
    'INC': 'Inceptive Particle',
    'INT': 'Interpretation Particle',
    'INTG': 'Interrogative Particle',
    'PREV': 'Preventive Particle',
    'PRO': 'Prohibition Particle',
    'REM': 'Resumption Particle',
    'RES': 'Restriction Particle',
    'RET': 'Retraction Particle',
    'SUP': 'Supplemental Particle',
    'SUR': 'Surprise Particle',
    'VOC': 'Vocative Particle',
  };
  
  // If there's a STEM, that's usually the main POS
  const stem = parts.find(p => p.type === 'STEM');
  const prefix = parts.find(p => p.type === 'PREFIX');
  const suffix = parts.find(p => p.type === 'SUFFIX');
  
  let mainPos = stem?.pos || prefix?.pos || 'Unknown';
  let features: string[] = [];
  
  // Handle compound cases (preposition + noun, etc.)
  if (prefix?.pos === 'PREP' && stem?.pos === 'N') {
    return {
      partOfSpeech: 'preposition_noun',
      features: ['preposition', 'noun']
    };
  }
  
  if (prefix?.pos === 'PREP' && suffix?.pos === 'PRON') {
    return {
      partOfSpeech: 'preposition_pronoun',
      features: ['preposition', 'pronoun']
    };
  }
  
  if (prefix?.pos === 'CONJ' && suffix?.pos === 'PRON') {
    return {
      partOfSpeech: 'conjunction_pronoun',
      features: ['conjunction', 'pronoun']
    };
  }
  
  // Standard mapping
  return {
    partOfSpeech: posMap[mainPos] || mainPos,
    features: parts.map(p => posMap[p.pos] || p.pos)
  };
}

/**
 * Filter data for target surahs only
 */
function filterTargetSurahs(data: MorphologyData[]): MorphologyData[] {
  return data.filter(word => TARGET_SURAHS.includes(word.surah));
}

/**
 * Generate SQL update statements
 */
function generateSQLUpdates(data: MorphologyData[]): string {
  const updates: string[] = [];
  
  // Group by surah and verse
  const groupedData: {[key: string]: MorphologyData[]} = {};
  
  for (const word of data) {
    const key = `${word.surah}:${word.verse}`;
    if (!groupedData[key]) {
      groupedData[key] = [];
    }
    groupedData[key].push(word);
  }
  
  // Generate UPDATE statements
  updates.push('-- SQL to update grammar_info for Surahs 97-114');
  updates.push('-- Generated from Quranic Arabic Corpus v0.4\n');
  
  for (const [verseKey, words] of Object.entries(groupedData)) {
    const [surah, verse] = verseKey.split(':').map(Number);
    
    // Skip Surah 1 (Al-Fatiha) since you manually created that
    if (surah === 1) {
      continue;
    }
    
    updates.push(`\n-- Surah ${surah}, Verse ${verse}`);
    
    for (const word of words) {
      const grammarInfo = {
        part_of_speech: word.morphology.partOfSpeech,
        features: word.morphology.features
      };
      
      updates.push(`
UPDATE words 
SET grammar_info = '${JSON.stringify(grammarInfo)}'::jsonb
WHERE verse_id = (
  SELECT id FROM verses 
  WHERE surah_id = (SELECT id FROM surahs WHERE surah_number = ${surah})
  AND verse_number = ${verse}
)
AND word_position = ${word.wordPosition};`);
    }
  }
  
  return updates.join('\n');
}

/**
 * Main execution
 */
async function main() {
  try {
    console.log('Starting Quranic Arabic Corpus data extraction...\n');
    
    // Step 1: Download data
    const rawData = await downloadCorpusData();
    
    // Step 2: Parse data
    console.log('Parsing morphological data...');
    const allData = parseCorpusData(rawData);
    console.log(`Parsed ${allData.length} words total\n`);
    
    // Step 3: Filter for target surahs
    console.log('Filtering for target surahs...');
    const targetData = filterTargetSurahs(allData);
    console.log(`Found ${targetData.length} words in target surahs\n`);
    
    // Step 4: Generate SQL
    console.log('Generating SQL update statements...');
    const sql = generateSQLUpdates(targetData);
    
    // Step 5: Save to file
    const outputFile = './update-grammar-from-corpus.sql';
    fs.writeFileSync(outputFile, sql);
    console.log(`\n✅ SQL file generated: ${outputFile}`);
    
    // Step 6: Show sample
    console.log('\n📊 Sample of corrections:');
    console.log('----------------------------');
    
    // Find the word مِن (min) as an example
    const minExample = targetData.find(w => 
      w.arabicText.includes('min') || w.arabicText.includes('من')
    );
    
    if (minExample) {
      console.log(`Example: مِن (min)`);
      console.log(`  - Part of Speech: ${minExample.morphology.partOfSpeech}`);
      console.log(`  - Features: ${minExample.morphology.features.join(', ')}`);
    }
    
    console.log('\n✅ Done! You can now run the SQL file in Supabase to update your grammar data.');
    
  } catch (error) {
    console.error('Error:', error);
    process.exit(1);
  }
}

// Run the script
main();
