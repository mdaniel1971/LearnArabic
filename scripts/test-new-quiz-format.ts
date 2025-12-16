/**
 * Script to test the new quiz format by generating a quiz for one surah
 * Usage: npx tsx scripts/test-new-quiz-format.ts [surah_number]
 * Default: tests with Surah 1 (Al-Fatiha)
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

async function testNewQuizFormat() {
  try {
    const surahNumber = parseInt(process.argv[2]) || 1;
    
    console.log(`🧪 Testing new quiz format for Surah ${surahNumber}...\n`);

    // Get surah ID
    const { data: surah, error: surahError } = await supabase
      .from('surahs')
      .select('id, name_english, name_arabic')
      .eq('surah_number', surahNumber)
      .single();

    if (surahError || !surah) {
      throw new Error(`Surah ${surahNumber} not found: ${surahError?.message || 'Unknown error'}`);
    }

    console.log(`📖 Generating quiz for: ${surah.name_english} (${surah.name_arabic})\n`);

    // Generate quiz
    const result = await generateQuizForSurah(supabase, surah.id);

    if (!result.success) {
      throw new Error(result.error || 'Failed to generate quiz');
    }

    console.log(`✅ Successfully generated ${result.questionsGenerated} questions\n`);

    // Fetch and display grammar questions
    const { data: questions, error: fetchError } = await supabase
      .from('quiz_bank')
      .select('*')
      .eq('surah_id', surah.id)
      .not('grammar_point', 'is', null)
      .order('created_at', { ascending: true });

    if (fetchError) {
      throw fetchError;
    }

    console.log(`\n📋 Grammar Questions Generated (${questions?.length || 0}):\n`);
    questions?.forEach((q, index) => {
      console.log(`${index + 1}. ${q.question_text}`);
      console.log(`   Options: ${(q.options as string[]).join(', ')}`);
      console.log(`   Correct: ${q.correct_answer}`);
      console.log(`   Grammar Point: ${q.grammar_point}`);
      console.log('');
    });

    console.log('✅ Test completed successfully!');
    console.log('\n💡 Review the grammar questions above to verify the new format.');
    console.log('   If they look good, you can proceed with bulk regeneration.\n');

  } catch (error: any) {
    console.error('❌ Error testing new quiz format:', error.message);
    process.exit(1);
  }
}

testNewQuizFormat();

