import { SupabaseClient } from '@supabase/supabase-js';

interface QuizQuestion {
  type: string;
  question: string;
  options: string[];
  correct_answer: string;
  word_id: number | null;
  grammar_point: string | null;
  explanation: string;
}

interface QuizGenerationResult {
  success: boolean;
  questions?: QuizQuestion[];
  error?: string;
}

/**
 * Shuffle array using Fisher-Yates algorithm
 */
function shuffleArray<T>(array: T[]): T[] {
  const shuffled = [...array];
  for (let i = shuffled.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
  }
  return shuffled;
}

/**
 * Get random words from surah, ensuring we have enough for wrong options
 */
async function getRandomWords(
  supabase: SupabaseClient,
  surahId: number,
  count: number,
  filters?: {
    hasTranslation?: boolean;
    hasGrammarField?: string; // e.g., 'case', 'form', 'number'
  }
): Promise<any[]> {
  // Get all verses for this surah
  const { data: verses, error: versesError } = await supabase
    .from('verses')
    .select('id')
    .eq('surah_id', surahId);

  if (versesError || !verses || verses.length === 0) {
    return [];
  }

  const verseIds = verses.map(v => v.id);

  // Build query
  let query = supabase
    .from('words')
    .select('id, text_arabic, translation_english, grammar_info')
    .in('verse_id', verseIds);

  // Apply filters
  if (filters?.hasTranslation) {
    query = query.not('translation_english', 'is', null);
  }

  if (filters?.hasGrammarField) {
    // Filter for words where grammar_info contains the field
    // We'll filter in JavaScript after fetching
  }

  const { data: words, error } = await query;

  if (error || !words) {
    return [];
  }

  // Filter by grammar field if needed
  let filteredWords = words;
  if (filters?.hasGrammarField && filters.hasGrammarField) {
    const fieldName = filters.hasGrammarField;
    filteredWords = words.filter((w: any) => {
      const grammar = w.grammar_info || {};
      return grammar[fieldName] != null;
    });
  }

  // Shuffle and return requested count
  return shuffleArray(filteredWords).slice(0, count);
}

/**
 * Generate vocabulary question: "What does [arabic] mean?"
 */
function generateVocabularyQuestion(word: any, allWords: any[]): QuizQuestion {
  const wrongOptions = shuffleArray(allWords)
    .filter(w => w.id !== word.id && w.translation_english)
    .slice(0, 3)
    .map(w => w.translation_english);

  const options = shuffleArray([word.translation_english, ...wrongOptions]);

  return {
    type: 'multiple_choice',
    question: `What does the word '${word.text_arabic}' mean?`,
    options,
    correct_answer: word.translation_english,
    word_id: word.id,
    grammar_point: null,
    explanation: `'${word.text_arabic}' means '${word.translation_english}'.`
  };
}

/**
 * Generate grammar question based on grammar field
 */
function generateGrammarQuestion(
  word: any,
  grammarField: 'part_of_speech' | 'case' | 'number' | 'form',
  allWords: any[]
): QuizQuestion | null {
  const grammar = word.grammar_info || {};
  const value = grammar[grammarField];

  if (!value) {
    return null;
  }

  let questionText = '';
  let options: string[] = [];
  let explanation = '';
  let correctAnswer = '';

  switch (grammarField) {
    case 'part_of_speech':
      questionText = `What part of speech is '${word.text_arabic}'?`;
      const validPOS = ['Noun', 'Verb', 'Adjective', 'Preposition', 'Pronoun', 'Particle', 'Conjunction'];
      // Normalize value to match option format
      const posValue = typeof value === 'string'
        ? validPOS.find(pos => pos.toLowerCase() === value.toLowerCase()) || value
        : value;
      const wrongPOS = shuffleArray(validPOS.filter(pos => pos !== posValue)).slice(0, 3);
      options = shuffleArray([posValue, ...wrongPOS]);
      correctAnswer = posValue;
      explanation = `'${word.text_arabic}' is a ${posValue}.`;
      break;

    case 'case':
      questionText = `What case is '${word.text_arabic}' in?`;
      const caseOptions = ['Nominative', 'Genitive', 'Accusative'];
      // Normalize case value (database might have lowercase)
      const caseValue = typeof value === 'string'
        ? caseOptions.find(c => c.toLowerCase() === value.toLowerCase()) ||
        (value.charAt(0).toUpperCase() + value.slice(1).toLowerCase())
        : value;
      const wrongCase = shuffleArray(caseOptions.filter(c => c !== caseValue)).slice(0, 3);
      options = shuffleArray([caseValue, ...wrongCase]);
      correctAnswer = caseValue;
      explanation = `'${word.text_arabic}' is in the ${caseValue.toLowerCase()} case.`;
      break;

    case 'number':
      questionText = `What is the number of '${word.text_arabic}'?`;
      const numberOptions = ['Singular', 'Dual', 'Plural'];
      // Normalize number value (database might have lowercase)
      const numberValue = typeof value === 'string'
        ? numberOptions.find(n => n.toLowerCase() === value.toLowerCase()) ||
        (value.charAt(0).toUpperCase() + value.slice(1).toLowerCase())
        : value;
      const wrongNumber = shuffleArray(numberOptions.filter(n => n !== numberValue)).slice(0, 3);
      options = shuffleArray([numberValue, ...wrongNumber]);
      correctAnswer = numberValue;
      explanation = `'${word.text_arabic}' is ${numberValue.toLowerCase()}.`;
      break;

    case 'form':
      questionText = `What verb form is '${word.text_arabic}'?`;
      const formOptions = ['Form I', 'Form II', 'Form III', 'Form IV', 'Form V', 'Form VI', 'Form VII', 'Form VIII', 'Form IX', 'Form X'];
      const formNum = typeof value === 'number' ? value : parseInt(String(value).replace(/[^0-9]/g, '')) || 1;
      const formValue = `Form ${['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X'][Math.max(0, Math.min(9, formNum - 1))]}`;
      const wrongForm = shuffleArray(formOptions.filter(f => f !== formValue)).slice(0, 3);
      options = shuffleArray([formValue, ...wrongForm]);
      correctAnswer = formValue;
      explanation = `'${word.text_arabic}' is ${formValue}.`;
      break;
  }

  return {
    type: 'multiple_choice',
    question: questionText,
    options,
    correct_answer: correctAnswer,
    word_id: word.id,
    grammar_point: grammarField,
    explanation
  };
}

