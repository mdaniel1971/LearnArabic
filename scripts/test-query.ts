import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
import { resolve } from 'path';

dotenv.config({ path: resolve(process.cwd(), '.env.local') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

console.log('Starting query...');
console.log('URL exists:', !!supabaseUrl);
console.log('Key exists:', !!supabaseServiceKey);

if (!supabaseUrl || !supabaseServiceKey) {
    console.error('Missing env vars');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseServiceKey);

async function runQuery() {
    try {
        console.log('Querying for اهْدِنَا...');
        const { data, error } = await supabase
            .from('words')
            .select('id, text_arabic, translation_english, grammar_info')
            .ilike('text_arabic', '%هدنا%')
            .limit(10);

        if (error) {
            console.error('Error:', error);
            process.exit(1);
        }

        console.log(`Found ${data?.length || 0} results\n`);

        if (!data || data.length === 0) {
            console.log('No words found matching اهْدِنَا or هدنا');
            return;
        }

        data.forEach((word: any) => {
            console.log('ID:', word.id);
            console.log('Arabic:', word.text_arabic);
            console.log('Translation:', word.translation_english);
            console.log('Grammar Info:', JSON.stringify(word.grammar_info, null, 2));
            console.log('---');
        });
    } catch (err: any) {
        console.error('Exception:', err);
        process.exit(1);
    }
}

runQuery()
    .then(() => {
        console.log('\n✅ Query completed');
    })
    .catch((err) => {
        console.error('❌ Error:', err);
        process.exit(1);
    });

