/**
 * Diagnostic script to identify words with potential translation issues
 * where prepositions might be incorrectly included in the word's translation
 * 
 * Usage: npx tsx scripts/diagnose-translation-issues.ts [--dry-run]
 * 
 * This script:
 * 1. Finds words where translation starts with common English prepositions
 * 2. Checks if the previous word is an Arabic preposition
 * 3. Generates a CSV report with suggested fixes
 */

// @ts-nocheck
import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
import { resolve } from 'path';
import * as fs from 'fs';
import * as path from 'path';

// Load environment variables
dotenv.config({ path: resolve(process.cwd(), '.env.local') });
dotenv.config({ path: resolve(process.cwd(), '.env') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SERVICE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
    console.error('❌ Missing required environment variables:');
    console.error('   NEXT_PUBLIC_SUPABASE_URL:', supabaseUrl ? '✓' : '✗');
    console.error('   SUPABASE_SERVICE_ROLE_KEY or SUPABASE_SERVICE_KEY:', supabaseServiceKey ? '✓' : '✗');
    console.error('\nPlease set these in your .env.local file');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseServiceKey);

// Common Arabic prepositions to check against
const ARABIC_PREPOSITIONS: Record<string, string> = {
    'إِلَىٰ': 'to',
    'إِلَى': 'to',
    'مِنَ': 'from',
    'مِن': 'from',
    'فِي': 'in',
    'بِ': 'with/by',
    'بِسۡمِ': 'in the name of',
    'لِ': 'for',
    'لِأ': 'for',
    'عَلَىٰ': 'on/upon',
    'عَلَى': 'on/upon',
    'عَنْ': 'about/from',
    'عَن': 'about/from',
    'إِلَّا': 'except',
    'حَتَّىٰ': 'until',
    'حَتَّى': 'until',
    'مُذ': 'since',
    'مُنذ': 'since',
    'رُبَّ': 'perhaps',
    'كَ': 'like/as',
    'كِ': 'like/as',
    'و': 'and',
    'وَ': 'and',
};

// English prepositions that might indicate a translation issue
const PROBLEMATIC_PREPOSITIONS = [
    'to the',
    'from the',
    'in the',
    'with the',
    'by the',
    'for the',
    'on the',
    'at the',
    'to ',
    'from ',
    'in ',
    'with ',
    'by ',
    'for ',
    'on ',
    'at ',
];

interface TranslationIssue {
    word_id: number;
    surah_name: string;
    verse_number: number;
    word_position: number;
    text_arabic: string;
    current_translation: string;
    previous_word_arabic: string | null;
    previous_word_translation: string | null;
    previous_word_id: number | null;
    next_word_arabic: string | null;
    next_word_translation: string | null;
    suggested_fix: string;
    confidence: 'HIGH' | 'MEDIUM' | 'LOW';
    reason: string;
}

async function diagnoseTranslationIssues(dryRun: boolean = false) {
    console.log('🔍 Starting translation issue diagnosis...\n');
    console.log(`Mode: ${dryRun ? 'DRY RUN (no changes will be made)' : 'LIVE'}\n`);

    try {
        // Fetch all words with problematic translations
        console.log('📊 Fetching words with potential translation issues...');

        // Build OR conditions for Supabase query
        // Format: "col.ilike.%value1%,col.ilike.%value2%"
        const orConditions = PROBLEMATIC_PREPOSITIONS.map(prep =>
            `translation_english.ilike.%${prep}%`
        ).join(',');

        const { data: words, error: wordsError } = await supabase
            .from('words')
            .select(`
        id,
        text_arabic,
        translation_english,
        word_position,
        verse_id,
        verses!inner (
          id,
          verse_number,
          surah_id,
          surahs!inner (
            id,
            name_english,
            name_arabic
          )
        )
      `)
            .or(orConditions);

        if (wordsError) {
            throw wordsError;
        }

        if (!words || words.length === 0) {
            console.log('✅ No words found with potential translation issues!');
            return;
        }

        console.log(`Found ${words.length} words with potential issues\n`);

        // Sort words by surah, verse, and position for consistent processing
        words.sort((a: any, b: any) => {
            const surahA = a.verses?.surahs?.id || 0;
            const surahB = b.verses?.surahs?.id || 0;
            if (surahA !== surahB) return surahA - surahB;

            const verseA = a.verses?.verse_number || 0;
            const verseB = b.verses?.verse_number || 0;
            if (verseA !== verseB) return verseA - verseB;

            return (a.word_position || 0) - (b.word_position || 0);
        });

        const issues: TranslationIssue[] = [];
        let processed = 0;

        // Process each word
        for (const word of words) {
            processed++;
            if (processed % 50 === 0) {
                console.log(`   Processing... ${processed}/${words.length}`);
            }

            const verse = word.verses;
            const surah = verse?.surahs;

            if (!verse || !surah) continue;

            // Get all words in this verse to find previous/next word
            const { data: verseWords, error: verseWordsError } = await supabase
                .from('words')
                .select('id, text_arabic, translation_english, word_position')
                .eq('verse_id', verse.id)
                .order('word_position', { ascending: true });

            if (verseWordsError) {
                console.error(`Error fetching verse words for verse ${verse.id}:`, verseWordsError);
                continue;
            }

            const currentWordIndex = verseWords?.findIndex((w: any) => w.id === word.id) ?? -1;
            if (currentWordIndex === -1) continue;

            const previousWord = currentWordIndex > 0 ? verseWords[currentWordIndex - 1] : null;
            const nextWord = currentWordIndex < verseWords.length - 1 ? verseWords[currentWordIndex + 1] : null;

            // Determine confidence level
            let confidence: 'HIGH' | 'MEDIUM' | 'LOW' = 'LOW';
            let reason = '';

            if (previousWord) {
                const prevArabic = previousWord.text_arabic.trim();
                const isPreposition = ARABIC_PREPOSITIONS.hasOwnProperty(prevArabic);

                if (isPreposition) {
                    confidence = 'HIGH';
                    reason = `Previous word "${prevArabic}" is a known Arabic preposition (${ARABIC_PREPOSITIONS[prevArabic]})`;
                } else {
                    confidence = 'MEDIUM';
                    reason = 'Previous word exists but is not a known preposition';
                }
            } else {
                reason = 'No previous word in verse';
            }

            // Generate suggested fix (remove the preposition prefix)
            let suggestedFix = word.translation_english;
            for (const prep of PROBLEMATIC_PREPOSITIONS) {
                if (suggestedFix.toLowerCase().startsWith(prep.toLowerCase())) {
                    suggestedFix = suggestedFix.substring(prep.length).trim();
                    // Capitalize first letter if needed
                    if (suggestedFix.length > 0) {
                        suggestedFix = suggestedFix.charAt(0).toUpperCase() + suggestedFix.slice(1);
                    }
                    break;
                }
            }

            // If no change was made, try more aggressive fixes
            if (suggestedFix === word.translation_english) {
                // Try removing common patterns
                suggestedFix = word.translation_english
                    .replace(/^(to|from|in|with|by|for|on|at)\s+the\s+/i, '')
                    .replace(/^(to|from|in|with|by|for|on|at)\s+/i, '')
                    .trim();

                if (suggestedFix.length > 0) {
                    suggestedFix = suggestedFix.charAt(0).toUpperCase() + suggestedFix.slice(1);
                }
            }

            issues.push({
                word_id: word.id,
                surah_name: `${surah.name_english} (${surah.name_arabic})`,
                verse_number: verse.verse_number,
                word_position: word.word_position,
                text_arabic: word.text_arabic,
                current_translation: word.translation_english,
                previous_word_arabic: previousWord?.text_arabic || null,
                previous_word_translation: previousWord?.translation_english || null,
                previous_word_id: previousWord?.id || null,
                next_word_arabic: nextWord?.text_arabic || null,
                next_word_translation: nextWord?.translation_english || null,
                suggested_fix: suggestedFix,
                confidence,
                reason
            });
        }

        console.log(`\n✅ Analysis complete! Found ${issues.length} potential issues\n`);

        // Generate CSV report
        const timestamp = new Date().toISOString().replace(/[:.]/g, '-').slice(0, -5);
        const reportsDir = path.join(process.cwd(), 'reports');

        if (!fs.existsSync(reportsDir)) {
            fs.mkdirSync(reportsDir, { recursive: true });
            console.log(`📁 Created reports directory: ${reportsDir}`);
        }

        const csvPath = path.join(reportsDir, `translation-issues-${timestamp}.csv`);

        // CSV header
        const csvHeader = [
            'word_id',
            'surah_name',
            'verse_number',
            'word_position',
            'text_arabic',
            'current_translation',
            'previous_word_arabic',
            'previous_word_translation',
            'previous_word_id',
            'next_word_arabic',
            'next_word_translation',
            'suggested_fix',
            'confidence',
            'reason'
        ].join(',');

        // CSV rows
        const csvRows = issues.map(issue => {
            const escapeCsv = (str: string | null) => {
                if (str === null) return '';
                const s = String(str);
                if (s.includes(',') || s.includes('"') || s.includes('\n')) {
                    return `"${s.replace(/"/g, '""')}"`;
                }
                return s;
            };

            return [
                issue.word_id,
                escapeCsv(issue.surah_name),
                issue.verse_number,
                issue.word_position,
                escapeCsv(issue.text_arabic),
                escapeCsv(issue.current_translation),
                escapeCsv(issue.previous_word_arabic),
                escapeCsv(issue.previous_word_translation),
                issue.previous_word_id || '',
                escapeCsv(issue.next_word_arabic),
                escapeCsv(issue.next_word_translation),
                escapeCsv(issue.suggested_fix),
                issue.confidence,
                escapeCsv(issue.reason)
            ].join(',');
        });

        const csvContent = [csvHeader, ...csvRows].join('\n');
        fs.writeFileSync(csvPath, csvContent, 'utf-8');

        // Print summary
        const highConfidence = issues.filter(i => i.confidence === 'HIGH').length;
        const mediumConfidence = issues.filter(i => i.confidence === 'MEDIUM').length;
        const lowConfidence = issues.filter(i => i.confidence === 'LOW').length;

        console.log('📊 SUMMARY:');
        console.log(`   Total issues found: ${issues.length}`);
        console.log(`   HIGH confidence: ${highConfidence} (likely fixes)`);
        console.log(`   MEDIUM confidence: ${mediumConfidence}`);
        console.log(`   LOW confidence: ${lowConfidence}`);
        console.log(`\n📄 Report saved to: ${csvPath}\n`);

        // Show sample of HIGH confidence issues
        const highConfidenceIssues = issues.filter(i => i.confidence === 'HIGH').slice(0, 5);
        if (highConfidenceIssues.length > 0) {
            console.log('🔍 Sample HIGH confidence issues:');
            highConfidenceIssues.forEach((issue, idx) => {
                console.log(`\n   ${idx + 1}. Word ID ${issue.word_id} (${issue.surah_name}, Verse ${issue.verse_number})`);
                console.log(`      Arabic: ${issue.text_arabic}`);
                console.log(`      Current: "${issue.current_translation}"`);
                console.log(`      Previous word: ${issue.previous_word_arabic} (${issue.previous_word_translation})`);
                console.log(`      Suggested: "${issue.suggested_fix}"`);
                console.log(`      Reason: ${issue.reason}`);
            });
            console.log('');
        }

        console.log('✅ Diagnosis complete! Review the CSV report before running the fix script.\n');

    } catch (error: any) {
        console.error('❌ Error during diagnosis:', error.message);
        console.error(error);
        process.exit(1);
    }
}

// Parse command line arguments
const args = process.argv.slice(2);
const dryRun = args.includes('--dry-run');

diagnoseTranslationIssues(dryRun);

