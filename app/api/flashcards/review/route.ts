import { createClient } from '@/utils/supabase/server';
import { NextRequest, NextResponse } from 'next/server';
import { calculateSM2 } from '@/utils/sm2-algorithm';

export async function POST(request: NextRequest) {
  try {
    const { flashcard_id, difficulty } = await request.json();

    if (!flashcard_id || !difficulty) {
      return NextResponse.json(
        { error: 'flashcard_id and difficulty are required' },
        { status: 400 }
      );
    }

    if (!['hard', 'medium', 'easy'].includes(difficulty)) {
      return NextResponse.json(
        { error: 'difficulty must be "hard", "medium", or "easy"' },
        { status: 400 }
      );
    }

    const supabase = await createClient();

    // Verify user is authenticated
    const { data: { user }, error: userError } = await supabase.auth.getUser();
    if (userError || !user) {
      return NextResponse.json(
        { error: 'Authentication required' },
        { status: 401 }
      );
    }

    // Get current flashcard
    const { data: flashcard, error: fetchError } = await supabase
      .from('flashcards')
      .select('*')
      .eq('id', flashcard_id)
      .eq('user_id', user.id)
      .single();

    if (fetchError || !flashcard) {
      return NextResponse.json(
        { error: 'Flashcard not found' },
        { status: 404 }
      );
    }

    // Store values before update
    const beforeValues = {
      ease_factor: flashcard.ease_factor,
      interval_days: flashcard.interval_days,
      repetitions: flashcard.repetitions,
    };

    // Calculate new SM-2 parameters
    const sm2Result = calculateSM2(
      {
        easeFactor: flashcard.ease_factor,
        interval: flashcard.interval_days,
        repetitions: flashcard.repetitions,
      },
      difficulty as 'hard' | 'medium' | 'easy'
    );

    // Update flashcard
    const { data: updatedFlashcard, error: updateError } = await supabase
      .from('flashcards')
      .update({
        ease_factor: sm2Result.easeFactor,
        interval_days: sm2Result.interval,
        repetitions: sm2Result.repetitions,
        next_review_date: sm2Result.nextReviewDate.toISOString().split('T')[0],
      })
      .eq('id', flashcard_id)
      .select()
      .single();

    if (updateError) {
      console.error('Error updating flashcard:', updateError);
      return NextResponse.json(
        { error: 'Failed to update flashcard', details: updateError.message },
        { status: 500 }
      );
    }

    // Create review history entry
    const { error: historyError } = await supabase
      .from('review_history')
      .insert({
        flashcard_id: flashcard_id,
        user_id: user.id,
        difficulty: difficulty,
        ease_factor_before: beforeValues.ease_factor,
        ease_factor_after: sm2Result.easeFactor,
        interval_before: beforeValues.interval_days,
        interval_after: sm2Result.interval,
        repetitions_before: beforeValues.repetitions,
        repetitions_after: sm2Result.repetitions,
      });

    if (historyError) {
      console.error('Error creating review history:', historyError);
      // Don't fail the request if history fails, but log it
    }

    return NextResponse.json({
      success: true,
      flashcard: updatedFlashcard,
      review_result: {
        difficulty,
        ease_factor_change: sm2Result.easeFactor - beforeValues.ease_factor,
        interval_change: sm2Result.interval - beforeValues.interval_days,
        next_review_date: sm2Result.nextReviewDate.toISOString().split('T')[0],
      },
    });
  } catch (error: any) {
    console.error('Error reviewing flashcard:', error);
    return NextResponse.json(
      { error: error.message || 'Internal server error' },
      { status: 500 }
    );
  }
}

