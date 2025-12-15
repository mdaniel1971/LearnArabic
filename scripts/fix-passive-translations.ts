/**
 * Fix Passive Verb Translations in Database
 * 
 * This script fixes passive verb translations where word order is incorrect.
 * Pattern: [VERB] [AUXILIARY] → should be → [AUXILIARY] [VERB]
 * Examples:
 * - "destroyed were" → "were destroyed"
 * - "created was" → "was created"
 * - "revealed were" → "were revealed"
 * 
 * Usage:
 *   npx tsx scripts/fix-passive-translations.ts --dry-run        (preview changes)
 *   npx tsx scripts/fix-passive-translations.ts --debug           (show potential matches)
 *   npx tsx scripts/fix-passive-translations.ts                  (apply fixes)
 */

// Load environment variables
import { config } from 'dotenv';
import { resolve } from 'path';

config({ path: resolve(process.cwd(), '.env.local') });
config({ path: resolve(process.cwd(), '.env') });

import { createClient } from '@supabase/supabase-js';

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SERVICE_KEY;

if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
    console.error('❌ Missing required environment variables:');
    console.error('   NEXT_PUBLIC_SUPABASE_URL:', SUPABASE_URL ? '✓' : '✗');
    console.error('   SUPABASE_SERVICE_ROLE_KEY or SUPABASE_SERVICE_KEY:', SUPABASE_SERVICE_KEY ? '✓' : '✗');
    process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY, {
    auth: {
        autoRefreshToken: false,
        persistSession: false,
    },
});

// Parse command line arguments
const dryRun = process.argv.includes('--dry-run');
const debug = process.argv.includes('--debug');

interface WordToFix {
    id: number;
    text_arabic: string;
    translation_english: string;
    fixed_translation: string;
}

/**
 * Pattern to match: past participle + auxiliary verb
 * Matches: "destroyed were", "created was", "revealed were", etc.
 * Also handles: "destroyed is", "created are", "revealed been"
 * Handles trailing punctuation: "destroyed were." → "were destroyed."
 * Also matches with additional words after: "destroyed were the cities" → "were destroyed the cities"
 */
const PASSIVE_PATTERN_STRICT = /^(\w+ed)\s+(was|were|is|are|been)([.,!?;:]*)\s*$/i;
const PASSIVE_PATTERN_FLEXIBLE = /^(\w+ed)\s+(was|were|is|are|been)\s+(.+)$/i;

/**
 * Fix a translation by swapping word order
 */
function fixTranslation(translation: string): string | null {
    const trimmed = translation.trim();

    // Try strict pattern first (exact match: "destroyed were")
    let match = trimmed.match(PASSIVE_PATTERN_STRICT);
    if (match) {
        const [, verb, auxiliary, punctuation] = match;
        // Capitalize first letter of auxiliary, lowercase the verb
        const auxiliaryFixed = auxiliary.charAt(0).toUpperCase() + auxiliary.slice(1).toLowerCase();
        const verbFixed = verb.toLowerCase();
        return `${auxiliaryFixed} ${verbFixed}${punctuation || ''}`;
    }

    // Try flexible pattern (with additional words: "destroyed were the cities")
    match = trimmed.match(PASSIVE_PATTERN_FLEXIBLE);
    if (match) {
        const [, verb, auxiliary, rest] = match;
        // Capitalize first letter of auxiliary, lowercase the verb
        const auxiliaryFixed = auxiliary.charAt(0).toUpperCase() + auxiliary.slice(1).toLowerCase();
        const verbFixed = verb.toLowerCase();
        return `${auxiliaryFixed} ${verbFixed} ${rest}`;
    }

    return null;
}

/**
 * Find all words with incorrect passive translations
 */
