import { createClient } from '@/utils/supabase/server';
import { NextRequest, NextResponse } from 'next/server';
import { getInitialSM2Params } from '@/utils/sm2-algorithm';
import { formatWordDetails } from '@/utils/word-details-formatter';

export async function POST(request: NextRequest) {
  try {
    const { word_id, deck_id } = await request.json();

    if (!word_id) {
      return NextResponse.json(
        { error: 'word_id is required' },
        { status: 400 }
      );
    }

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

    // Check if word exists
    const { data: word, error: wordError } = await supabase
      .from('words')
      .select('id, text_arabic, transliteration, translation_english, grammar_info')
      .eq('id', word_id)
      .single();

    if (wordError || !word) {
      return NextResponse.json(
        { error: 'Word not found' },
        { status: 404 }
      );
    }

    // Verify deck belongs to user
    const { data: deck, error: deckError } = await supabase
      .from('decks')
      .select('id')
      .eq('id', deck_id)
      .eq('user_id', user.id)
      .single();

    if (deckError || !deck) {
      return NextResponse.json(
        { error: 'Deck not found or access denied' },
        { status: 404 }
      );
    }

    // Check if flashcard already exists for this word (in any deck)
    const { data: existingCard } = await supabase
      .from('flashcards')
      .select('id, deck_id')
      .eq('user_id', user.id)
      .eq('word_id', word_id)
      .single();

    if (existingCard) {
      return NextResponse.json(
        { error: 'Flashcard already exists for this word', flashcard_id: existingCard.id, deck_id: existingCard.deck_id },
        { status: 409 }
      );
    }

    // Get initial SM-2 parameters
    const initialParams = getInitialSM2Params();
    // Make new cards available for review immediately (set to yesterday to ensure it's due)
    // Use UTC date to avoid timezone issues
    const yesterday = new Date();
    yesterday.setDate(yesterday.getDate() - 1);
    const yesterdayStr = yesterday.toISOString().split('T')[0]; // Format: YYYY-MM-DD

    // Format word details string
    const wordDetailsText = formatWordDetails(word.grammar_info);

    // Create flashcard with all word details stored
    const { data: flashcard, error: insertError } = await supabase
      .from('flashcards')
      .insert({
        user_id: user.id,
        word_id: word_id,
        deck_id: deck_id,
        ease_factor: initialParams.easeFactor,
        interval_days: initialParams.interval,
        repetitions: initialParams.repetitions,
        next_review_date: yesterdayStr,
        // Store word details snapshot
        word_text_arabic: word.text_arabic,
        word_transliteration: word.transliteration,
        word_translation_english: word.translation_english,
        word_grammar_info: word.grammar_info,
        word_details_text: wordDetailsText,
      })
      .select()
      .single();

    if (insertError) {
      console.error('Error creating flashcard:', insertError);
      return NextResponse.json(
        { error: 'Failed to create flashcard', details: insertError.message },
        { status: 500 }
      );
    }

    return NextResponse.json({
      success: true,
      flashcard: {
        ...flashcard,
        word: {
          text_arabic: word.text_arabic,
          transliteration: word.transliteration,
          translation_english: word.translation_english,
          grammar_info: word.grammar_info,
        },
      },
    });
  } catch (error: any) {
    console.error('Error creating flashcard:', error);
    return NextResponse.json(
      { error: error.message || 'Internal server error' },
      { status: 500 }
    );
  }
}

