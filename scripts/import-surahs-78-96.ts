/**
 * Complete Import Script for Surahs 78-96
 * 
 * This script:
 * 1. Verifies corpus coverage for surahs 78-96
 * 2. Extracts data from:
 *    - @kmaslesa/holy-quran-word-by-word-full-data for translations/transliterations
 *    - quran-json CDN for Arabic verse text
 *    - quran-morphology.txt for authentic grammar data
 * 3. Imports to Supabase with idempotent upserts
 * 
 * Usage: npx tsx scripts/import-surahs-78-96.ts [--verify-only] [--skip-verify]
 */

import { config } from 'dotenv';
import { resolve } from 'path';
import * as fs from 'fs';
import { createClient } from '@supabase/supabase-js';
import quranWords from '@kmaslesa/holy-quran-word-by-word-full-data';
import { GrammarInfo } from '../types/quran';

// Load environment variables
config({ path: resolve(process.cwd(), '.env.local') });
config({ path: resolve(process.cwd(), '.env') });

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_KEY || process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
    console.error('❌ Missing SUPABASE_URL or SUPABASE_SERVICE_KEY in environment');
    process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY, {
    auth: {
        autoRefreshToken: false,
        persistSession: false,
    },
});

// Parse command line arguments
const verifyOnly = process.argv.includes('--verify-only');
const skipVerify = process.argv.includes('--skip-verify');

// Surah metadata for 78-96
const SURAH_METADATA: Record<number, { name_arabic: string; name_english: string; total_verses: number }> = {
    78: { name_arabic: 'النَّبَأ', name_english: 'The Tidings', total_verses: 40 },
    79: { name_arabic: 'النَّازِعَات', name_english: 'Those who drag forth', total_verses: 46 },
    80: { name_arabic: 'عَبَسَ', name_english: 'He Frowned', total_verses: 42 },
    81: { name_arabic: 'التَّكْوِير', name_english: 'The Overthrowing', total_verses: 29 },
    82: { name_arabic: 'الانفطار', name_english: 'The Cleaving', total_verses: 19 },
    83: { name_arabic: 'المطففين', name_english: 'The Defrauding', total_verses: 36 },
    84: { name_arabic: 'الانشقاق', name_english: 'The Splitting Open', total_verses: 25 },
    85: { name_arabic: 'البروج', name_english: 'The Constellations', total_verses: 22 },
    86: { name_arabic: 'الطارق', name_english: 'The Nightcomer', total_verses: 17 },
    87: { name_arabic: 'الأعلى', name_english: 'The Most High', total_verses: 19 },
    88: { name_arabic: 'الغاشية', name_english: 'The Overwhelming', total_verses: 26 },
    89: { name_arabic: 'الفجر', name_english: 'The Dawn', total_verses: 30 },
    90: { name_arabic: 'البلد', name_english: 'The City', total_verses: 20 },
    91: { name_arabic: 'الشمس', name_english: 'The Sun', total_verses: 15 },
    92: { name_arabic: 'الليل', name_english: 'The Night', total_verses: 21 },
    93: { name_arabic: 'الضحى', name_english: 'The Morning Hours', total_verses: 11 },
    94: { name_arabic: 'الشرح', name_english: 'The Relief', total_verses: 8 },
    95: { name_arabic: 'التين', name_english: 'The Fig', total_verses: 8 },
    96: { name_arabic: 'العلق', name_english: 'The Clot', total_verses: 19 },
};

const START_SURAH = 78;
const END_SURAH = 96;
const TOTAL_SURAHS = END_SURAH - START_SURAH + 1;

// ============================================================================
// Type Definitions
// ============================================================================

interface QuranWord {
    text: string;
    translation: { text: string };
    transliteration: { text: string };
}

interface QuranAyah {
    ayah: number;
    words: QuranWord[];
}

interface QuranSurah {
    surah: number;
    ayahs: QuranAyah[];
}

