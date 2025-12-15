/**
 * Direct fix for word 3731 and similar passive verb translations
 */

import { config } from 'dotenv';
import { resolve } from 'path';
config({ path: resolve(process.cwd(), '.env.local') });
import { createClient } from '@supabase/supabase-js';

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SERVICE_KEY;

if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
    console.error('❌ Missing environment variables');
    process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY, {
    auth: { autoRefreshToken: false, persistSession: false },
});

const dryRun = process.argv.includes('--dry-run');

async function fixWord3731() {
    console.log('🔍 Checking word 3731...\n');

    // Get word 3731
    const { data: word, error } = await supabase
        .from('words')
        .select('id, text_arabic, transliteration, translation_english')
        .eq('id', 3731)
        .single();

    if (error) {
        console.error('❌ Error:', error);
        return;
    }

    if (!word) {
        console.error('❌ Word 3731 not found');
        return;
    }

    console.log('Current translation:', word.translation_english);

    // Fix the translation
    const pattern = /^(\w+ed)\s+(was|were|is|are|been)([.,!?;:]*)\s*$/i;
    const match = word.translation_english?.trim().match(pattern);

    if (match) {
        const [, verb, auxiliary, punctuation] = match;
        const auxFixed = auxiliary.charAt(0).toUpperCase() + auxiliary.slice(1).toLowerCase();
        const verbFixed = verb.toLowerCase();
        const fixed = `${auxFixed} ${verbFixed}${punctuation || ''}`;

        console.log('Fixed translation:', fixed);

        if (dryRun) {
            console.log('\n🔍 DRY RUN - Would update word 3731');
        } else {
            const { error: updateError } = await supabase
                .from('words')
                .update({ translation_english: fixed })
                .eq('id', 3731);

            if (updateError) {
                console.error('❌ Error updating:', updateError);
            } else {
                console.log('✅ Successfully updated word 3731');
            }
        }
    } else {
        console.log('⚠️  Translation does not match pattern');
        console.log('Pattern test:', pattern.test(word.translation_english || ''));
    }

    // Also search for similar patterns
    console.log('\n🔍 Searching for similar patterns...\n');

    const { data: allWords, error: searchError } = await supabase
        .from('words')
        .select('id, text_arabic, translation_english')
        .not('translation_english', 'is', null)
        .ilike('translation_english', '%ed%were%')
        .limit(100);

    if (searchError) {
        console.error('❌ Search error:', searchError);
        return;
    }

    console.log(`Found ${allWords?.length || 0} words with "ed...were" pattern`);

    const wordsToFix: any[] = [];
    for (const w of allWords || []) {
        const match = w.translation_english?.trim().match(pattern);
        if (match) {
            const [, verb, auxiliary, punctuation] = match;
            const auxFixed = auxiliary.charAt(0).toUpperCase() + auxiliary.slice(1).toLowerCase();
            const verbFixed = verb.toLowerCase();
            const fixed = `${auxFixed} ${verbFixed}${punctuation || ''}`;
            wordsToFix.push({ id: w.id, arabic: w.text_arabic, old: w.translation_english, new: fixed });
        }
    }

    if (wordsToFix.length > 0) {
        console.log(`\n📋 Found ${wordsToFix.length} words to fix:\n`);
        wordsToFix.forEach(w => {
            console.log(`[${w.id}] ${w.arabic}: "${w.old}" → "${w.new}"`);
        });

        if (!dryRun) {
            console.log('\n🔄 Updating...\n');
            for (const w of wordsToFix) {
                const { error } = await supabase
                    .from('words')
                    .update({ translation_english: w.new })
                    .eq('id', w.id);

                if (error) {
                    console.error(`❌ Error updating ${w.id}:`, error.message);
                } else {
                    console.log(`✅ Fixed word ${w.id}`);
                }
            }
        }
    }
}

fixWord3731()
    .then(() => {
        console.log('\n✅ Done');
        process.exit(0);
    })
    .catch((error) => {
        console.error('💥 Error:', error);
        process.exit(1);
    });

