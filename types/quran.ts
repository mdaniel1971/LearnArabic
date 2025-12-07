/**
 * TypeScript type definitions for Quran content database schema
 */

export interface Surah {
  id: number;
  surah_number: number;
  name_arabic: string;
  name_english: string;
  total_verses: number;
  created_at: string;
  updated_at: string;
}

export interface Verse {
  id: number;
  surah_id: number;
  verse_number: number;
  text_arabic: string;
  created_at: string;
  updated_at: string;
}

export interface GrammarInfo {
  part_of_speech: string;
  case?: 'nominative' | 'accusative' | 'genitive';
  definiteness?: 'definite' | 'indefinite';
  number?: 'singular' | 'dual' | 'plural';
  gender?: 'masculine' | 'feminine';
  person?: 'first' | 'second' | 'third';
  tense?: 'past' | 'present' | 'imperative' | 'future';
  mood?: 'indicative' | 'subjunctive' | 'jussive' | 'imperative';
  form?: string;
  type?: string;
  preposition?: string;
  noun?: string;
  conjunction?: string;
  negative?: string;
  pronoun?: string;
  notes?: string;
  [key: string]: any; // Allow additional grammar fields
}

export interface Word {
  id: number;
  verse_id: number;
  word_position: number;
  text_arabic: string;
  transliteration: string | null;
  translation_english: string | null;
  grammar_info: GrammarInfo | null;
  created_at: string;
  updated_at: string;
}

/**
 * Extended types that include related data
 */

export interface VerseWithWords extends Verse {
  words: Word[];
}

export interface SurahWithVerses extends Surah {
  verses: Verse[];
}

export interface SurahWithVersesAndWords extends Surah {
  verses: VerseWithWords[];
}

/**
 * Database insert types (without auto-generated fields)
 */

export interface SurahInsert {
  surah_number: number;
  name_arabic: string;
  name_english: string;
  total_verses: number;
}

export interface VerseInsert {
  surah_id: number;
  verse_number: number;
  text_arabic: string;
}

export interface WordInsert {
  verse_id: number;
  word_position: number;
  text_arabic: string;
  transliteration?: string | null;
  translation_english?: string | null;
  grammar_info?: GrammarInfo | null;
}

/**
 * Database update types (all fields optional except id)
 */

export interface SurahUpdate {
  surah_number?: number;
  name_arabic?: string;
  name_english?: string;
  total_verses?: number;
}

export interface VerseUpdate {
  surah_id?: number;
  verse_number?: number;
  text_arabic?: string;
}

export interface WordUpdate {
  verse_id?: number;
  word_position?: number;
  text_arabic?: string;
  transliteration?: string | null;
  translation_english?: string | null;
  grammar_info?: GrammarInfo | null;
}

/**
 * Quiz-related types
 */

export interface QuizAttempt {
  id: string;
  user_id: string;
  surah_id: number;
  score: number;
  total_questions: number;
  completed_at: string;
  created_at: string;
}

export interface QuizQuestion {
  id: string;
  attempt_id: string;
  question_text: string;
  question_type: 'multiple_choice' | 'fill_blank';
  correct_answer: string;
  user_answer: string | null;
  is_correct: boolean;
  word_id: number | null;
  grammar_point: string | null;
  options: string[] | null;
  created_at: string;
}

export interface QuizBank {
  id: string;
  surah_id: number;
  question_text: string;
  question_type: 'multiple_choice' | 'fill_blank';
  correct_answer: string;
  word_id: number | null;
  grammar_point: string | null;
  options: string[] | null;
  explanation: string | null;
  created_at: string;
}