interface WordMorphology {
    surah: number;
    verse: number;
    word: number;
    segments: Array<{ arabic: string; pos: string; features: string }>;
}

// ============================================================================
// STEP 1: VERIFICATION
// ============================================================================

function verifyCorpusCoverage(): boolean {
    console.log('\n' + '='.repeat(70));
    console.log('STEP 1: VERIFICATION - Checking Corpus Coverage');
    console.log('='.repeat(70) + '\n');

    const morphologyFile = resolve(process.cwd(), 'docs/corpus-files/quran-morphology.txt');

    if (!fs.existsSync(morphologyFile)) {
        console.error(`❌ Morphology file not found: ${morphologyFile}`);
        return false;
    }

    console.log(`📖 Reading morphology file: ${morphologyFile}\n`);

    const content = fs.readFileSync(morphologyFile, 'utf-8');
    const lines = content.split('\n');

    const verseCounts = new Map<number, Set<number>>();
    const wordCounts = new Map<number, number>();

    for (const line of lines) {
        if (!line.trim()) continue;
        const parts = line.split('\t');
        if (parts.length < 4) continue;

        const [location] = parts;
        const [surah, verse] = location.split(':').map(Number);

        if (isNaN(surah) || isNaN(verse) || surah < START_SURAH || surah > END_SURAH) continue;

        if (!verseCounts.has(surah)) {
            verseCounts.set(surah, new Set());
            wordCounts.set(surah, 0);
        }
        verseCounts.get(surah)!.add(verse);
        wordCounts.set(surah, (wordCounts.get(surah) || 0) + 1);
    }

    let allPassed = true;
    const results: Array<{ surah: number; passed: boolean; verses: number; expected: number; words: number }> = [];

    for (const [num, metadata] of Object.entries(SURAH_METADATA)) {
        const surahNum = parseInt(num);
        const found = verseCounts.get(surahNum);
        const foundVerses = found ? found.size : 0;
        const words = wordCounts.get(surahNum) || 0;
        const passed = foundVerses === metadata.total_verses;

        if (!passed) allPassed = false;
        results.push({ surah: surahNum, passed, verses: foundVerses, expected: metadata.total_verses, words });

        const status = passed ? '✅' : '❌';
        console.log(`${status} Surah ${surahNum} (${metadata.name_english})`);
        console.log(`   Verses: ${foundVerses}/${metadata.total_verses}`);
        console.log(`   Words: ${words}`);

        if (!passed && found) {
            const missing: number[] = [];
            for (let v = 1; v <= metadata.total_verses; v++) {
                if (!found.has(v)) missing.push(v);
            }
            if (missing.length > 0 && missing.length <= 10) {
                console.log(`   ⚠️  Missing verses: ${missing.join(', ')}`);
            } else if (missing.length > 10) {
                console.log(`   ⚠️  Missing ${missing.length} verses`);
            }
        }
        console.log();
    }

    console.log('='.repeat(70));
    const passed = results.filter(r => r.passed).length;
    console.log(`✅ Passed: ${passed}/${results.length}`);
    console.log(`❌ Failed: ${results.length - passed}/${results.length}`);
    console.log(`📝 Total words: ${results.reduce((sum, r) => sum + r.words, 0)}`);
    console.log('='.repeat(70) + '\n');

    if (allPassed) {
        console.log('✅ All surahs have complete coverage in the corpus!\n');
        return true;
    } else {
        console.log('❌ Some surahs have incomplete coverage.\n');
        return false;
    }
}

// ============================================================================
// STEP 2: EXTRACTION - Parse Morphology File
// ============================================================================

function parseMorphologyFile(filePath: string): Map<string, WordMorphology> {
    const content = fs.readFileSync(filePath, 'utf-8');
    const lines = content.split('\n').filter(line => line.trim());

    const wordMap = new Map<string, WordMorphology>();

    for (const line of lines) {
        const parts = line.split('\t');
        if (parts.length < 4) continue;

        const [location, arabic, pos, features] = parts;
        const [surah, verse, word] = location.split(':').map(Number);

        if (isNaN(surah) || isNaN(verse) || isNaN(word) || surah < START_SURAH || surah > END_SURAH) continue;

        const key = `${surah}:${verse}:${word}`;

        if (!wordMap.has(key)) {
            wordMap.set(key, {
                surah,
                verse,
                word,
                segments: []
            });
        }

        wordMap.get(key)!.segments.push({ arabic, pos, features });
    }

    return wordMap;
}

