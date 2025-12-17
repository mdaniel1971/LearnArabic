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

    // Get query parameters
    const { searchParams } = new URL(request.url);
    const dueOnly = searchParams.get('due_only') === 'true';
    const deckId = searchParams.get('deck_id');
    const limit = parseInt(searchParams.get('limit') || '100');
    const offset = parseInt(searchParams.get('offset') || '0');

    // Build query - use stored word details if available, otherwise join with words table
    let query = supabase
      .from('flashcards')
      .select(`
        *,
        words (
          id,
          text_arabic,
          transliteration,
          translation_english,
          grammar_info
        ),
        decks (
          id,
          name,
          description,
          color
        )
      `)
      .eq('user_id', user.id)
      .order('next_review_date', { ascending: true })
      .order('created_at', { ascending: false })
      .range(offset, offset + limit - 1);

    // Filter by deck if specified
    if (deckId) {
      query = query.eq('deck_id', deckId);
    }

    // Filter for due cards only
    if (dueOnly) {
      const today = new Date();
      today.setHours(0, 0, 0, 0);
      const todayStr = today.toISOString().split('T')[0];
      query = query.lte('next_review_date', todayStr);
    }

    const { data: flashcards, error } = await query;

    if (error) {
      console.error('Error fetching flashcards:', error);
      return NextResponse.json(
        { error: 'Failed to fetch flashcards', details: error.message },
        { status: 500 }
      );
    }

    // Normalize the response: Use stored word details if available, otherwise use joined data
    const normalizedFlashcards = (flashcards || []).map((card: any) => {
      // Prefer stored word details (snapshot), fall back to joined word data
      let word = null;
      if (card.word_text_arabic) {
        // Use stored snapshot
        word = {
          text_arabic: card.word_text_arabic,
          transliteration: card.word_transliteration,
          translation_english: card.word_translation_english,
          grammar_info: card.word_grammar_info,
        };
      } else {
        // Fall back to joined data (for backward compatibility with old flashcards)
        if (Array.isArray(card.words) && card.words.length > 0) {
          word = card.words[0];
        } else if (card.words && !Array.isArray(card.words)) {
          word = card.words;
        } else if (card.word) {
          word = card.word;
        }
      }

      // Handle decks: Supabase returns as array, but we want a single object
      let deck = null;
      if (Array.isArray(card.decks) && card.decks.length > 0) {
        deck = card.decks[0];
      } else if (card.decks && !Array.isArray(card.decks)) {
        deck = card.decks;
      } else if (card.deck) {
        deck = card.deck;
      }

      // Return normalized card without the array versions
      const { words, decks, ...rest } = card;
      return {
        ...rest,
        word,
        deck,
        // Include word_details_text for easy access
        word_details_text: card.word_details_text,
      };
    });

    return NextResponse.json({
      success: true,
      flashcards: normalizedFlashcards,
      count: normalizedFlashcards.length,
    });
  } catch (error: any) {
    console.error('Error listing flashcards:', error);
    return NextResponse.json(
      { error: error.message || 'Internal server error' },
      { status: 500 }
    );
  }
}