/**
 * Generate reverse translation question: "Which word means [english]?"
 */
function generateReverseTranslationQuestion(word: any, allWords: any[]): QuizQuestion {
  const wrongOptions = shuffleArray(allWords)
    .filter(w => w.id !== word.id && w.text_arabic)
    .slice(0, 3)
    .map(w => w.text_arabic);

  const options = shuffleArray([word.text_arabic, ...wrongOptions]);

  return {
    type: 'multiple_choice',
    question: `Which word means '${word.translation_english}'?`,
    options,
    correct_answer: word.text_arabic,
    word_id: word.id,
    grammar_point: null,
    explanation: `'${word.text_arabic}' means '${word.translation_english}'.`
  };
}

/**
 * Generates a quiz for a given surah using ONLY database data (no LLM/API calls)
 * Generates 10 questions: 4 vocabulary, 4 grammar, 2 reverse translation
 */
export async function generateQuizFromDatabase(
  supabase: SupabaseClient,
  surahId: number
): Promise<QuizGenerationResult> {
  try {
    // Fetch surah info
    const { data: surah, error: surahError } = await supabase
      .from('surahs')
      .select('id, surah_number, name_english, name_arabic')
      .eq('id', surahId)
      .single();

    if (surahError || !surah) {
      return {
        success: false,
        error: 'Surah not found'
      };
    }

    // Get all words with translations for wrong options
    const allWordsWithTranslation = await getRandomWords(supabase, surahId, 50, {
      hasTranslation: true
    });

    if (allWordsWithTranslation.length < 10) {
      return {
        success: false,
        error: 'Not enough words with translations in this surah'
      };
    }

    const questions: QuizQuestion[] = [];

    // 4 Vocabulary questions
    const vocabWords = await getRandomWords(supabase, surahId, 4, {
      hasTranslation: true
    });
    for (const word of vocabWords) {
      const question = generateVocabularyQuestion(word, allWordsWithTranslation);
      questions.push(question);
    }

    // 4 Grammar questions
    const grammarFields: Array<'part_of_speech' | 'case' | 'number' | 'form'> = ['part_of_speech', 'case', 'number', 'form'];
    let grammarQuestionsGenerated = 0;

    for (const field of grammarFields) {
      if (grammarQuestionsGenerated >= 4) break;

      const grammarWords = await getRandomWords(supabase, surahId, 10, {
        hasGrammarField: field
      });

      for (const word of grammarWords) {
        if (grammarQuestionsGenerated >= 4) break;
        const question = generateGrammarQuestion(word, field, allWordsWithTranslation);
        if (question) {
          questions.push(question);
          grammarQuestionsGenerated++;
        }
      }
    }

    // If we didn't get 4 grammar questions, fill with more vocabulary
    while (grammarQuestionsGenerated < 4 && questions.length < 8) {
      const extraVocabWords = await getRandomWords(supabase, surahId, 1, {
        hasTranslation: true
      });
      if (extraVocabWords.length > 0) {
        const question = generateVocabularyQuestion(extraVocabWords[0], allWordsWithTranslation);
        // Check if we already have this word
        if (!questions.some(q => q.word_id === question.word_id)) {
          questions.push(question);
          grammarQuestionsGenerated++;
        }
      } else {
        break;
      }
    }

    // 2 Reverse translation questions
    const reverseWords = await getRandomWords(supabase, surahId, 2, {
      hasTranslation: true
    });
    for (const word of reverseWords) {
      // Make sure we haven't used this word already
      if (!questions.some(q => q.word_id === word.id)) {
        const question = generateReverseTranslationQuestion(word, allWordsWithTranslation);
        questions.push(question);
      }
    }

    // Shuffle all questions
    const shuffledQuestions = shuffleArray(questions).slice(0, 10);

    // Ensure we have exactly 10 questions
    if (shuffledQuestions.length < 10) {
      return {
        success: false,
        error: `Could only generate ${shuffledQuestions.length} questions. Need at least 10 words with translations.`
      };
    }

    return {
      success: true,
      questions: shuffledQuestions
    };

  } catch (error: any) {
    console.error('Error generating quiz from database:', error);
    return {
      success: false,
      error: error.message || 'Failed to generate quiz'
    };
  }
}
