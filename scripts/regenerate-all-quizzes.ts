/**
 * Script to regenerate all quizzes with the new learner-friendly format
 * This will regenerate quizzes for all surahs that have existing quizzes
 * 
 * Usage: npx tsx scripts/regenerate-all-quizzes.ts
 * 
 * Note: This preserves quiz history (quiz_attempts and quiz_questions tables)
 * Only regenerates questions in quiz_bank table
 */

// @ts-nocheck
import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
import { resolve } from 'path';
import { generateQuizForSurah } from '../utils/quiz-generation';

// Load environment variables
dotenv.config({ path: resolve(process.cwd(), '.env.local') });

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

function sleep(ms: number) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function regenerateAllQuizzes() {
  try {
    console.log('🔄 Regenerating all quizzes with new learner-friendly format...\n');

    // Get all surahs that have existing quizzes
    const { data: surahsWithQuizzes, error: surahError } = await supabase
      .from('quiz_bank')
      .select('surah_id, surahs!inner(surah_number, name_english, name_arabic)')
      .order('surah_id', { ascending: true });

    if (surahError) {
      throw surahError;
    }

    // Get unique surah IDs
    const uniqueSurahs = new Map();
    surahsWithQuizzes?.forEach((item: any) => {
      const surah = item.surahs;
      if (!uniqueSurahs.has(item.surah_id)) {
        uniqueSurahs.set(item.surah_id, {
          id: item.surah_id,
          surah_number: surah.surah_number,
          name_english: surah.name_english,
          name_arabic: surah.name_arabic
        });
      }
    });

    const surahs = Array.from(uniqueSurahs.values());
    console.log(`📊 Found ${surahs.length} surahs with existing quizzes\n`);

    if (surahs.length === 0) {
      console.log('⚠️  No surahs with existing quizzes found.');
      console.log('   Run the test script first or generate quizzes manually.\n');
      return;
    }

    let successCount = 0;
    let errorCount = 0;
    const errors: Array<{ surah: string; error: string }> = [];

    for (let i = 0; i < surahs.length; i++) {
      const surah = surahs[i];
      console.log(`[${i + 1}/${surahs.length}] Generating quiz for Surah ${surah.surah_number} - ${surah.name_english}...`);

      try {
        const result = await generateQuizForSurah(supabase, surah.id);

        if (result.success) {
          console.log(`   ✅ Generated ${result.questionsGenerated} questions`);
          successCount++;
        } else {
          console.log(`   ❌ Failed: ${result.error}`);
          errorCount++;
          errors.push({ surah: `${surah.surah_number} - ${surah.name_english}`, error: result.error || 'Unknown error' });
        }
      } catch (error: any) {
        console.log(`   ❌ Error: ${error.message}`);
        errorCount++;
        errors.push({ surah: `${surah.surah_number} - ${surah.name_english}`, error: error.message });
      }

      // Rate limiting: wait 2 seconds between requests
      if (i < surahs.length - 1) {
        await sleep(2000);
      }
    }

    // Summary
    console.log('\n' + '='.repeat(60));
    console.log('📊 REGENERATION SUMMARY');
    console.log('='.repeat(60));
    console.log(`✅ Successfully regenerated: ${successCount} surahs`);
    console.log(`❌ Failed: ${errorCount} surahs`);

    if (errors.length > 0) {
      console.log('\n❌ Errors:');
      errors.forEach(({ surah, error }) => {
        console.log(`   - ${surah}: ${error}`);
      });
    }

    console.log('\n✅ Regeneration complete!\n');

  } catch (error: any) {
    console.error('❌ Error regenerating quizzes:', error.message);
    process.exit(1);
  }
}

regenerateAllQuizzes();