// Copy determineMainPOS logic from parse-morphology.ts
const POS_MAP: { [key: string]: string } = {
    'N': 'Noun',
    'V': 'Verb',
    'P': 'Particle',
    'PRON': 'Pronoun',
    'ADJ': 'Adjective',
    'DET': 'Determiner',
    'PREP': 'Preposition',
    'CONJ': 'Conjunction',
    'NEG': 'Negative Particle',
    'ACC': 'Accusative Particle',
    'INTG': 'Interrogative',
    'DEM': 'Demonstrative',
    'REL': 'Relative Pronoun',
    'INL': 'Initial Letters',
};

function extractPronounDetails(suffixFeatures: string): { person?: string; number?: string; gender?: string } {
    const details: any = {};
    if (suffixFeatures.includes('1P') || suffixFeatures.match(/\b1P\b/)) {
        details.person = 'first'; details.number = 'plural';
    } else if (suffixFeatures.includes('1S') || suffixFeatures.match(/\b1S\b/)) {
        details.person = 'first'; details.number = 'singular';
    } else if (suffixFeatures.includes('2P') || suffixFeatures.match(/\b2P\b/)) {
        details.person = 'second'; details.number = 'plural';
    } else if (suffixFeatures.includes('2MS') || suffixFeatures.match(/\b2MS\b/)) {
        details.person = 'second'; details.number = 'singular'; details.gender = 'masculine';
    } else if (suffixFeatures.includes('2FS') || suffixFeatures.match(/\b2FS\b/)) {
        details.person = 'second'; details.number = 'singular'; details.gender = 'feminine';
    } else if (suffixFeatures.includes('2MP') || suffixFeatures.match(/\b2MP\b/)) {
        details.person = 'second'; details.number = 'plural'; details.gender = 'masculine';
    } else if (suffixFeatures.includes('2FP') || suffixFeatures.match(/\b2FP\b/)) {
        details.person = 'second'; details.number = 'plural'; details.gender = 'feminine';
    } else if (suffixFeatures.includes('3P') || suffixFeatures.match(/\b3P\b/)) {
        details.person = 'third'; details.number = 'plural';
    } else if (suffixFeatures.includes('3MS') || suffixFeatures.match(/\b3MS\b/)) {
        details.person = 'third'; details.number = 'singular'; details.gender = 'masculine';
    } else if (suffixFeatures.includes('3FS') || suffixFeatures.match(/\b3FS\b/)) {
        details.person = 'third'; details.number = 'singular'; details.gender = 'feminine';
    } else if (suffixFeatures.includes('3MP') || suffixFeatures.match(/\b3MP\b/)) {
        details.person = 'third'; details.number = 'plural'; details.gender = 'masculine';
    } else if (suffixFeatures.includes('3FP') || suffixFeatures.match(/\b3FP\b/)) {
        details.person = 'third'; details.number = 'plural'; details.gender = 'feminine';
    } else if (suffixFeatures.includes('2D') || suffixFeatures.match(/\b2D\b/)) {
        details.person = 'second'; details.number = 'dual';
    } else if (suffixFeatures.includes('3D') || suffixFeatures.match(/\b3D\b/)) {
        details.person = 'third'; details.number = 'dual';
    } else if (suffixFeatures.includes('3MD') || suffixFeatures.match(/\b3MD\b/)) {
        details.person = 'third'; details.number = 'dual'; details.gender = 'masculine';
    } else if (suffixFeatures.includes('3FD') || suffixFeatures.match(/\b3FD\b/)) {
        details.person = 'third'; details.number = 'dual'; details.gender = 'feminine';
    }
    return details;
}

