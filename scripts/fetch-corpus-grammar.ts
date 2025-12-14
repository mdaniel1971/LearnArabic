/**
 * Fetch and Parse Quranic Arabic Corpus Morphology Data
 * 
 * This script downloads the morphology file from Quranic Arabic Corpus,
 * parses it for surahs 97-114, and generates SQL UPDATE statements
 * to fix the grammar_info column in the words table.
 * 
 * Source: https://archive.org/download/quranicarabiccorpus/quranic-corpus-morphology-0.4.txt
 */

import { writeFileSync, mkdirSync, readFileSync, existsSync } from 'fs';
import { join } from 'path';
import https from 'https';
import { URL } from 'url';
import { execSync } from 'child_process';

// POS tag mapping from Corpus format to our standardized format
const POS_MAP: Record<string, string> = {
  'PREP': 'Preposition',
  'N': 'Noun',
  'V': 'Verb',
  'PRON': 'Pronoun',
  'ADJ': 'Adjective',
  'CONJ': 'Conjunction',
  'P': 'Particle',
  'DET': 'Determiner',
  'NEG': 'Negative Particle',
  'NUM': 'Number',
  'ADV': 'Adverb',
  'RES': 'Response Particle',
  'EMPH': 'Emphatic Particle',
  'INL': 'Interjection',
  'PROP': 'Proper Noun',
  'REL': 'Relative Pronoun',
  'DEM': 'Demonstrative',
  'T': 'Time Adverb',
  'LOC': 'Location Adverb',
  'INTG': 'Interrogative',
  'ACC': 'Accusative Particle',
  'CIRC': 'Circumstantial Particle',
  'COND': 'Conditional Particle',
  'EXH': 'Exhortation Particle',
  'FUT': 'Future Particle',
  'INC': 'Inceptive Particle',
  'PRP': 'Purpose Particle',
  'PRO': 'Prohibition Particle',
  'SUB': 'Subjunctive Particle',
  'SUP': 'Supplemental Particle',
  'VOC': 'Vocative Particle',
};

interface WordMorphology {
  surah: number;
  verse: number;
  wordPosition: number;
  parts: Array<{
    type: 'PREFIX' | 'STEM' | 'SUFFIX';
    pos: string;
    text: string;
  }>;
}

/**
 * Parse the morphology file and extract word data
 */
function parseMorphologyFile(content: string): WordMorphology[] {
  const words: WordMorphology[] = [];
  const lines = content.split('\n');
  
  let currentWord: WordMorphology | null = null;
  let currentParts: Array<{ type: 'PREFIX' | 'STEM' | 'SUFFIX'; pos: string; text: string }> = [];
  
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i].trim();
    
    // Skip empty lines
    if (!line) continue;
    
    // Parse LOCATION line: LOCATION     (97:1:1)  <arabic_text>
    if (line.startsWith('LOCATION')) {
      // Save previous word if exists (even if no parts, we still want to track it)
      if (currentWord) {
        currentWord.parts = [...currentParts];
        words.push(currentWord);
        currentParts = [];
      }
      
      // Extract location: (97:1:1)
      const locationMatch = line.match(/\((\d+):(\d+):(\d+)\)/);
      if (locationMatch) {
        const surah = parseInt(locationMatch[1], 10);
        const verse = parseInt(locationMatch[2], 10);
        const wordPosition = parseInt(locationMatch[3], 10);
        
        // Only process surahs 97-114 (skip Surah 1)
        if (surah >= 97 && surah <= 114) {
          currentWord = {
            surah,
            verse,
            wordPosition,
            parts: []
          };
        } else {
          currentWord = null;
        }
      }
    }
    // Parse PREFIX, STEM, or SUFFIX lines
    else if (currentWord && (line.startsWith('PREFIX') || line.startsWith('STEM') || line.startsWith('SUFFIX'))) {
      // Handle tab-separated or space-separated format
      const parts = line.split(/\s+/).filter(p => p.length > 0);
      if (parts.length >= 3) {
        const type = parts[0] as 'PREFIX' | 'STEM' | 'SUFFIX';
        const text = parts[1] || '';
        const pos = parts[2] || '';
        
        // Map POS tag if available, otherwise use the original tag
        if (pos && POS_MAP[pos]) {
          currentParts.push({
            type,
            pos: POS_MAP[pos],
            text
          });
        } else if (pos) {
          // If POS tag not in map, use a default mapping or the tag itself
          // This handles unknown tags gracefully
          currentParts.push({
            type,
            pos: pos, // Keep original tag if not mapped
            text
          });
        }
      }
    }
  }
  
  // Don't forget the last word
  if (currentWord) {
    currentWord.parts = [...currentParts];
    words.push(currentWord);
  }
  
  return words;
}

/**
 * Determine the combined part of speech for a word with multiple parts
 */