async function findWordsToFix(): Promise<WordToFix[]> {
    console.log('🔍 Searching for words with incorrect passive verb translations...\n');

    if (debug) {
        console.log('🐛 DEBUG MODE: Will show potential matches and pattern testing\n');
    }

    // Fetch all words with translations (no limit to get all words)
    const { data: words, error } = await supabase
        .from('words')
        .select('id, text_arabic, translation_english')
        .not('translation_english', 'is', null)
        .limit(10000); // Increase limit to ensure we get all words

    if (error) {
        console.error('❌ Error fetching words:', error);
        throw error;
    }

    if (!words || words.length === 0) {
        console.log('No words found in database.');
        return [];
    }

    console.log(`📊 Checking ${words.length} words...\n`);

    const wordsToFix: WordToFix[] = [];
    let checkedCount = 0;
    const totalWords = words.length;

    // In debug mode, also look for potential matches with variations
    const potentialMatches: Array<{ id: number; arabic: string; translation: string }> = [];

    for (const word of words) {
        checkedCount++;
        const translation = word.translation_english;
        if (!translation) continue;

        const fixed = fixTranslation(translation);
        if (fixed) {
            wordsToFix.push({
                id: word.id,
                text_arabic: word.text_arabic,
                translation_english: translation,
                fixed_translation: fixed,
            });
        }

        // In debug mode, look for translations containing past participles + auxiliaries
        if (debug && translation) {
            const lowerTrans = translation.toLowerCase();
            // Look for patterns that might be passive but don't match exactly
            if (/\w+ed\s+(was|were|is|are|been)/i.test(translation)) {
                potentialMatches.push({
                    id: word.id,
                    arabic: word.text_arabic,
                    translation: translation,
                });
            }
        }

        // Show progress every 100 words
        if (checkedCount % 100 === 0) {
            process.stdout.write(`\r   Processed ${checkedCount}/${totalWords} words... (found ${wordsToFix.length} matches)`);
        }
    }

    // Show potential matches in debug mode
    if (debug && potentialMatches.length > 0) {
        console.log(`\n🐛 DEBUG: Found ${potentialMatches.length} potential matches (not matching exact pattern):\n`);
        potentialMatches.slice(0, 20).forEach((match, idx) => {
            console.log(`${idx + 1}. [${match.id}] ${match.arabic}: "${match.translation}"`);
        });
        if (potentialMatches.length > 20) {
            console.log(`   ... and ${potentialMatches.length - 20} more`);
        }
    }

    // Clear progress line and show final count
    process.stdout.write(`\r   Processed ${checkedCount}/${totalWords} words.                    \n`);

    return wordsToFix;
}

/**
 * Update word translations in database
 */
async function updateTranslations(wordsToFix: WordToFix[]): Promise<void> {
    if (wordsToFix.length === 0) {
        console.log('✅ No translations to fix.');
        return;
    }

    console.log(`\n🔄 Updating ${wordsToFix.length} translations...\n`);

    let successCount = 0;
    let errorCount = 0;

    for (const word of wordsToFix) {
        try {
            const { error } = await supabase
                .from('words')
                .update({ translation_english: word.fixed_translation })
                .eq('id', word.id);

            if (error) {
                console.error(`❌ Error updating word ${word.id}:`, error.message);
                errorCount++;
            } else {
                console.log(`✅ Fixed: [${word.id}] ${word.text_arabic} - "${word.translation_english}" → "${word.fixed_translation}"`);
                successCount++;
            }
        } catch (err: any) {
            console.error(`❌ Error updating word ${word.id}:`, err.message);
            errorCount++;
        }
    }

    console.log(`\n📊 Summary:`);
    console.log(`   ✅ Successfully updated: ${successCount}`);
    console.log(`   ❌ Errors: ${errorCount}`);
}

/**
 * Main function
 */
async function main() {
    console.log('🚀 Fix Passive Verb Translations\n');

    if (dryRun) {
        console.log('🔍 DRY RUN MODE - No changes will be made\n');
    }

    try {
        // Find words to fix
        const wordsToFix = await findWordsToFix();

        if (wordsToFix.length === 0) {
            console.log('✅ No words found with incorrect passive verb translations.');
            return;
        }

        console.log(`\n📋 Found ${wordsToFix.length} words to fix:\n`);

        // Display preview
        wordsToFix.forEach((word, index) => {
            console.log(`${index + 1}. [${word.id}] ${word.text_arabic}`);
            console.log(`   "${word.translation_english}" → "${word.fixed_translation}"`);
        });

        if (dryRun) {
            console.log(`\n💡 This is a dry run. To apply fixes, run without --dry-run flag.`);
            return;
        }

        // Confirm before applying
        console.log(`\n⚠️  About to update ${wordsToFix.length} translations in the database.`);
        console.log('   Press Ctrl+C to cancel, or wait 3 seconds to continue...\n');

        await new Promise(resolve => setTimeout(resolve, 3000));

        // Apply fixes
        await updateTranslations(wordsToFix);

        console.log('\n✅ Done!');

    } catch (error: any) {
        console.error('💥 Fatal error:', error);
        process.exit(1);
    }
}

// Run the script
main().catch((error) => {
    console.error('💥 Unhandled error:', error);
    process.exit(1);
});