function determineMainPOS(segments: Array<{ arabic: string; pos: string; features: string }>): any {
    const prefixes = segments.filter((s, i) =>
        s.features.includes('PREF') || (i === 0 && s.pos === 'P')
    );
    const stems = segments.filter(s =>
        !s.features.includes('PREF') && !s.features.includes('SUFF') && s.pos !== 'P'
    );
    const suffixes = segments.filter(s => s.features.includes('SUFF'));

    const hasPrep = prefixes.some(p =>
        p.features.includes('LEM:ب') ||
        p.features.includes('LEM:ل') ||
        p.features.includes('LEM:في') ||
        p.features.includes('LEM:على') ||
        p.features.includes('P|PREF')
    );

    const hasConj = prefixes.some(p => p.features.includes('CONJ'));
    const pronounSuffixes = suffixes.filter(s => s.features.includes('PRON'));
    const hasPronoun = pronounSuffixes.length > 0;

    const stemPos = stems.length > 0 ? stems[0].pos : (segments[0]?.pos || 'P');

    // Handle compound cases: NOUN + PRONOUN or VERB + PRONOUN
    if (hasPronoun && (stemPos === 'N' || stemPos === 'V')) {
        const mainPos = POS_MAP[stemPos] || stemPos;
        const compoundPOS = mainPos.toLowerCase() === 'noun' ? 'noun_pronoun' : 'verb_pronoun';

        const grammarInfo: any = {
            part_of_speech: compoundPOS,
            features: [mainPos.toLowerCase(), 'pronoun']
        };

        const pronounSuffix = pronounSuffixes[0];
        if (pronounSuffix) {
            const pronounDetails = extractPronounDetails(pronounSuffix.features);
            if (pronounDetails.person) grammarInfo.pronoun_person = pronounDetails.person;
            if (pronounDetails.number) grammarInfo.pronoun_number = pronounDetails.number;
            if (pronounDetails.gender) grammarInfo.pronoun_gender = pronounDetails.gender;
        }

        if (stemPos === 'N') {
            stems.forEach(seg => {
                if (seg.features.includes('GEN')) grammarInfo.case = 'genitive';
                if (seg.features.includes('NOM')) grammarInfo.case = 'nominative';
                if (seg.features.includes('ACC')) grammarInfo.case = 'accusative';
            });
        }

        if (stemPos === 'V') {
            stems.forEach(seg => {
                const features = seg.features;
                const formMatch = features.match(/VF:(\d+)/);
                if (formMatch) grammarInfo.form = formMatch[1];
                if (features.includes('PERF')) {
                    grammarInfo.aspect = 'perfect';
                    grammarInfo.tense = 'past';
                } else if (features.includes('IMPF')) {
                    grammarInfo.aspect = 'imperfect';
                    grammarInfo.tense = 'present';
                } else if (features.includes('IMPV')) {
                    grammarInfo.aspect = 'imperative';
                    grammarInfo.tense = 'imperative';
                }
                if (features.includes('PASS')) {
                    grammarInfo.voice = 'passive';
                } else {
                    grammarInfo.voice = 'active';
                }
                if (features.includes('1P') || features.match(/\b1\b/)) grammarInfo.person = 'first';
                if (features.includes('2P') || features.match(/\b2\b/)) grammarInfo.person = 'second';
                if (features.includes('3P') || features.match(/\b3\b/)) grammarInfo.person = 'third';
                if (features.includes('IND')) grammarInfo.mood = 'indicative';
                if (features.includes('SUBJ')) grammarInfo.mood = 'subjunctive';
                if (features.includes('JUS')) grammarInfo.mood = 'jussive';
            });
        }

        stems.forEach(seg => {
            if (seg.features.includes('ROOT:')) {
                const root = seg.features.match(/ROOT:([^|]+)/)?.[1];
                if (root) grammarInfo.features.push(`root:${root}`);
            }
        });

        return grammarInfo;
    }

    if (hasPrep && stemPos === 'N') {
        const grammarInfo: any = { part_of_speech: 'preposition_noun', features: ['preposition', 'noun'] };
        segments.forEach(seg => {
            if (seg.features.includes('GEN')) grammarInfo.case = 'genitive';
            if (seg.features.includes('NOM')) grammarInfo.case = 'nominative';
            if (seg.features.includes('ACC')) grammarInfo.case = 'accusative';
        });
        return grammarInfo;
    }

    if (hasPrep && hasPronoun && !stems.length) {
        return { part_of_speech: 'preposition_pronoun', features: ['preposition', 'pronoun'] };
    }

    if (hasConj && hasPronoun) {
        return { part_of_speech: 'conjunction_pronoun', features: ['conjunction', 'pronoun'] };
    }

    if (hasPrep && stemPos === 'P') {
        return { part_of_speech: 'Preposition', features: ['preposition'] };
    }

    const mainPos = POS_MAP[stemPos] || stemPos;
    const featureList: string[] = [];
    const grammarInfo: any = { part_of_speech: mainPos };
    const isVerb = mainPos.toLowerCase() === 'verb' || stemPos === 'V';

    segments.forEach(seg => {
        const features = seg.features;
        if (features.includes('ROOT:')) {
            const root = features.match(/ROOT:([^|]+)/)?.[1];
            if (root) featureList.push(`root:${root}`);
        }
        if (features.includes('MS')) {
            featureList.push('masculine singular');
            grammarInfo.gender = 'masculine';
            grammarInfo.number = 'singular';
        }
        if (features.includes('FS')) {
            featureList.push('feminine singular');
            grammarInfo.gender = 'feminine';
            grammarInfo.number = 'singular';
        }
        if (features.includes('MP')) {
            featureList.push('masculine plural');
            grammarInfo.gender = 'masculine';
            grammarInfo.number = 'plural';
        }
        if (features.includes('FP')) {
            featureList.push('feminine plural');
            grammarInfo.gender = 'feminine';
            grammarInfo.number = 'plural';
        }
        if (features.includes('NOM')) {
            featureList.push('nominative');
            grammarInfo.case = 'nominative';
        }
        if (features.includes('GEN')) {
            featureList.push('genitive');
            grammarInfo.case = 'genitive';
        }
        if (features.includes('ACC')) {
            featureList.push('accusative');
            grammarInfo.case = 'accusative';
        }
        if (isVerb) {
            if (features.includes('1P') || features.match(/\b1\b/)) grammarInfo.person = 'first';
            if (features.includes('2P') || features.match(/\b2\b/)) grammarInfo.person = 'second';
            if (features.includes('3P') || features.match(/\b3\b/)) grammarInfo.person = 'third';
            if (features.includes('PERF')) {
                grammarInfo.tense = 'past';
                grammarInfo.aspect = 'perfect';
            }
            if (features.includes('IMPF')) {
                grammarInfo.tense = 'present';
                grammarInfo.aspect = 'imperfect';
            }
            if (features.includes('IMPV')) {
                grammarInfo.tense = 'imperative';
                grammarInfo.aspect = 'imperative';
            }
            if (features.includes('IND')) grammarInfo.mood = 'indicative';
            if (features.includes('SUBJ')) grammarInfo.mood = 'subjunctive';
            if (features.includes('JUS')) grammarInfo.mood = 'jussive';
            const formMatch = features.match(/VF:(\d+)/);
            if (formMatch) grammarInfo.form = formMatch[1];
            if (features.includes('PASS')) {
                grammarInfo.voice = 'passive';
                featureList.push('passive');
            } else {
                grammarInfo.voice = 'active';
            }
        }
    });

    grammarInfo.features = featureList.length > 0 ? featureList : [mainPos.toLowerCase()];
    return grammarInfo;
}