function getCombinedPartOfSpeech(parts: Array<{ type: string; pos: string }>): string {
  if (parts.length === 0) return 'Noun'; // Default fallback
  
  // Check if parts have mapped POS tags (they should, since we only add mapped ones)
  // But handle edge cases where unmapped tags might slip through
  const validParts = parts.filter(p => p.pos && p.pos.length > 0);
  
  if (validParts.length === 0) {
    return 'Noun'; // Default fallback
  }
  
  // If only one part, use that
  if (validParts.length === 1) {
    return validParts[0].pos;
  }
  
  // For compound words, combine them (e.g., PREP + N = "preposition_noun")
  const posList = validParts.map(p => p.pos.toLowerCase());
  
  // Common combinations
  if (posList.includes('preposition') && posList.includes('noun')) {
    return 'preposition_noun';
  }
  if (posList.includes('preposition') && posList.includes('pronoun')) {
    return 'preposition_pronoun';
  }
  if (posList.includes('conjunction') && posList.includes('pronoun')) {
    return 'conjunction_pronoun';
  }
  if (posList.includes('conjunction') && posList.includes('verb')) {
    return 'conjunction_verb';
  }
  
  // If we have a STEM, prioritize that
  const stem = validParts.find(p => p.type === 'STEM');
  if (stem) {
    return stem.pos;
  }
  
  // Otherwise, use the first part
  return validParts[0].pos;
}

/**
 * Generate SQL UPDATE statements
 */
