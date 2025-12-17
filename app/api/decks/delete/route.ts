import { createClient } from '@/utils/supabase/server';
import { NextRequest, NextResponse } from 'next/server';

export async function DELETE(request: NextRequest) {
  try {
    const { searchParams } = new URL(request.url);
    const deck_id = searchParams.get('id');

    if (!deck_id) {
      return NextResponse.json(
        { error: 'deck_id is required' },
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

    // Verify deck belongs to user
    const { data: deck, error: fetchError } = await supabase
      .from('decks')
      .select('id')
      .eq('id', deck_id)
      .eq('user_id', user.id)
      .single();

    if (fetchError || !deck) {
      return NextResponse.json(
        { error: 'Deck not found or access denied' },
        { status: 404 }
      );
    }

    // Delete deck (cards will be cascade deleted or set to null based on migration)
    const { error: deleteError } = await supabase
      .from('decks')
      .delete()
      .eq('id', deck_id)
      .eq('user_id', user.id);

    if (deleteError) {
      console.error('Error deleting deck:', deleteError);
      return NextResponse.json(
        { error: 'Failed to delete deck', details: deleteError.message },
        { status: 500 }
      );
    }

    return NextResponse.json({
      success: true,
      message: 'Deck deleted successfully',
    });
  } catch (error: any) {
    console.error('Error deleting deck:', error);
    return NextResponse.json(
      { error: error.message || 'Internal server error' },
      { status: 500 }
    );
  }
}

