/**
 * Parse the quran-morphology.txt file and generate SQL updates
 * 
 * This script works with the file format from:
 * https://github.com/mustafa0x/quran-morphology
 * 
 * Format: surah:verse:word:segment TAB arabic TAB pos TAB features
 * Example: 97:1:1:1	إِنَّ	P	ACC|LEM:إِنّ|FAM:إِنّ
 */

import * as fs from 'fs';

interface WordData {
  surah: number;
  verse: number;
  word: number;
  segments: Array<{
    arabic: string;
    pos: string;
    features: string;
  }>;
}

/**
 * Map corpus POS tags to our standardized format
 */
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

/**
 * Extract pronoun details from a suffix segment
 */
function extractPronounDetails(suffixFeatures: string): { person?: string; number?: string; gender?: string } {
  const details: any = {};

  // Extract person (1P, 2P, 3P or 1S, 2MS, 3FS, etc.)
  if (suffixFeatures.includes('1P') || suffixFeatures.match(/\b1P\b/)) {
    details.person = 'first';
    details.number = 'plural';
  } else if (suffixFeatures.includes('1S') || suffixFeatures.match(/\b1S\b/)) {
    details.person = 'first';
    details.number = 'singular';
  } else if (suffixFeatures.includes('2P') || suffixFeatures.match(/\b2P\b/)) {
    details.person = 'second';
    details.number = 'plural';
  } else if (suffixFeatures.includes('2MS') || suffixFeatures.match(/\b2MS\b/)) {
    details.person = 'second';
    details.number = 'singular';
    details.gender = 'masculine';
  } else if (suffixFeatures.includes('2FS') || suffixFeatures.match(/\b2FS\b/)) {
    details.person = 'second';
    details.number = 'singular';
    details.gender = 'feminine';
  } else if (suffixFeatures.includes('2MP') || suffixFeatures.match(/\b2MP\b/)) {
    details.person = 'second';
    details.number = 'plural';
    details.gender = 'masculine';
  } else if (suffixFeatures.includes('2FP') || suffixFeatures.match(/\b2FP\b/)) {
    details.person = 'second';
    details.number = 'plural';
    details.gender = 'feminine';
  } else if (suffixFeatures.includes('3P') || suffixFeatures.match(/\b3P\b/)) {
    details.person = 'third';
    details.number = 'plural';
  } else if (suffixFeatures.includes('3MS') || suffixFeatures.match(/\b3MS\b/)) {
    details.person = 'third';
    details.number = 'singular';
    details.gender = 'masculine';
  } else if (suffixFeatures.includes('3FS') || suffixFeatures.match(/\b3FS\b/)) {
    details.person = 'third';
    details.number = 'singular';
    details.gender = 'feminine';
  } else if (suffixFeatures.includes('3MP') || suffixFeatures.match(/\b3MP\b/)) {
    details.person = 'third';
    details.number = 'plural';
    details.gender = 'masculine';
  } else if (suffixFeatures.includes('3FP') || suffixFeatures.match(/\b3FP\b/)) {
    details.person = 'third';
    details.number = 'plural';
    details.gender = 'feminine';
  } else if (suffixFeatures.includes('2D') || suffixFeatures.match(/\b2D\b/)) {
    details.person = 'second';
    details.number = 'dual';
  } else if (suffixFeatures.includes('3D') || suffixFeatures.match(/\b3D\b/)) {
    details.person = 'third';
    details.number = 'dual';
  } else if (suffixFeatures.includes('3MD') || suffixFeatures.match(/\b3MD\b/)) {
    details.person = 'third';
    details.number = 'dual';
    details.gender = 'masculine';
  } else if (suffixFeatures.includes('3FD') || suffixFeatures.match(/\b3FD\b/)) {
    details.person = 'third';
    details.number = 'dual';
    details.gender = 'feminine';
  }

  return details;
}

/**
 * Determine the main POS for a word based on its segments
 * Returns full grammar_info object with structured fields
 */
