import { createClient } from '@/utils/supabase/server';
import { NextRequest, NextResponse } from 'next/server';

export async function PUT(request: NextRequest) {
  try {
    const { deck_id, name, description, color } = await request.json();

    if (!deck_id) {
      return NextResponse.json(
        { error: 'deck_id is required' },
        { status: 400 }
      );
    }

    if (!name || name.trim() === '') {
      return NextResponse.json(
        { error: 'Deck name is required' },
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
    const { data: existingDeck, error: fetchError } = await supabase
      .from('decks')
      .select('id')
      .eq('id', deck_id)
      .eq('user_id', user.id)
      .single();

    if (fetchError || !existingDeck) {
      return NextResponse.json(
        { error: 'Deck not found or access denied' },
        { status: 404 }
      );
    }

    // Check if another deck with the same name exists (excluding current deck)
    const { data: duplicateDeck } = await supabase
      .from('decks')
      .select('id')
      .eq('user_id', user.id)
      .eq('name', name.trim())
      .neq('id', deck_id)
      .single();

    if (duplicateDeck) {
      return NextResponse.json(
        { error: 'A deck with this name already exists' },
        { status: 409 }
      );
    }

    // Update deck
    const updateData: any = {
      name: name.trim(),
    };

    if (description !== undefined) {
      updateData.description = description?.trim() || null;
    }

    if (color !== undefined) {
      updateData.color = color;
    }

    const { data: deck, error: updateError } = await supabase
      .from('decks')
      .update(updateData)
      .eq('id', deck_id)
      .eq('user_id', user.id)
      .select()
      .single();

    if (updateError) {
      console.error('Error updating deck:', updateError);
      return NextResponse.json(
        { error: 'Failed to update deck', details: updateError.message },
        { status: 500 }
      );
    }

    return NextResponse.json({
      success: true,
      deck,
    });
  } catch (error: any) {
    console.error('Error updating deck:', error);
    return NextResponse.json(
      { error: error.message || 'Internal server error' },
      { status: 500 }
    );
  }
}

