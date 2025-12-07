import { createClient } from '@/utils/supabase/server';
import { NextRequest, NextResponse } from 'next/server';

export async function POST(request: NextRequest) {
  try {
    const { surahId, answers } = await request.json();
    // answers is array of { questionId, userAnswer }
    
    const supabase = await createClient();
    
    // Get current user
    const { data: { user }, error: userError } = await supabase.auth.getUser();
    if (userError || !user) {
      return NextResponse.json({ error: 'Not authenticated' }, { status: 401 });
    }

    // Fetch questions from quiz_bank
    const { data: questions, error: questionsError } = await supabase
      .from('quiz_bank')
      .select('*')
      .eq('surah_id', surahId);

    if (questionsError) throw questionsError;
    if (!questions || questions.length === 0) {
      throw new Error('No questions found for this surah');
    }

    // Delete old quiz attempts for this surah and user (keep only latest)
    const { error: deleteError } = await supabase
      .from('quiz_attempts')
      .delete()
      .eq('user_id', user.id)
      .eq('surah_id', surahId);

    if (deleteError) {
      console.warn('Warning: Could not delete old quiz attempts:', deleteError);
      // Continue anyway - this is not critical
    }

    // Grade answers
    let correctCount = 0;
    const gradedQuestions = answers.map((answer: any) => {
      const question = questions.find((q: any) => q.id === answer.questionId);
      if (!question) {
        return {
          question_text: 'Question not found',
          question_type: 'multiple_choice',
          correct_answer: '',
          user_answer: answer.userAnswer,
          is_correct: false,
          word_id: null,
          grammar_point: null,
          options: null,
          explanation: null
        };
      }
      
      // Improved answer matching - handles synonyms
      const normalizedUser = answer.userAnswer.trim().toLowerCase();
      const normalizedCorrect = question.correct_answer.trim().toLowerCase();
      
      let isCorrect = normalizedUser === normalizedCorrect;
      
      // Check for common synonyms if not exact match
      if (!isCorrect) {
        const synonymGroups: Record<string, string[]> = {
          'master of': ['owner of', 'possessor of', 'ruler of'],
          'owner of': ['master of', 'possessor of', 'ruler of'],
          'possessor of': ['master of', 'owner of', 'ruler of'],
          'ruler of': ['master of', 'owner of', 'possessor of'],
          'the most merciful': ['the merciful', 'most merciful'],
          'the merciful': ['the most merciful', 'most merciful'],
        };
        
        // Check if answers are in the same synonym group
        for (const [key, synonyms] of Object.entries(synonymGroups)) {
          const userMatches = normalizedUser.includes(key) || synonyms.some(syn => normalizedUser.includes(syn));
          const correctMatches = normalizedCorrect.includes(key) || synonyms.some(syn => normalizedCorrect.includes(syn));
          
          if (userMatches && correctMatches) {
            isCorrect = true;
            break;
          }
        }
      }
      if (isCorrect) correctCount++;

      return {
        question_text: question.question_text,
        question_type: question.question_type,
        correct_answer: question.correct_answer,
        user_answer: answer.userAnswer,
        is_correct: isCorrect,
        word_id: question.word_id,
        grammar_point: question.grammar_point,
        options: question.options,
        explanation: question.explanation // Include for results display, but don't insert into quiz_questions
      };
    });

    // Create quiz attempt
    const { data: attempt, error: attemptError } = await supabase
      .from('quiz_attempts')
      .insert({
        user_id: user.id,
        surah_id: surahId,
        score: correctCount,
        total_questions: 10
      })
      .select()
      .single();

    if (attemptError) throw attemptError;

    // Insert graded questions (exclude explanation since quiz_questions table doesn't have it)
    const questionsToInsert = gradedQuestions.map((q: any) => {
      const { explanation, ...questionData } = q; // Remove explanation
      return {
        ...questionData,
        attempt_id: attempt.id
      };
    });

    const { error: questionsInsertError } = await supabase
      .from('quiz_questions')
      .insert(questionsToInsert);

    if (questionsInsertError) throw questionsInsertError;

    return NextResponse.json({
      success: true,
      attemptId: attempt.id,
      score: correctCount,
      totalQuestions: 10,
      results: gradedQuestions
    });

  } catch (error: any) {
    console.error('Error submitting quiz:', error);
    console.error('Error details:', {
      message: error.message,
      code: error.code,
      details: error.details,
      hint: error.hint
    });
    return NextResponse.json({ 
      error: error.message || 'Failed to submit quiz',
      details: error.details || error.toString()
    }, { status: 500 });
  }
}

