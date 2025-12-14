/**
 * Fetch Voice Information from Quranic Arabic Corpus Website
 * 
 * This script scrapes voice (active/passive) information from corpus.quran.com
 * for verbs in surahs 97-114 and updates the grammar_info column.
 * 
 * The corpus website shows voice in the morphology description, e.g.:
 * - "3rd person feminine singular passive perfect verb"
 * - "3rd person masculine singular perfect verb" (active, implied)
 */

import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
import { resolve } from 'path';
import https from 'https';

// Load environment variables
dotenv.config({ path: resolve(process.cwd(), '.env.local') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseKey) {
  throw new Error('Missing Supabase environment variables');
}

const supabase = createClient(supabaseUrl, supabaseKey);

/**
 * Fetch HTML from corpus website for a specific verse
 */
function fetchVerseHTML(surah: number, verse: number): Promise<string> {
  return new Promise((resolve, reject) => {
    const url = `https://corpus.quran.com/wordbyword.jsp?chapter=${surah}&verse=${verse}`;
    
    https.get(url, (res) => {
      let data = '';
      res.on('data', (chunk) => { data += chunk; });
      res.on('end', () => resolve(data));
    }).on('error', reject);
  });
}

/**
 * Parse voice from HTML description
 * Looks for patterns like "passive perfect verb" or "passive imperfect verb"
 */
function extractVoice(html: string, surah: number, verse: number, wordPosition: number): 'active' | 'passive' | null {
  // The HTML structure is:
  // <span class="location">(surah:verse:word)</span>
  // ... 
  // <td class="col3">description</td>
  
  // Try to find the row for this specific word
  const locationPattern = `\\(${surah}:${verse}:${wordPosition}\\)`;
  const locationIndex = html.indexOf(locationPattern);
  
  if (locationIndex === -1) return null;
  
  // Find the next <td class="col3"> after this location
  const searchStart = locationIndex;
  const searchEnd = Math.min(searchStart + 2000, html.length);
  const searchText = html.substring(searchStart, searchEnd);
  
  // Look for the col3 td that contains the verb description
  const col3Pattern = /<td[^>]*class="col3"[^>]*>([^<]+(?:<[^>]+>[^<]*)*[^<]+)<\/td>/i;
  const match = searchText.match(col3Pattern);
  
  if (!match) return null;
  
  // Clean up the description (remove HTML tags)
  let description = match[1]
    .replace(/<[^>]+>/g, ' ')
    .replace(/\s+/g, ' ')
    .toLowerCase();
  
  // Check for passive
  if (description.includes('passive')) {
    return 'passive';
  }
  
  // If it's a verb and doesn't say passive, it's active
  // But only if we can confirm it's actually a verb description
  if (description.includes('verb') && (description.includes('perfect') || description.includes('imperfect') || description.includes('imperative'))) {
    return 'active';
  }
  
  return null;
}

/**
 * Get all verbs from surahs 97-114 that need voice information
 */
async function getVerbsNeedingVoice() {
  // First get all verses in surahs 97-114
  const { data: verses, error: versesError } = await supabase
    .from('verses')
    .select(`
      id,
      verse_number,
      surahs!inner (
        surah_number
      )
    `)
    .gte('surahs.surah_number', 97)
    .lte('surahs.surah_number', 114);
  
  if (versesError) throw versesError;
  if (!verses) return [];
  
  const verseIds = verses.map(v => v.id);
  
  // Then get all verbs from those verses
  const { data: words, error: wordsError } = await supabase
    .from('words')
    .select(`
      id,
      verse_id,
      word_position,
      text_arabic,
      grammar_info
    `)
    .in('verse_id', verseIds)
    .eq('grammar_info->>part_of_speech', 'Verb');
  
  if (wordsError) throw wordsError;
  if (!words) return [];
  
  // Filter out verbs that already have voice
  const verbsNeedingVoice = words.filter(w => {
    const grammarInfo = w.grammar_info as any;
    return !grammarInfo || !grammarInfo.voice;
  });
  
  // Join with verse info
  const result = verbsNeedingVoice.map(word => {
    const verse = verses.find(v => v.id === word.verse_id);
    return {
      ...word,
      verse: verse ? {
        verse_number: verse.verse_number,
        surah_number: (verse.surahs as any).surah_number
      } : null
    };
  });
  
  return result;
}

/**
 * Main function to fetch and update voice information
 */
async function main() {
  console.log('🚀 Fetching voice information from Quranic Arabic Corpus...\n');
  
  // Get all verbs that need voice
  const verbs = await getVerbsNeedingVoice();
  console.log(`📊 Found ${verbs.length} verbs needing voice information\n`);
  
  if (verbs.length === 0) {
    console.log('✅ All verbs already have voice information!');
    return;
  }
  
  // Group by surah:verse to minimize API calls
  const verseMap = new Map<string, typeof verbs>();
  for (const verb of verbs) {
    if (!verb.verse) continue;
    const surah = verb.verse.surah_number;
    const verse = verb.verse.verse_number;
    const key = `${surah}:${verse}`;
    
    if (!verseMap.has(key)) {
      verseMap.set(key, []);
    }
    verseMap.get(key)!.push(verb);
  }
  
  console.log(`📖 Processing ${verseMap.size} unique verses...\n`);
  
  let updated = 0;
  let failed = 0;
  
  // Process each verse
  for (const [key, verseVerbs] of verseMap.entries()) {
    const [surah, verse] = key.split(':').map(Number);
    
    try {
      console.log(`  Fetching ${surah}:${verse}...`);
      const html = await fetchVerseHTML(surah, verse);
      
      // Extract voice for each verb in this verse
      for (const verb of verseVerbs) {
        const voice = extractVoice(html, surah, verse, verb.word_position);
        
        if (voice) {
          // Update grammar_info with voice
          const grammarInfo = (verb.grammar_info as any) || {};
          grammarInfo.voice = voice;
          
          const { error } = await supabase
            .from('words')
            .update({ grammar_info: grammarInfo })
            .eq('id', verb.id);
          
          if (error) {
            console.error(`    ❌ Error updating word ${verb.id}:`, error.message);
            failed++;
          } else {
            updated++;
            console.log(`    ✅ Word ${verb.word_position}: ${voice}`);
          }
        } else {
          console.log(`    ⚠️  Word ${verb.word_position}: voice not found`);
          failed++;
        }
      }
      
      // Be nice to the server
      await new Promise(resolve => setTimeout(resolve, 500));
      
    } catch (error: any) {
      console.error(`  ❌ Error fetching ${surah}:${verse}:`, error.message);
      failed++;
    }
  }
  
  console.log(`\n✅ Complete! Updated: ${updated}, Failed: ${failed}`);
}

main().catch(console.error);

