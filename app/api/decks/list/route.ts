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

    // Get all decks for user
    const { data: decks, error } = await supabase
      .from('decks')
      .select('*')
      .eq('user_id', user.id)
      .order('created_at', { ascending: false });

    if (error) {
      console.error('Error fetching decks:', error);
      return NextResponse.json(
        { error: 'Failed to fetch decks', details: error.message },
        { status: 500 }
      );
    }

    return NextResponse.json({
      success: true,
      decks: decks || [],
    });
  } catch (error: any) {
    console.error('Error listing decks:', error);
    return NextResponse.json(
      { error: error.message || 'Internal server error' },
      { status: 500 }
    );
  }
}

