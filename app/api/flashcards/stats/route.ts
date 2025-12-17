import { createClient } from '@/utils/supabase/server';
import { NextRequest, NextResponse } from 'next/server';

export async function GET(request: NextRequest) {
  try {
    const supabase = await createClient();

    // Verify user is authenticated
    const { data: { user }, error: userError } = await supabase.auth.getUser();
    if (userError || !user) {
      return NextResponse.json(
        { error: 'Authentication required' },
        { status: 401 }
      );
    }

    // Use consistent date format for comparison
    const today = new Date();
    const todayStr = today.toISOString().split('T')[0]; // Format: YYYY-MM-DD
    const startOfToday = new Date();
    startOfToday.setHours(0, 0, 0, 0);
    const startOfTodayISO = startOfToday.toISOString();

    // Get total cards
    const { count: totalCards } = await supabase
      .from('flashcards')
      .select('*', { count: 'exact', head: true })
      .eq('user_id', user.id);

    // Get cards due today
    const { count: dueToday } = await supabase
      .from('flashcards')
      .select('*', { count: 'exact', head: true })
      .eq('user_id', user.id)
      .lte('next_review_date', todayStr);

    // Get cards reviewed today
    const { count: reviewedToday } = await supabase
      .from('review_history')
      .select('*', { count: 'exact', head: true })
      .eq('user_id', user.id)
      .gte('reviewed_at', startOfTodayISO);

    // Get mastered cards (interval > 30 days)
    const { count: masteredCards } = await supabase
      .from('flashcards')
      .select('*', { count: 'exact', head: true })
      .eq('user_id', user.id)
      .gt('interval_days', 30);

    // Get new cards (repetitions = 0)
    const { count: newCards } = await supabase
      .from('flashcards')
      .select('*', { count: 'exact', head: true })
      .eq('user_id', user.id)
      .eq('repetitions', 0);

    // Get average ease factor
    const { data: easeFactors } = await supabase
      .from('flashcards')
      .select('ease_factor')
      .eq('user_id', user.id);

    const averageEaseFactor = easeFactors && easeFactors.length > 0
      ? easeFactors.reduce((sum, card) => sum + parseFloat(card.ease_factor.toString()), 0) / easeFactors.length
      : 0;

    return NextResponse.json({
      success: true,
      stats: {
        total_cards: totalCards || 0,
        due_today: dueToday || 0,
        reviewed_today: reviewedToday || 0,
        mastered_cards: masteredCards || 0,
        new_cards: newCards || 0,
        average_ease_factor: Math.round(averageEaseFactor * 100) / 100,
      },
    });
  } catch (error: any) {
    console.error('Error fetching flashcard stats:', error);
    return NextResponse.json(
      { error: error.message || 'Internal server error' },
      { status: 500 }
    );
  }
}

