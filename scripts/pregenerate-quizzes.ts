// @ts-nocheck
/**
 * Pre-generate quizzes for all surahs in Juz Amma (surahs 78-114)
 * 
 * This script:
 * 1. Connects to Supabase using server credentials
 * 2. Loops through surahs 78-114
 * 3. Checks if quiz already exists in quiz_bank table
 * 4. If not, generates quiz using the shared quiz generation utility
 * 5. Logs progress and handles errors gracefully
 * 6. Displays summary at the end
 * 
 * Usage: npx tsx scripts/pregenerate-quizzes.ts
 * 
 * Required environment variables (in .env.local):
 * - NEXT_PUBLIC_SUPABASE_URL
 * - SUPABASE_SERVICE_ROLE_KEY (or SUPABASE_SERVICE_KEY)
 * - MISTRAL_API_KEY
 */

// Load environment variables from .env.local
import { config } from 'dotenv';
import { resolve } from 'path';

// Load .env.local file
config({ path: resolve(process.cwd(), '.env.local') });
config({ path: resolve(process.cwd(), '.env') });

import { createClient } from '@supabase/supabase-js';
import { generateQuizForSurah } from '../utils/quiz-generation';

// Configuration
const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SERVICE_KEY;
const DELAY_BETWEEN_REQUESTS_MS = 2000; // 2 seconds
const START_SURAH = 78;
const END_SURAH = 114;

interface SurahInfo {
  id: number;
  surah_number: number;
  name_english: string;
  name_arabic: string;
}

interface GenerationResult {
  surahNumber: number;
  surahName: string;
  success: boolean;
  questionsGenerated: number;
  error?: string;
}

/**
 * Check if a quiz already exists for a surah
 */
async function quizExists(
  supabase: any,
  surahId: number
): Promise<boolean> {
  const { data, error } = await supabase
    .from('quiz_bank')
    .select('id')
    .eq('surah_id', surahId)
    .limit(1);

  if (error) {
    console.error(`Error checking quiz existence for surah ${surahId}:`, error);
    return false;
  }

  return Array.isArray(data) && data.length > 0;
}

/**
 * Get surah ID from surah number
 */
async function getSurahId(
  supabase: any,
  surahNumber: number
): Promise<number | null> {
  const { data, error } = await supabase
    .from('surahs')
    .select('id')
    .eq('surah_number', surahNumber)
    .single();

  if (error || !data) {
    console.error(`Error fetching surah ${surahNumber}:`, error);
    return null;
  }

  return (data as any).id;
}

/**
 * Get surah info (name, etc.) for display
 */
async function getSurahInfo(
  supabase: any,
  surahNumber: number
): Promise<SurahInfo | null> {
  const { data, error } = await supabase
    .from('surahs')
    .select('id, surah_number, name_english, name_arabic')
    .eq('surah_number', surahNumber)
    .single();

  if (error || !data) {
    console.error(`Error fetching surah info for ${surahNumber}:`, error);
    return null;
  }

  const surahData = data as any;
  return {
    id: surahData.id,
    surah_number: surahData.surah_number,
    name_english: surahData.name_english,
    name_arabic: surahData.name_arabic
  };
}

/**
 * Sleep for specified milliseconds
 */
function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

/**
 * Main function
 */
