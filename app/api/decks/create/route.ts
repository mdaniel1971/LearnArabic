import { createClient } from '@/utils/supabase/server';
import { NextRequest, NextResponse } from 'next/server';

export async function POST(request: NextRequest) {
  try {
    const { name, description, color } = await request.json();

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

    // Check if deck with same name already exists for this user
    const { data: existingDeck } = await supabase
      .from('decks')
      .select('id')
      .eq('user_id', user.id)
      .eq('name', name.trim())
      .single();

    if (existingDeck) {
      return NextResponse.json(
        { error: 'A deck with this name already exists' },
        { status: 409 }
      );
    }

    // Create deck
    const { data: deck, error: insertError } = await supabase
      .from('decks')
      .insert({
        user_id: user.id,
        name: name.trim(),
        description: description?.trim() || null,
        color: color || '#3B82F6',
      })
      .select()
      .single();

    if (insertError) {
      console.error('Error creating deck:', insertError);
      return NextResponse.json(
        { error: 'Failed to create deck', details: insertError.message },
        { status: 500 }
      );
    }

    return NextResponse.json({
      success: true,
      deck,
    });
  } catch (error: any) {
    console.error('Error creating deck:', error);
    return NextResponse.json(
      { error: error.message || 'Internal server error' },
      { status: 500 }
    );
  }
}