function generateSQL(words: WordMorphology[]): string {
  let sql = `-- Fix grammar_info for Surahs 97-114 from Quranic Arabic Corpus
-- Source: https://archive.org/download/quranicarabiccorpus/quranic-corpus-morphology-0.4.txt
-- Generated: ${new Date().toISOString()}
-- 
-- This migration updates the part_of_speech field in grammar_info
-- based on authentic morphological analysis from the Quranic Arabic Corpus.
-- 
-- IMPORTANT: This only updates surahs 97-114. Surah 1 (Al-Fatiha) is NOT modified.

`;

  // Group by surah and verse for better organization
  const grouped: Record<string, WordMorphology[]> = {};
  for (const word of words) {
    const key = `${word.surah}:${word.verse}`;
    if (!grouped[key]) {
      grouped[key] = [];
    }
    grouped[key].push(word);
  }
  
  // Sort by surah, then verse, then word position
  const sortedKeys = Object.keys(grouped).sort((a, b) => {
    const [surahA, verseA] = a.split(':').map(Number);
    const [surahB, verseB] = b.split(':').map(Number);
    if (surahA !== surahB) return surahA - surahB;
    return verseA - verseB;
  });
  
  for (const key of sortedKeys) {
    const [surah, verse] = key.split(':').map(Number);
    const verseWords = grouped[key].sort((a, b) => a.wordPosition - b.wordPosition);
    
    sql += `-- Surah ${surah}, Verse ${verse}\n`;
    
    for (const word of verseWords) {
      const partOfSpeech = getCombinedPartOfSpeech(word.parts);
      
      // Escape single quotes for SQL
      const escapedPos = partOfSpeech.replace(/'/g, "''");
      
      // Use jsonb_set to update the part_of_speech field while preserving other fields
      sql += `UPDATE words
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{part_of_speech}',
  '"${escapedPos}"'::jsonb
)
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number = ${surah} 
  AND v.verse_number = ${verse} 
  AND words.word_position = ${word.wordPosition};

`;
    }
    
    sql += '\n';
  }
  
  return sql;
}

/**
 * Download file using Node's https module (handles redirects better)
 */
function downloadFile(url: string): Promise<string> {
  return new Promise((resolve, reject) => {
    const urlObj = new URL(url);
    const options = {
      hostname: urlObj.hostname,
      path: urlObj.pathname + urlObj.search,
      method: 'GET',
      headers: {
        'User-Agent': 'Mozilla/5.0 (compatible; QuranicArabicBot/1.0)'
      }
    };
    
    https.get(options, (response) => {
      // Handle redirects
      if (response.statusCode === 301 || response.statusCode === 302 || response.statusCode === 307 || response.statusCode === 308) {
        const redirectUrl = response.headers.location;
        if (redirectUrl) {
          const absoluteUrl = redirectUrl.startsWith('http') ? redirectUrl : `${urlObj.protocol}//${urlObj.hostname}${redirectUrl}`;
          return downloadFile(absoluteUrl).then(resolve).catch(reject);
        }
      }
      
      if (response.statusCode && response.statusCode !== 200) {
        reject(new Error(`Failed to download: ${response.statusCode} ${response.statusMessage || 'Unknown error'}`));
        return;
      }
      
      let data = '';
      response.on('data', (chunk) => {
        data += chunk;
      });
      response.on('end', () => {
        if (data.length === 0) {
          reject(new Error('Downloaded file is empty'));
          return;
        }
        resolve(data);
      });
    }).on('error', (error: any) => {
      reject(new Error(`Network error: ${error.message}`));
    });
  });
}

/**
 * Main function
 */
async function main() {
  console.log('📥 Downloading Quranic Arabic Corpus morphology file...');
  
  try {
    // Try multiple URLs - archive.org URLs can be inconsistent
    const urls = [
      'https://archive.org/download/quranicarabiccorpus/quranic-corpus-morphology-0.4.txt',
      'https://dn790008.ca.archive.org/0/items/quranicarabiccorpus/quranic-corpus-morphology-0.4.txt',
      'https://ia601007.us.archive.org/0/items/quranicarabiccorpus/quranic-corpus-morphology-0.4.txt'
    ];
    
    let content = '';
    let lastError: Error | null = null;
    
    for (const url of urls) {
      try {
        console.log(`   Trying: ${url}`);
        content = await downloadFile(url);
        console.log(`✅ Successfully downloaded from: ${url}`);
        break;
      } catch (error: any) {
        lastError = error;
        console.log(`   ❌ Failed: ${error.message}`);
        continue;
      }
    }
    
    if (!content) {
      throw lastError || new Error('All download attempts failed');
    }
    console.log(`✅ Downloaded ${content.length.toLocaleString()} characters`);
    
    console.log('📝 Parsing morphology data...');
    const words = parseMorphologyFile(content);
    console.log(`✅ Parsed ${words.length} words for surahs 97-114`);
    
    // Group by part of speech to show distribution
    const posCounts: Record<string, number> = {};
    for (const word of words) {
      const pos = getCombinedPartOfSpeech(word.parts);
      posCounts[pos] = (posCounts[pos] || 0) + 1;
    }
    
    console.log('\n📊 Part of Speech Distribution:');
    Object.entries(posCounts)
      .sort((a, b) => b[1] - a[1])
      .forEach(([pos, count]) => {
        console.log(`   ${pos}: ${count}`);
      });
    
    console.log('\n🔧 Generating SQL UPDATE statements...');
    const sql = generateSQL(words);
    
    // Create migrations directory if it doesn't exist
    const migrationsDir = join(process.cwd(), 'supabase', 'migrations');
    mkdirSync(migrationsDir, { recursive: true });
    
    // Generate filename with current date
    const date = new Date().toISOString().split('T')[0].replace(/-/g, '');
    const filename = `${date}000000_fix_grammar_from_corpus.sql`;
    const filepath = join(migrationsDir, filename);
    
    writeFileSync(filepath, sql, 'utf-8');
    console.log(`✅ SQL file generated: ${filepath}`);
    console.log(`   Total UPDATE statements: ${words.length}`);
    
    // Also create verification SQL
    const verifySql = `-- Verification queries for grammar fix
-- Run these after applying the migration to verify the changes

-- 1. Distribution of parts of speech (should show more Prepositions now)
SELECT 
  grammar_info->>'part_of_speech' as pos,
  COUNT(*) as count
FROM words
WHERE verse_id IN (
  SELECT id FROM verses 
  WHERE surah_id IN (
    SELECT id FROM surahs 
    WHERE surah_number BETWEEN 97 AND 114
  )
)
GROUP BY pos
ORDER BY count DESC;

-- 2. Count of Prepositions (should be 150-200+)
SELECT COUNT(*) as preposition_count
FROM words
WHERE verse_id IN (
  SELECT id FROM verses 
  WHERE surah_id IN (
    SELECT id FROM surahs 
    WHERE surah_number BETWEEN 97 AND 114
  )
)
AND grammar_info->>'part_of_speech' = 'Preposition';

-- 3. Sample words that should be Prepositions
SELECT 
  w.text_arabic,
  w.transliteration,
  w.grammar_info->>'part_of_speech' as pos
FROM words w
JOIN verses v ON w.verse_id = v.id
JOIN surahs s ON v.surah_id = s.id
WHERE s.surah_number BETWEEN 97 AND 114
  AND w.text_arabic IN ('مِن', 'بِ', 'فِي', 'لِ', 'عَلَى', 'إِلَى')
ORDER BY s.surah_number, v.verse_number, w.word_position;

-- 4. Check for any words still missing grammar_info
SELECT COUNT(*) as missing_grammar_count
FROM words
WHERE verse_id IN (
  SELECT id FROM verses 
  WHERE surah_id IN (
    SELECT id FROM surahs 
    WHERE surah_number BETWEEN 97 AND 114
  )
)
AND (grammar_info IS NULL OR grammar_info->>'part_of_speech' IS NULL);
`;
    
    const verifyDir = join(process.cwd(), 'scripts');
    mkdirSync(verifyDir, { recursive: true });
    const verifyPath = join(verifyDir, 'verify-grammar-fix.sql');
    writeFileSync(verifyPath, verifySql, 'utf-8');
    console.log(`✅ Verification SQL created: ${verifyPath}`);
    
  } catch (error: any) {
    console.error('❌ Error:', error.message);
    process.exit(1);
  }
}

// Run the script
main();