function getGrammarInfoFromMorphology(
    surah: number,
    verse: number,
    word: number,
    morphologyMap: Map<string, WordMorphology>
): any {
    const key = `${surah}:${verse}:${word}`;
    const wordData = morphologyMap.get(key);

    if (!wordData || !wordData.segments || wordData.segments.length === 0) {
        return null;
    }

    return determineMainPOS(wordData.segments);
}

// ============================================================================
// STEP 3: DATA FETCHING
// ============================================================================

let allQuranWordsCache: any[] | null = null;

async function fetchSurahData(surahNumber: number): Promise<QuranSurah | null> {
    if (!allQuranWordsCache) {
        const allQuranWords = await quranWords.getAllQuranWords();
        if (!allQuranWords || !Array.isArray(allQuranWords)) {
            throw new Error('Failed to fetch data from package: invalid data structure');
        }
        allQuranWordsCache = allQuranWords;
    }

    const surahWords: Record<number, QuranWord[]> = {};

    for (const page of allQuranWordsCache) {
        if (!page.ayahs || !Array.isArray(page.ayahs)) continue;

        for (const ayah of page.ayahs) {
            if (!ayah.words || !Array.isArray(ayah.words)) continue;

            for (const word of ayah.words) {
                if (word.parentAyahVerseKey) {
                    const [surah, ayahNum] = word.parentAyahVerseKey.split(':').map(Number);

                    if (surah === surahNumber && ayahNum) {
                        if (word.char_type_name !== 'end' && word.text && word.text.trim()) {
                            if (!surahWords[ayahNum]) {
                                surahWords[ayahNum] = [];
                            }
                            surahWords[ayahNum].push({
                                text: word.text,
                                translation: word.translation || { text: '' },
                                transliteration: word.transliteration || { text: '' },
                            });
                        }
                    }
                }
            }
        }
    }

    if (Object.keys(surahWords).length === 0) {
        return null;
    }

    const ayahs: QuranAyah[] = Object.keys(surahWords)
        .sort((a, b) => Number(a) - Number(b))
        .map(ayahNum => ({
            ayah: Number(ayahNum),
            words: surahWords[Number(ayahNum)],
        }));

    return { surah: surahNumber, ayahs };
}

