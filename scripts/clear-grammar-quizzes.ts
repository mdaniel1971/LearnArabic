/**
 * Script to clear all grammar quiz questions from the database
 * This preserves quiz history and user progress (quiz_attempts and quiz_questions tables)
 * Only deletes from quiz_bank table where grammar_point is not null
 */

// @ts-nocheck
import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
import { resolve } from 'path';

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

async function clearGrammarQuizzes() {
  try {
    console.log('🗑️  Clearing grammar quiz questions from quiz_bank...\n');

    // Count grammar questions first
    const { count: grammarCount, error: countError } = await supabase
      .from('quiz_bank')
      .select('*', { count: 'exact', head: true })
      .not('grammar_point', 'is', null);

    if (countError) {
      throw countError;
    }

    console.log(`📊 Found ${grammarCount || 0} grammar questions to delete\n`);

    if (grammarCount === 0) {
      console.log('✅ No grammar questions found. Nothing to delete.');
      return;
    }

    // Delete grammar questions (where grammar_point is not null)
    const { data: deleted, error: deleteError } = await supabase
      .from('quiz_bank')
      .delete()
      .not('grammar_point', 'is', null)
      .select();

    if (deleteError) {
      throw deleteError;
    }

    console.log(`✅ Successfully deleted ${deleted?.length || 0} grammar questions`);
    console.log('\n📝 Note: Quiz history (quiz_attempts and quiz_questions) has been preserved.');
    console.log('   Only quiz_bank questions were deleted.\n');

  } catch (error: any) {
    console.error('❌ Error clearing grammar quizzes:', error.message);
    process.exit(1);
  }
}

clearGrammarQuizzes();

