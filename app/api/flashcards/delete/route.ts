import { createClient } from '@/utils/supabase/server';
import { NextRequest, NextResponse } from 'next/server';

export async function DELETE(request: NextRequest) {
  try {
    const { searchParams } = new URL(request.url);
    const flashcard_id = searchParams.get('id');

    if (!flashcard_id) {
      return NextResponse.json(
        { error: 'flashcard_id is required' },
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

    // Verify flashcard belongs to user
    const { data: flashcard, error: fetchError } = await supabase
      .from('flashcards')
      .select('id')
      .eq('id', flashcard_id)
      .eq('user_id', user.id)
      .single();

    if (fetchError || !flashcard) {
      return NextResponse.json(
        { error: 'Flashcard not found' },
        { status: 404 }
      );
    }

    // Delete flashcard (review_history will be cascade deleted)
    const { error: deleteError } = await supabase
      .from('flashcards')
      .delete()
      .eq('id', flashcard_id)
      .eq('user_id', user.id);

    if (deleteError) {
      console.error('Error deleting flashcard:', deleteError);
      return NextResponse.json(
        { error: 'Failed to delete flashcard', details: deleteError.message },
        { status: 500 }
      );
    }

    return NextResponse.json({
      success: true,
      message: 'Flashcard deleted successfully',
    });
  } catch (error: any) {
    console.error('Error deleting flashcard:', error);
    return NextResponse.json(
      { error: error.message || 'Internal server error' },
      { status: 500 }
    );
  }
}