// Fetch Arabic verse text from CDN (standard encoding U+0600-U+06FF)
async function fetchVerseTextFromCDN(surahNumber: number): Promise<Record<number, string>> {
    const url = `https://cdn.jsdelivr.net/npm/quran-json@3.1.2/dist/chapters/${surahNumber}.json`;
    const response = await fetch(url);
    if (!response.ok) {
        throw new Error(`Failed to fetch surah ${surahNumber} from CDN: ${response.statusText}`);
    }
    const data = await response.json();

    const verseTexts: Record<number, string> = {};
    if (data.verses && Array.isArray(data.verses)) {
        data.verses.forEach((verse: any) => {
            // Handle different possible verse number fields
            const verseNum = verse.id || verse.verse || verse.verse_number;
            const verseText = verse.text || verse.text_arabic || '';
            if (verseNum && verseText) {
                verseTexts[verseNum] = verseText;
            }
        });
    }

    return verseTexts;
}

// Split Arabic verse text into words (simple space-based splitting)
// CRITICAL: This uses standard Arabic encoding from CDN, not Presentation Forms from @kmaslesa
function splitArabicIntoWords(verseText: string): string[] {
    // Remove extra spaces and split
    return verseText.trim().split(/\s+/).filter(w => w.length > 0);
}

// ============================================================================
// STEP 4: DATABASE OPERATIONS
// ============================================================================

async function insertSurah(
    surahNumber: number,
    metadata: { name_arabic: string; name_english: string; total_verses: number }
) {
    const { data: surah, error } = await supabase
        .from('surahs')
        .upsert({
            surah_number: surahNumber,
            name_arabic: metadata.name_arabic,
            name_english: metadata.name_english,
            total_verses: metadata.total_verses,
        }, {
            onConflict: 'surah_number',
        })
        .select()
        .single();

    if (error) {
        throw new Error(`Failed to insert surah ${surahNumber}: ${error.message}`);
    }

    return surah;
}

