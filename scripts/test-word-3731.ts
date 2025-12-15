import { config } from 'dotenv';
import { resolve } from 'path';
config({ path: resolve(process.cwd(), '.env.local') });
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!
);

async function test() {
    const { data, error } = await supabase
        .from('words')
        .select('id, text_arabic, transliteration, translation_english')
        .eq('id', 3731)
        .single();

    if (error) {
        console.error('Error:', error);
        process.exit(1);
    }

    if (!data) {
        console.error('No data found for word 3731');
        process.exit(1);
    }

    console.log('Word 3731:', JSON.stringify(data, null, 2));

    // Test the pattern
    const translation = data.translation_english;
    if (translation) {
        const pattern = /^(\w+ed)\s+(was|were|is|are|been)([.,!?;:]*)\s*$/i;
        const match = translation.trim().match(pattern);
        console.log('\nPattern test:');
        console.log('Translation:', translation);
        console.log('Matches pattern:', !!match);
        if (match) {
            const [, verb, auxiliary, punctuation] = match;
            const auxFixed = auxiliary.charAt(0).toUpperCase() + auxiliary.slice(1).toLowerCase();
            const verbFixed = verb.toLowerCase();
            console.log('Fixed:', `${auxFixed} ${verbFixed}${punctuation || ''}`);
        }
    } else {
        console.log('No translation found');
    }
}

test().catch(console.error);