function determineMainPOS(segments: Array<{ arabic: string; pos: string; features: string }>): any {
  // Group segments by type
  const prefixes = segments.filter((s, i) =>
    s.features.includes('PREF') || (i === 0 && s.pos === 'P')
  );
  const stems = segments.filter(s =>
    !s.features.includes('PREF') && !s.features.includes('SUFF') && s.pos !== 'P'
  );
  const suffixes = segments.filter(s => s.features.includes('SUFF'));

  // Handle compound cases
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

  // Determine stem POS
  const stemPos = stems.length > 0 ? stems[0].pos : (segments[0]?.pos || 'P');

  // CRITICAL FIX: Check for standalone pronouns (POS=N with PRON feature, not a suffix)
  // Example: هُمْ in 78:3:2:1 has POS=N but features=PRON|3MP
  const standalonePronouns = segments.filter(s =>
    s.features.includes('PRON') &&
    !s.features.includes('SUFF') &&
    !s.features.includes('PREF')
  );

  if (standalonePronouns.length > 0) {
    // This is a standalone pronoun, not a compound word
    const pronounSegment = standalonePronouns[0];
    const grammarInfo: any = {
      part_of_speech: 'Pronoun',
      features: ['pronoun']
    };

    // Extract pronoun details from features (e.g., 3MP = 3rd person masculine plural)
    const pronounDetails = extractPronounDetails(pronounSegment.features);
    if (pronounDetails.person) grammarInfo.person = pronounDetails.person;
    if (pronounDetails.number) grammarInfo.number = pronounDetails.number;
    if (pronounDetails.gender) grammarInfo.gender = pronounDetails.gender;

    // Extract case if present
    if (pronounSegment.features.includes('GEN')) grammarInfo.case = 'genitive';
    if (pronounSegment.features.includes('NOM')) grammarInfo.case = 'nominative';
    if (pronounSegment.features.includes('ACC')) grammarInfo.case = 'accusative';

    return grammarInfo;
  }

  // Handle compound cases: NOUN + PRONOUN or VERB + PRONOUN
  if (hasPronoun && (stemPos === 'N' || stemPos === 'V')) {
    const mainPos = POS_MAP[stemPos] || stemPos;
    const compoundPOS = mainPos.toLowerCase() === 'noun' ? 'noun_pronoun' : 'verb_pronoun';

    const grammarInfo: any = {
      part_of_speech: compoundPOS,
      features: [mainPos.toLowerCase(), 'pronoun']
    };

    // Extract pronoun details from suffix
    const pronounSuffix = pronounSuffixes[0]; // Take first pronoun suffix
    if (pronounSuffix) {
      const pronounDetails = extractPronounDetails(pronounSuffix.features);
      if (pronounDetails.person) grammarInfo.pronoun_person = pronounDetails.person;
      if (pronounDetails.number) grammarInfo.pronoun_number = pronounDetails.number;
      if (pronounDetails.gender) grammarInfo.pronoun_gender = pronounDetails.gender;
    }

    // Extract case from stem segments (for nouns)
    if (stemPos === 'N') {
      stems.forEach(seg => {
        if (seg.features.includes('GEN')) grammarInfo.case = 'genitive';
        if (seg.features.includes('NOM')) grammarInfo.case = 'nominative';
        if (seg.features.includes('ACC')) grammarInfo.case = 'accusative';
      });
    }

    // Extract verb-specific info from stem segments
    if (stemPos === 'V') {
      stems.forEach(seg => {
        const features = seg.features;

        // Extract verb form (VF:1, VF:2, etc.)
        const formMatch = features.match(/VF:(\d+)/);
        if (formMatch) {
          grammarInfo.form = formMatch[1];
        }

        // Extract aspect (PERF, IMPF, IMPV)
        if (features.includes('PERF')) {
          grammarInfo.aspect = 'perfect';
        } else if (features.includes('IMPF')) {
          grammarInfo.aspect = 'imperfect';
        } else if (features.includes('IMPV')) {
          grammarInfo.aspect = 'imperative';
        }

        // Extract voice (PASS, ACT)
        if (features.includes('PASS')) {
          grammarInfo.voice = 'passive';
        } else if (features.includes('ACT')) {
          grammarInfo.voice = 'active';
        } else {
          grammarInfo.voice = 'active'; // Default
        }

        // Extract person from verb stem (if not in pronoun)
        if (features.includes('1P') || features.match(/\b1\b/)) grammarInfo.person = 'first';
        if (features.includes('2P') || features.match(/\b2\b/)) grammarInfo.person = 'second';
        if (features.includes('3P') || features.match(/\b3\b/)) grammarInfo.person = 'third';

        // Extract tense
        if (features.includes('PERF')) grammarInfo.tense = 'past';
        if (features.includes('IMPF')) grammarInfo.tense = 'present';
        if (features.includes('IMPV')) grammarInfo.tense = 'imperative';

        // Extract mood
        if (features.includes('IND')) grammarInfo.mood = 'indicative';
        if (features.includes('SUBJ')) grammarInfo.mood = 'subjunctive';
        if (features.includes('JUS')) grammarInfo.mood = 'jussive';
      });
    }

    // Extract root from stem
    stems.forEach(seg => {
      if (seg.features.includes('ROOT:')) {
        const root = seg.features.match(/ROOT:([^|]+)/)?.[1];
        if (root) grammarInfo.features.push(`root:${root}`);
      }
    });

    return grammarInfo;
  }

  // Handle preposition + noun compounds
  if (hasPrep && stemPos === 'N') {
    const grammarInfo: any = { part_of_speech: 'preposition_noun', features: ['preposition', 'noun'] };
    // Extract case from segments
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

  // Standard case - use the stem or main segment
  const mainPos = POS_MAP[stemPos] || stemPos;

  // Extract features and structured grammar info
  const featureList: string[] = [];
  const grammarInfo: any = {
    part_of_speech: mainPos
  };

  // For verbs, extract person/tense/mood from all segments
  const isVerb = mainPos.toLowerCase() === 'verb' || stemPos === 'V';

  segments.forEach(seg => {
    const features = seg.features;

    // Extract root
    if (features.includes('ROOT:')) {
      const root = features.match(/ROOT:([^|]+)/)?.[1];
      if (root) featureList.push(`root:${root}`);
    }

    // Extract gender and number
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

    // Extract case
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

    // Extract person for verbs (1P, 2P, 3P codes or 1, 2, 3)
    if (isVerb) {
      if (features.includes('1P') || features.match(/\b1\b/)) grammarInfo.person = 'first';
      if (features.includes('2P') || features.match(/\b2\b/)) grammarInfo.person = 'second';
      if (features.includes('3P') || features.match(/\b3\b/)) grammarInfo.person = 'third';

      // Extract tense for verbs (PERF, IMPF, IMPV codes)
      if (features.includes('PERF')) grammarInfo.tense = 'past';
      if (features.includes('IMPF')) grammarInfo.tense = 'present';
      if (features.includes('IMPV')) grammarInfo.tense = 'imperative';

      // Extract mood for verbs (IND, SUBJ, JUS codes)
      if (features.includes('IND')) grammarInfo.mood = 'indicative';
      if (features.includes('SUBJ')) grammarInfo.mood = 'subjunctive';
      if (features.includes('JUS')) grammarInfo.mood = 'jussive';
      if (features.includes('IMPV') && !grammarInfo.tense) grammarInfo.mood = 'imperative';

      // Extract verb form (VF:1, VF:2, etc.)
      const formMatch = features.match(/VF:(\d+)/);
      if (formMatch) {
        grammarInfo.form = formMatch[1];
      }

      // Extract aspect (PERF, IMPF, IMPV)
      if (features.includes('PERF')) {
        grammarInfo.aspect = 'perfect';
      } else if (features.includes('IMPF')) {
        grammarInfo.aspect = 'imperfect';
      } else if (features.includes('IMPV')) {
        grammarInfo.aspect = 'imperative';
      }

      // Extract voice for verbs (PASS = passive, ACT = active, or implied active if not specified)
      if (features.includes('PASS')) {
        grammarInfo.voice = 'passive';
        featureList.push('passive');
      } else if (features.includes('ACT')) {
        grammarInfo.voice = 'active';
        featureList.push('active');
      } else {
        // If no voice code, default to active (most verbs are active)
        grammarInfo.voice = 'active';
      }
    }
  });

  // Add features array
  grammarInfo.features = featureList.length > 0 ? featureList : [mainPos.toLowerCase()];

  return grammarInfo;
}

/**
 * Parse the morphology file
 */
function parseMorphologyFile(filePath: string): WordData[] {
  const content = fs.readFileSync(filePath, 'utf-8');
  const lines = content.split('\n').filter(line => line.trim());

  const wordMap: { [key: string]: WordData } = {};

  for (const line of lines) {
    const parts = line.split('\t');
    if (parts.length < 4) continue;

    const [location, arabic, pos, features] = parts;
    const [surah, verse, word, segment] = location.split(':').map(Number);

    const key = `${surah}:${verse}:${word}`;

    if (!wordMap[key]) {
      wordMap[key] = {
        surah,
        verse,
        word,
        segments: []
      };
    }

    wordMap[key].segments.push({ arabic, pos, features });
  }

  return Object.values(wordMap);
}

/**
 * Generate SQL for target surahs
 */
function generateSQL(words: WordData[]): string {
  const TARGET_SURAHS = [97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114];

  const filtered = words.filter(w => TARGET_SURAHS.includes(w.surah));

  const sql: string[] = [];
  sql.push('-- Update grammar_info from Quranic Arabic Corpus');
  sql.push('-- Source: https://github.com/mustafa0x/quran-morphology');
  sql.push('-- File: quran-morphology.txt');
  sql.push('-- Surahs: 97-114 (Juz Amma only)');
  sql.push('-- Note: Surah 1 (Al-Fatiha) is EXCLUDED (manually created)\n');

  let currentSurah = -1;

  for (const word of filtered) {
    if (word.surah !== currentSurah) {
      currentSurah = word.surah;
      sql.push(`\n-- ========== SURAH ${currentSurah} ==========`);
    }

    const grammarInfo = determineMainPOS(word.segments);

    sql.push(`
UPDATE words 
SET grammar_info = '${JSON.stringify(grammarInfo)}'::jsonb
WHERE verse_id = (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number = ${word.surah}
  AND v.verse_number = ${word.verse}
)
AND word_position = ${word.word};`);
  }

  return sql.join('\n');
}

/**
 * Main function
 */
function main() {
  // Default to the file in docs/corpus-files/ or allow override via command line
  const inputFile = process.argv[2] || './docs/corpus-files/quran-morphology.txt';
  const outputFile = process.argv[3] || './docs/corpus-files/update-grammar-from-corpus-compound-words.sql';

  console.log('🚀 Parsing Quranic morphology data...\n');

  // Parse the file
  console.log('📖 Reading file:', inputFile);
  const words = parseMorphologyFile(inputFile);
  console.log(`✅ Parsed ${words.length} total words\n`);

  // Filter for target surahs
  const targetWords = words.filter(w => w.surah >= 97 && w.surah <= 114);
  console.log(`🎯 Found ${targetWords.length} words in Surahs 97-114\n`);

  // Show some examples
  console.log('📊 Sample corrections:\n');

  // Find some interesting examples
  const examples = [
    targetWords.find(w => w.segments.some(s => s.arabic.includes('إِنَّ'))),
    targetWords.find(w => w.segments.some(s => s.arabic.includes('فِى'))),
    targetWords.find(w => w.segments.some(s => s.pos === 'V'))
  ].filter(Boolean);

  examples.slice(0, 3).forEach(word => {
    if (!word) return;
    const grammarInfo = determineMainPOS(word.segments);
    const arabicText = word.segments.map(s => s.arabic).join('');
    console.log(`   ${arabicText}`);
    console.log(`   → POS: ${grammarInfo.part_of_speech}`);
    console.log(`   → Features: ${Array.isArray(grammarInfo.features) ? grammarInfo.features.join(', ') : 'N/A'}\n`);
  });

  // Generate SQL
  console.log('🔨 Generating SQL updates...');
  const sql = generateSQL(words);

  fs.writeFileSync(outputFile, sql);
  console.log(`✅ SQL written to: ${outputFile}\n`);

  // Summary statistics
  console.log('📊 Summary by Part of Speech:');
  console.log('─'.repeat(50));

  const posCounts: { [key: string]: number } = {};
  targetWords.forEach(word => {
    const grammarInfo = determineMainPOS(word.segments);
    const pos = grammarInfo.part_of_speech || 'Unknown';
    posCounts[pos] = (posCounts[pos] || 0) + 1;
  });

  Object.entries(posCounts)
    .sort((a, b) => b[1] - a[1])
    .forEach(([pos, count]) => {
      console.log(`   ${pos.padEnd(30)} ${count.toString().padStart(4)}`);
    });

  console.log('\n✅ Done! Next steps:');
  console.log('   1. Review: update-grammar-from-corpus.sql');
  console.log('   2. Backup your database (optional but recommended)');
  console.log('   3. Run the SQL in Supabase SQL Editor');
  console.log("   4. Verify with: SELECT grammar_info->>'part_of_speech', COUNT(*) FROM words GROUP BY 1;");
}

main();