async function insertVerses(
    surahId: number,
    ayahs: QuranAyah[],
    verseTexts: Record<number, string>
) {
    // CRITICAL: Always use CDN text (standard encoding), never reconstruct from @kmaslesa words
    const versesToInsert = ayahs.map((ayah) => {
        const verseText = verseTexts[ayah.ayah];
        if (!verseText) {
            throw new Error(`Missing verse text from CDN for surah ${surahId}, verse ${ayah.ayah}`);
        }

        return {
            surah_id: surahId,
            verse_number: ayah.ayah,
            text_arabic: verseText, // Standard Arabic encoding from CDN
        };
    });

    const { data, error } = await supabase
        .from('verses')
        .upsert(versesToInsert, {
            onConflict: 'surah_id,verse_number',
        })
        .select();

    if (error) {
        throw new Error(`Failed to insert verses: ${error.message}`);
    }

    return data;
}

async function insertWords(
    verses: Array<{ id: number; verse_number: number }>,
    ayahs: QuranAyah[],
    morphologyMap: Map<string, WordMorphology>,
    surahNumber: number,
    verseTexts: Record<number, string>
) {
    let totalWords = 0;

    for (const ayah of ayahs) {
        const verse = verses.find(v => v.verse_number === ayah.ayah);
        if (!verse) continue;

        // CRITICAL: Get Arabic words from CDN verse text (standard encoding), not from @kmaslesa package
        const verseText = verseTexts[ayah.ayah];
        if (!verseText) {
            console.warn(`  ⚠️  Missing verse text for verse ${ayah.ayah}, skipping words`);
            continue;
        }

        const arabicWords = splitArabicIntoWords(verseText);

        // Get translations from @kmaslesa package (by position matching)
        const translationWords = ayah.words || [];

        const wordsToInsert = arabicWords.map((arabicWord, wordIndex) => {
            // Match translation by position
            const translationWord = translationWords[wordIndex] || translationWords.find((w: any) =>
                w.text && w.text.trim().length > 0
            ) || null;

            // Get grammar info from morphology file
            const grammarInfoData = getGrammarInfoFromMorphology(surahNumber, ayah.ayah, wordIndex + 1, morphologyMap);

            // Use morphology data if available, otherwise use a basic fallback
            const grammarInfo: GrammarInfo = grammarInfoData || {
                part_of_speech: 'Noun',
            };

            return {
                verse_id: verse.id,
                word_position: wordIndex + 1,
                text_arabic: arabicWord, // CRITICAL: Use CDN word (standard encoding), not package word
                transliteration: translationWord?.transliteration?.text || null,
                translation_english: translationWord?.translation?.text || null,
                grammar_info: grammarInfo,
            };
        });

        const { error } = await supabase
            .from('words')
            .upsert(wordsToInsert, {
                onConflict: 'verse_id,word_position',
            });

        if (error) {
            throw new Error(`Failed to insert words for verse ${ayah.ayah}: ${error.message}`);
        }

        totalWords += wordsToInsert.length;
    }

    return totalWords;
}

// ============================================================================
// MAIN PROCESSING
// ============================================================================

async function processSurah(surahNumber: number, morphologyMap: Map<string, WordMorphology>) {
    console.log(`\n📖 Processing Surah ${surahNumber}...`);

    const metadata = SURAH_METADATA[surahNumber];
    if (!metadata) {
        throw new Error(`No metadata found for surah ${surahNumber}`);
    }

    // Fetch data
    const quranData = await fetchSurahData(surahNumber);
    if (!quranData) {
        throw new Error(`Surah ${surahNumber} not found in package data`);
    }

    const verseTexts = await fetchVerseTextFromCDN(surahNumber);

    console.log(`  ✓ Fetched: ${metadata.name_english} (${metadata.name_arabic})`);
    console.log(`  ✓ Total verses: ${metadata.total_verses}`);

    // Insert surah
    const surah = await insertSurah(surahNumber, metadata);
    console.log(`  ✓ Inserted surah (ID: ${surah.id})`);

    // Insert verses
    const verses = await insertVerses(surah.id, quranData.ayahs, verseTexts);
    console.log(`  ✓ Inserted ${verses.length} verses`);

    // Insert words (CRITICAL: pass verseTexts so we use CDN Arabic words, not @kmaslesa words)
    const wordsAdded = await insertWords(verses, quranData.ayahs, morphologyMap, surahNumber, verseTexts);
    console.log(`  ✓ Inserted ${wordsAdded} words`);

    console.log(`  ✅ Surah ${surahNumber} completed successfully!`);

    return { wordsAdded };
}

