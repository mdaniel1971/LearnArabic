// Flashcard types for the spaced repetition system

export interface Deck {
  id: string;
  user_id: string;
  name: string;
  description?: string;
  color: string;
  created_at: string;
  updated_at: string;
}

export interface Flashcard {
  id: string;
  user_id: string;
  word_id: number;
  deck_id: string | null;
  ease_factor: number;
  interval_days: number;
  repetitions: number;
  next_review_date: string; // ISO date string
  created_at: string;
  updated_at: string;
  // Stored word details (snapshot at creation time)
  word_text_arabic?: string;
  word_transliteration?: string;
  word_translation_english?: string;
  word_grammar_info?: any;
  word_details_text?: string; // Formatted string like "Verb: form 1, perfect, active, first-person singular, past tense"
  // Joined data from words table (fallback for old flashcards)
  word?: {
    text_arabic: string;
    transliteration: string;
    translation_english: string;
    grammar_info: any;
  };
  // Joined data from decks table
  deck?: Deck;
}

export interface ReviewHistory {
  id: string;
  flashcard_id: string;
  user_id: string;
  difficulty: 'hard' | 'medium' | 'easy';
  ease_factor_before: number;
  ease_factor_after: number;
  interval_before: number;
  interval_after: number;
  repetitions_before: number;
  repetitions_after: number;
  reviewed_at: string;
}

export interface FlashcardStats {
  total_cards: number;
  due_today: number;
  reviewed_today: number;
  mastered_cards: number; // Cards with interval > 30 days
  new_cards: number; // Cards with repetitions = 0
  average_ease_factor: number;
}

export interface ReviewSession {
  cards: Flashcard[];
  currentIndex: number;
  sessionStartTime: Date;
  reviewsCompleted: number;
}

export type Difficulty = 'hard' | 'medium' | 'easy';

