import { config } from 'dotenv';
import { resolve } from 'path';
import { createClient } from '@supabase/supabase-js';
import * as fs from 'fs';

config({ path: resolve(process.cwd(), '.env.local') });
config({ path: resolve(process.cwd(), '.env') });

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_KEY || process.env.SUPABASE_SERVICE_ROLE_KEY;

const output: string[] = [];

function log(msg: string) {
  const line = `${new Date().toISOString()}: ${msg}`;
  console.log(msg);
  output.push(line);
}

log('Starting diagnostic...');

if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
  log('❌ Missing credentials');
  process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY, {
  auth: { autoRefreshToken: false, persistSession: false },
});

(async () => {
  try {
    log('Querying database...');
    
    // Get surah 78:3 words
    const { data: surah78 } = await supabase.from('surahs').select('id').eq('surah_number', 78).single();
    if (!surah78) {
      log('❌ Surah 78 not found');
      return;
    }
    
    const { data: verse } = await supabase
      .from('verses')
      .select('id')
      .eq('surah_id', surah78.id)
      .eq('verse_number', 3)
      .single();
    
    if (!verse) {
      log('❌ Verse 78:3 not found');
      return;
    }
    
    const { data: words, error } = await supabase
      .from('words')
      .select('*')
      .eq('verse_id', verse.id)
      .order('word_position');
    
    if (error) {
      log(`❌ Error: ${error.message}`);
      return;
    }
    
    log(`Found ${words?.length || 0} words in 78:3`);
    
    words?.forEach((word: any) => {
      log(`Word ${word.word_position}: ${word.text_arabic}`);
      log(`  POS: ${word.grammar_info?.part_of_speech || 'NULL'}`);
      log(`  Grammar: ${JSON.stringify(word.grammar_info)}`);
    });
    
    // Write to file
    fs.writeFileSync('diagnostic-output.txt', output.join('\n'));
    log('✅ Output written to diagnostic-output.txt');
    
  } catch (err: any) {
    log(`💥 Error: ${err.message}`);
    fs.writeFileSync('diagnostic-output.txt', output.join('\n'));
  }
})();