// ============================================================================
// MAIN EXECUTION
// ============================================================================

async function main() {
    console.log('🚀 Starting Import Script for Surahs 78-96');
    console.log('='.repeat(70));
    console.log(`📖 Processing surahs ${START_SURAH} through ${END_SURAH} (${TOTAL_SURAHS} surahs)`);
    console.log('='.repeat(70));

    // Step 1: Verification
    if (!skipVerify) {
        const verified = verifyCorpusCoverage();
        if (!verified && !verifyOnly) {
            console.log('⚠️  Verification failed, but continuing with import...\n');
        }
        if (verifyOnly) {
            process.exit(verified ? 0 : 1);
        }
    }

    // Step 2: Load morphology data
    console.log('\n' + '='.repeat(70));
    console.log('STEP 2: EXTRACTION - Loading Morphology Data');
    console.log('='.repeat(70) + '\n');

    const morphologyFile = resolve(process.cwd(), 'docs/corpus-files/quran-morphology.txt');
    if (!fs.existsSync(morphologyFile)) {
        console.error(`❌ Morphology file not found: ${morphologyFile}`);
        process.exit(1);
    }

    console.log(`📖 Parsing morphology file...`);
    const morphologyMap = parseMorphologyFile(morphologyFile);
    console.log(`✓ Loaded morphology data for ${morphologyMap.size} words\n`);

    // Step 3: Import
    console.log('='.repeat(70));
    console.log('STEP 3: IMPORT - Importing to Supabase');
    console.log('='.repeat(70) + '\n');

    const startTime = Date.now();
    let successCount = 0;
    let failureCount = 0;
    let totalWords = 0;
    const failedSurahs: number[] = [];

    for (let surahNumber = START_SURAH; surahNumber <= END_SURAH; surahNumber++) {
        try {
            const result = await processSurah(surahNumber, morphologyMap);
            successCount++;
            totalWords += result.wordsAdded;
        } catch (error: any) {
            failureCount++;
            failedSurahs.push(surahNumber);
            console.error(`\n❌ Failed to process surah ${surahNumber}:`, error.message);
        }
    }

    // Summary
    const endTime = Date.now();
    const duration = ((endTime - startTime) / 1000).toFixed(2);

    console.log('\n\n' + '='.repeat(70));
    console.log('📊 IMPORT SUMMARY');
    console.log('='.repeat(70));
    console.log(`✅ Successfully processed: ${successCount}/${TOTAL_SURAHS} surahs`);
    console.log(`❌ Failed: ${failureCount}/${TOTAL_SURAHS} surahs`);
    if (failedSurahs.length > 0) {
        console.log(`⚠️  Failed surahs: ${failedSurahs.join(', ')}`);
    }
    console.log(`📝 Total words added: ${totalWords.toLocaleString()}`);
    console.log(`⏱️  Time taken: ${duration} seconds`);
    console.log('='.repeat(70) + '\n');

    if (failureCount > 0) {
        console.log(`⚠️  Warning: ${failureCount} surah(s) failed to process.`);
        process.exit(1);
    } else {
        console.log('🎉 All surahs processed successfully!');
    }
}

main().catch((error) => {
    console.error('\n💥 Fatal error:', error);
    process.exit(1);
});
