import { config } from 'dotenv';
import { resolve } from 'path';
import { createClient } from '@supabase/supabase-js';

config({ path: resolve(process.cwd(), '.env.local') });
config({ path: resolve(process.cwd(), '.env') });

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_KEY || process.env.SUPABASE_SERVICE_ROLE_KEY;

console.log('Testing database connection...');
console.log('URL:', SUPABASE_URL ? 'SET' : 'NOT SET');
console.log('KEY:', SUPABASE_SERVICE_KEY ? 'SET' : 'NOT SET');

if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
  console.error('❌ Missing credentials');
  process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY, {
  auth: { autoRefreshToken: false, persistSession: false },
});

(async () => {
  try {
    const { data, error } = await supabase.from('surahs').select('surah_number').limit(5);
    if (error) {
      console.error('Error:', error);
      process.exit(1);
    } else {
      console.log('Success! Found surahs:', data);
      process.exit(0);
    }
  } catch (err: any) {
    console.error('Fatal error:', err);
    process.exit(1);
  }
})();