async function main() {
  console.log('🚀 Starting quiz pre-generation for Juz Amma (Surahs 78-114)\n');

  // Validate environment variables
  if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
    console.error('❌ Missing required environment variables:');
    console.error('   NEXT_PUBLIC_SUPABASE_URL:', SUPABASE_URL ? '✓' : '✗');
    console.error('   SUPABASE_SERVICE_ROLE_KEY or SUPABASE_SERVICE_KEY:', SUPABASE_SERVICE_KEY ? '✓' : '✗');
    console.error('\n💡 Tip: Add SUPABASE_SERVICE_ROLE_KEY to your .env.local file');
    process.exit(1);
  }

  if (!process.env.MISTRAL_API_KEY) {
    console.error('❌ Missing MISTRAL_API_KEY environment variable');
    process.exit(1);
  }

  // Create Supabase client
  const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  // Verify connection
  const { error: connectionError } = await supabase.from('surahs').select('surah_number').limit(1);
  if (connectionError) {
    console.error('❌ Failed to connect to Supabase:', connectionError);
    process.exit(1);
  }

  console.log('✓ Connected to Supabase\n');

  const results: GenerationResult[] = [];
  let generatedCount = 0;
  let skippedCount = 0;
  let errorCount = 0;

  // Process each surah
  for (let surahNumber = START_SURAH; surahNumber <= END_SURAH; surahNumber++) {
    try {
      // Get surah info
      const surahInfo = await getSurahInfo(supabase, surahNumber);
      if (!surahInfo) {
        console.log(`⚠️  Skipping Surah ${surahNumber}: Not found in database`);
        errorCount++;
        continue;
      }

      const surahName = `${surahInfo.name_english} (${surahInfo.name_arabic})`;
      console.log(`📖 Processing Surah ${surahNumber} - ${surahName}...`);

      // Check if quiz already exists
      const exists = await quizExists(supabase, surahInfo.id);
      if (exists) {
        console.log(`   ⏭️  Quiz already exists, skipping\n`);
        skippedCount++;
        results.push({
          surahNumber,
          surahName,
          success: true,
          questionsGenerated: 0,
        });
        continue;
      }

      // Generate quiz
      console.log(`   🔄 Generating quiz...`);
      const result = await generateQuizForSurah(supabase, surahInfo.id);

      if (result.success) {
        console.log(`   ✅ Generated ${result.questionsGenerated} questions\n`);
        generatedCount++;
        results.push({
          surahNumber,
          surahName,
          success: true,
          questionsGenerated: result.questionsGenerated,
        });
      } else {
        console.log(`   ❌ Failed: ${result.error}\n`);
        errorCount++;
        results.push({
          surahNumber,
          surahName,
          success: false,
          questionsGenerated: 0,
          error: result.error,
        });
      }

      // Add delay between requests (except for the last surah)
      if (surahNumber < END_SURAH) {
        await sleep(DELAY_BETWEEN_REQUESTS_MS);
      }

    } catch (error: any) {
      console.error(`   ❌ Unexpected error for Surah ${surahNumber}:`, error.message);
      errorCount++;
      results.push({
        surahNumber,
        surahName: `Surah ${surahNumber}`,
        success: false,
        questionsGenerated: 0,
        error: error.message || error.toString(),
      });
    }
  }

  // Display summary
  console.log('\n' + '='.repeat(60));
  console.log('📊 SUMMARY');
  console.log('='.repeat(60));
  console.log(`✅ Generated: ${generatedCount} new quizzes`);
  console.log(`⏭️  Skipped: ${skippedCount} existing quizzes`);
  console.log(`❌ Errors: ${errorCount} surahs`);
  console.log(`📝 Total processed: ${results.length} surahs\n`);

  // Show detailed results for errors
  if (errorCount > 0) {
    console.log('❌ Failed surahs:');
    results
      .filter(r => !r.success || r.error)
      .forEach(r => {
        console.log(`   - Surah ${r.surahNumber} (${r.surahName}): ${r.error || 'Unknown error'}`);
      });
    console.log();
  }

  // Show successful generations
  if (generatedCount > 0) {
    console.log('✅ Successfully generated quizzes:');
    results
      .filter(r => r.success && r.questionsGenerated > 0)
      .forEach(r => {
        console.log(`   - Surah ${r.surahNumber} (${r.surahName}): ${r.questionsGenerated} questions`);
      });
    console.log();
  }

  process.exit(errorCount > 0 ? 1 : 0);
}

// Run the script
main().catch((error) => {
  console.error('💥 Fatal error:', error);
  process.exit(1);
});

