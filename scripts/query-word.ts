/**
 * Query database for a specific word
 * Usage: npx tsx scripts/query-word.ts
 */

import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
import { resolve } from 'path';

// Load environment variables
dotenv.config({ path: resolve(process.cwd(), '.env.local') });
dotenv.config({ path: resolve(process.cwd(), '.env') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SERVICE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
    console.error('❌ Missing required environment variables');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseServiceKey);

async function queryWord() {
    try {
        const searchText = 'اهْدِنَا';

        console.log(`🔍 Searching for word: ${searchText}\n`);
        console.log('Connecting to Supabase...');
        console.log('URL:', supabaseUrl ? 'Set' : 'Missing');
        console.log('Service Key:', supabaseServiceKey ? 'Set' : 'Missing');
        console.log('');

        // Query 1: Exact match
        console.log('Running exact match query...');
        const { data: exactMatch, error: exactError } = await supabase
            .from('words')
            .select('id, text_arabic, translation_english, grammar_info')
            .eq('text_arabic', searchText);

        console.log(`Exact match results: ${exactMatch?.length || 0} found`);
        if (exactError) {
            console.error('❌ Error with exact match query:', exactError);
        }

        // Query 2: LIKE match (without diacritics)
        console.log('Running LIKE query...');
        const { data: likeMatch, error: likeError } = await supabase
            .from('words')
            .select('id, text_arabic, translation_english, grammar_info')
            .ilike('text_arabic', '%هدنا%');

        console.log(`LIKE match results: ${likeMatch?.length || 0} found`);
        if (likeError) {
            console.error('❌ Error with LIKE query:', likeError);
        }

        // Combine results
        const allResults = [
            ...(exactMatch || []),
            ...(likeMatch || [])
        ];

        // Remove duplicates based on id
        const uniqueResults = Array.from(
            new Map(allResults.map(item => [item.id, item])).values()
        );

        if (uniqueResults.length === 0) {
            console.log('❌ No words found matching the search criteria');
            return;
        }

        console.log(`✅ Found ${uniqueResults.length} word(s):\n`);

        uniqueResults.forEach((word: any, index: number) => {
            console.log(`${'='.repeat(70)}`);
            console.log(`Word ${index + 1}:`);
            console.log(`${'='.repeat(70)}`);
            console.log(`ID: ${word.id}`);
            console.log(`Arabic: ${word.text_arabic}`);
            console.log(`Translation: ${word.translation_english || 'N/A'}`);
            console.log(`\nGrammar Info (JSON):`);
            console.log(JSON.stringify(word.grammar_info, null, 2));
            console.log(`\nGrammar Info (Formatted):`);

            if (word.grammar_info) {
                const g = word.grammar_info;
                console.log(`  Part of Speech: ${g.part_of_speech || 'N/A'}`);
                console.log(`  Case: ${g.case || 'N/A'}`);
                console.log(`  Gender: ${g.gender || 'N/A'}`);
                console.log(`  Number: ${g.number || 'N/A'}`);
                console.log(`  Person: ${g.person || 'N/A'}`);
                console.log(`  Tense: ${g.tense || g.aspect || 'N/A'}`);
                console.log(`  Mood: ${g.mood || 'N/A'}`);
                console.log(`  Voice: ${g.voice || 'N/A'}`);
                console.log(`  Form: ${g.form || 'N/A'}`);
                console.log(`  Definiteness: ${g.definiteness || 'N/A'}`);
                if (g.features && Array.isArray(g.features)) {
                    console.log(`  Features: ${g.features.join(', ')}`);
                }
                if (g.notes) {
                    console.log(`  Notes: ${g.notes}`);
                }
            } else {
                console.log('  (No grammar info available)');
            }
            console.log('');
        });
    } catch (error: any) {
        console.error('Error in queryWord:', error);
        throw error;
    }
}

queryWord()
    .then(() => {
        console.log('\n✅ Query completed');
        process.exit(0);
    })
    .catch((error) => {
        console.error('\n❌ Error:', error);
        process.exit(1);
    });

