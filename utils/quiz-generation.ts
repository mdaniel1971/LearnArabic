import { SupabaseClient } from '@supabase/supabase-js';
import { generateJSONWithGemini } from '@/lib/gemini';

interface QuizGenerationResult {
  success: boolean;
  questionsGenerated: number;
  error?: string;
}

// Export the interface for use in scripts
export type { QuizGenerationResult };

/**
 * Generates a quiz for a given surah
 * This is the core quiz generation logic extracted from the API route
 */
export async function generateQuizForSurah(
  supabase: any,
  surahId: number
): Promise<QuizGenerationResult> {
  try {
    if (!process.env.GOOGLE_GEMINI_API_KEY) {
      return {
        success: false,
        questionsGenerated: 0,
        error: 'GOOGLE_GEMINI_API_KEY is not configured'
      };
    }

    // Fetch surah data with all words
    const { data: surahData, error: surahError } = await supabase
      .from('surahs')
      .select(`
        id,
        surah_number,
        name_english,
        name_arabic,
        verses (
          id,
          verse_number,
          text_arabic,
          words (
            id,
            word_position,
            text_arabic,
            transliteration,
            translation_english,
            grammar_info
          )
        )
      `)
      .eq('id', surahId)
      .single();

    if (surahError) throw surahError;
    if (!surahData) throw new Error('Surah not found');

    // Prepare data for LLM with explicit word IDs
    const wordsData = surahData.verses?.flatMap((v: any) => v.words || []) || [];

    // Build verse context with translations for grammar questions
    const verseContexts = surahData.verses?.map((v: any) => {
      const verseWords = v.words || [];
      const verseTranslation = verseWords
        .sort((a: any, b: any) => a.word_position - b.word_position)
        .map((w: any) => w.translation_english || '')
        .filter((t: string) => t)
        .join(' ');
      return {
        verse_number: v.verse_number,
        text_arabic: v.text_arabic,
        translation: verseTranslation,
        words: verseWords
      };
    }) || [];

    const prompt = `You are creating a 10-question quiz for Surah ${surahData.name_english} (${surahData.name_arabic}) to test Quranic Arabic comprehension.

Available words and their data (use the word_id number for word meaning questions):
${wordsData.map((w: any) => `- word_id: ${w.id}, Arabic: ${w.text_arabic} (${w.transliteration || 'N/A'}): ${w.translation_english || 'N/A'}${w.grammar_info ? `, Grammar: ${JSON.stringify(w.grammar_info)}` : ''}`).join('\n')}

Verse context (Arabic text with English translation):
${verseContexts.map((v: any) => `Verse ${v.verse_number}: ${v.text_arabic} (${v.translation || 'translation not available'})`).join('\n') || ''}

Create EXACTLY 10 questions with this distribution:
- 4 word meaning questions (multiple choice) - test Arabic word → English meaning
- 3 grammar questions (multiple choice) - test understanding of word types, cases, grammatical roles
- 2 phrase translation questions (multiple choice) - test translation of 2-3 word phrases
- 1 comprehension question (multiple choice) - test overall understanding of a verse

CRITICAL: For grammar questions, you MUST use this NEW LEARNER-FRIENDLY FORMAT:

OLD FORMAT (DO NOT USE):
❌ "What is the grammatical number of the word ٱلۡكَوَاكِبُ?"
❌ "What grammatical case is 'الرَّحِيمِ' in?"
❌ "In the phrase 'بِسۡمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ', the word اللَّهِ is:" (MISSING ENGLISH TRANSLATION)

NEW FORMAT (MUST USE - ENGLISH TRANSLATION IS REQUIRED):
✅ "In the phrase 'وَإِذَا ٱلۡكَوَٰكِبُ ٱنتَثَرَتۡ' (when the stars fall scattered), the word ٱلۡكَوَاكِبُ is:"
   Options: Singular, Dual, Plural

✅ "In the phrase 'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ' (In the name of Allah, the Most Gracious, the Most Merciful), the word ٱلرَّحِیمِ is:"
   Options: Singular, Dual, Plural

MANDATORY: Every grammar question MUST include the English translation in parentheses after the Arabic phrase.

CRITICAL: GENITIVE CASE EXPLANATIONS - CHECK IDAFA FIRST:
When asking about why a word is in genitive case, you MUST check in this priority order:
1. **FIRST: Is it mudaf ilayhi (second term in idafa/possessive construction)?**
   - If the previous word is an indefinite noun (mudaf) and the target word is genitive, it's likely idafa
   - Example: In 'يَوۡمَ ٱلۡفَصۡلِ', ٱلۡفَصۡلِ is genitive because it's mudaf ilayhi in the idafa 'يَوۡمَ ٱلۡفَصۡلِ' (day of judgment)
   - DO NOT say it's genitive because of إِنَّ or other particles - those affect the mudaf, not the mudaf ilayhi
2. **SECOND: Does it follow a preposition?**
   - Prepositions like فِي، مِن، إِلَى، بِ، etc. make the following word genitive
   - Example: In 'فِي ٱلسَّمَاءِ', ٱلسَّمَاءِ is genitive because it follows فِي
3. **THIRD: Other grammatical reasons**

When explaining genitive case in quiz explanations:
- If idafa: "This word is genitive (majrur) because it is the mudaf ilayhi (second term) in the possessive construction '[mudaf] [mudaf ilayhi]'"
- If preposition: "This word is genitive (majrur) because it follows the preposition '[preposition]'"

REQUIREMENTS FOR GRAMMAR QUESTIONS:
1. ALWAYS start with "In the phrase '[Arabic text]' ([English translation]), the word [target word] is:"
2. Include the full verse phrase (2-5 words) where the target word appears
3. Include the English translation of that phrase in parentheses
4. Use PLAIN LANGUAGE for options - NO technical terms:
   - Instead of "Grammatical number" → ask "singular, dual, or plural"
   - Instead of "Grammatical case" → ask "nominative, genitive, or accusative" (or use plain descriptions)
   - Instead of "Definiteness" → ask "definite or indefinite"
   - Instead of "Gender" → ask "masculine or feminine"
   - Instead of "Tense" → ask "past tense, present tense, or imperative"
5. Options should be simple and accessible (e.g., "Singular", "Dual", "Plural" - NOT "Singular (مفرد)")
6. For case questions, you can use plain descriptions like:
   - "subject form (nominative)"
   - "object form (accusative)" 
   - "after preposition form (genitive)"
   - "second term in possessive construction (genitive)" - for mudaf ilayhi
7. NEVER mention word_id in the question text
8. Include the word_id as a NUMBER in the JSON (for database reference only)

CRITICAL FORMATTING REQUIREMENTS:
1. Return ONLY valid JSON, no markdown, no code blocks, no backticks
2. Each question must have EXACTLY 4 options
3. One option must exactly match correct_answer
4. For word meaning questions: 
   - ALWAYS write the question like this: "What does the word 'الرَّحْمَـٰنِ' mean?"
   - NEVER include transliteration in parentheses - just the Arabic word
   - NEVER write "What does the word with word_id X mean?" - this is FORBIDDEN
   - NEVER mention word_id anywhere in the question text
   - Include the word_id as a NUMBER in the JSON (for database reference only, not in question text)
5. For grammar questions:
   - ALWAYS use the NEW FORMAT: "In the phrase '[Arabic phrase]' ([English translation]), the word [target word] is:"
   - Include the verse phrase (2-5 words) where the target word appears
   - MANDATORY: Include English translation of the phrase in parentheses - this is REQUIRED, not optional
   - Use the verse context provided above to get the correct English translation
   - Use PLAIN LANGUAGE options (e.g., "Singular", "Dual", "Plural" - NOT "Singular (مفرد)")
   - NEVER include transliteration in parentheses - just the Arabic word
   - NEVER write "What part of speech is the word with word_id X?" - this is FORBIDDEN
   - NEVER mention word_id anywhere in the question text
   - NEVER omit the English translation - every grammar question must have "(English translation)" after the Arabic phrase
   - Specify the grammar_point being tested as a string
   - Include the word_id as a NUMBER in the JSON (for database reference only, not in question text)
6. word_id must be a number or null, never a string or Arabic text
7. Question text should be natural and educational - always show the Arabic word directly, NEVER mention word_id
8. EXAMPLES OF BAD QUESTIONS (DO NOT USE):
   - "What does the word with word_id 14 (إِيَّاكَ) mean?" ❌
   - "What part of speech is the word with word_id 15 (نَعْبُدُ)?" ❌
9. EXAMPLES OF GOOD QUESTIONS (USE THESE):
   - "What does the word 'إِيَّاكَ' mean?" ✅ (NO transliteration)
   - "In the phrase 'إِيَّاكَ نَعْبُدُ' (You alone we worship), the word نَعْبُدُ is:" ✅
     Options: ["Verb", "Noun", "Preposition", "Pronoun"]
   - "In the phrase 'بِسۡمِ ٱللَّهِ' (In the name of Allah), the word ٱللَّهِ is:" ✅
     Options: ["Singular", "Dual", "Plural"]
   
   EXAMPLES OF BAD GRAMMAR QUESTIONS (DO NOT USE):
   - "In the phrase 'بِسۡمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ', the word اللَّهِ is:" ❌ (MISSING ENGLISH TRANSLATION)
   - "In the phrase 'إِيَّاكَ نَعْبُدُ', the word نَعْبُدُ is:" ❌ (MISSING ENGLISH TRANSLATION)
10. NEVER include transliteration in question text - only show the Arabic word

Return as a JSON array with this EXACT structure:
[
  {
    "type": "multiple_choice",
    "question": "What does the word 'الرَّحْمَـٰنِ' mean?",
    "options": ["The Most Merciful", "The King", "The Guide", "The Creator"],
    "correct_answer": "The Most Merciful",
    "word_id": 123,
    "grammar_point": null,
    "explanation": "الرَّحْمَـٰنِ (ar-raḥmāni) is one of the names of Allah meaning 'The Most Merciful', emphasizing His infinite mercy."
  },
  {
    "type": "multiple_choice",
    "question": "In the phrase 'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ' (In the name of Allah, the Most Gracious, the Most Merciful), the word ٱلرَّحِیمِ is:",
    "options": ["Singular", "Dual", "Plural", "Not applicable"],
    "correct_answer": "Singular",
    "word_id": 456,
    "grammar_point": "number",
    "explanation": "The word ٱلرَّحِیمِ is singular, referring to one entity (Allah)."
  }
]

Make questions educational and varied. Include clear explanations.

IMPORTANT FOR EXPLANATIONS:
- When referring to Arabic diacritics (vowel marks) in explanations, use transliterated forms like "-i" (for kasra/kasrah), "-a" (for fatha), "-u" (for damma) instead of isolated Arabic diacritic characters.
- Do NOT use isolated diacritics like "(ِ)" or "(َ)" or "(ُ)" in explanations as they may not display correctly.
- Instead, write: "ends with a kasrah (pronounced '-i')" or "has a fatha (pronounced '-a')" or "ends with '-i' (kasrah)".
- Always use readable transliterations in parentheses when explaining diacritics.
- **TERMINOLOGY**: Always use "tense" terminology instead of "aspect" when discussing Arabic verbs in explanations. Use "perfect tense" or "past tense" instead of "perfect aspect", and "imperfect tense" or "present/future tense" instead of "imperfect aspect". This terminology is more accessible for English-speaking learners who aren't linguistics students.`;

    // Call Google Gemini API
    let questions: any[];
    try {
      questions = await generateJSONWithGemini(prompt, {
        temperature: 0.7,
        maxTokens: 2000
      });
    } catch (error: any) {
      console.error('Gemini API error:', error);
      throw new Error(`Failed to generate quiz questions: ${error.message}`);
    }

    // Validate response is an array
    if (!Array.isArray(questions)) {
      console.error('Unexpected Gemini API response:', questions);
      throw new Error('Invalid response from Gemini API. Expected an array of questions.');
    }

    // Validate we got 10 questions
    if (!Array.isArray(questions) || questions.length !== 10) {
      throw new Error('Generated quiz must have exactly 10 questions');
    }

    // Post-process questions to remove word_id references and transliteration from question text
    questions = questions.map((q: any) => {
      // Remove word_id references from question text (e.g., "word with word_id 14" -> just the word)
      if (q.question) {
        // Remove transliteration in parentheses (e.g., "(ar-raḥmāni)" -> removed)
        q.question = q.question.replace(/\s*\([^)]*[a-z][^)]*\)/gi, '');

        // Remove word_id references
        q.question = q.question
          .replace(/word\s+with\s+word_id\s+\d+\s*/gi, "word ")
          .replace(/word_id\s+\d+\s*/gi, "")
          .replace(/\(word_id\s*:\s*\d+\)/gi, '')
          .replace(/\s*\(word_id\s+\d+\)/gi, '')
          .trim();

        // If we have a word_id, try to get the Arabic word from wordsData
        if (q.word_id) {
          const wordData = wordsData.find((w: any) => w.id === q.word_id);
          if (wordData) {
            // If the Arabic word isn't already in the question, add it
            if (!q.question.includes(wordData.text_arabic)) {
              // Replace patterns like "the word" or "word" with the Arabic word (no transliteration)
              q.question = q.question.replace(
                /(the\s+)?word\s+['"]?([^'"]*)['"]?/i,
                `$1word '${wordData.text_arabic}'`
              );
            }
          }
        }
      }

      // Replace transliteration in options with Arabic terms
      if (q.options && Array.isArray(q.options)) {
        q.options = q.options.map((opt: string) => {
          // Replace common grammar term transliterations with Arabic
          return opt
            .replace(/\(Jarr\)/gi, '(جر)')
            .replace(/\(Raf'\)/gi, '(رفع)')
            .replace(/\(Nasb\)/gi, '(نصب)')
            .replace(/\(Ma'rifa\)/gi, '(معرفة)')
            .replace(/\(Nakira\)/gi, '(نكرة)')
            .replace(/\(Mufrad\)/gi, '(مفرد)')
            .replace(/\(Muthanna\)/gi, '(مثنى)')
            .replace(/\(Jama'\)/gi, '(جمع)')
            .replace(/\(Mudhakkar\)/gi, '(مذكر)')
            .replace(/\(Mu'annath\)/gi, '(مؤنث)')
            .replace(/\(Madi\)/gi, '(ماضي)')
            .replace(/\(Mudari'\)/gi, '(مضارع)')
            .replace(/\(Amr\)/gi, '(أمر)');
        });

        // Also update correct_answer
        q.correct_answer = q.correct_answer
          .replace(/\(Jarr\)/gi, '(جر)')
          .replace(/\(Raf'\)/gi, '(رفع)')
          .replace(/\(Nasb\)/gi, '(نصب)')
          .replace(/\(Ma'rifa\)/gi, '(معرفة)')
          .replace(/\(Nakira\)/gi, '(نكرة)')
          .replace(/\(Mufrad\)/gi, '(مفرد)')
          .replace(/\(Muthanna\)/gi, '(مثنى)')
          .replace(/\(Jama'\)/gi, '(جمع)')
          .replace(/\(Mudhakkar\)/gi, '(مذكر)')
          .replace(/\(Mu'annath\)/gi, '(مؤنث)')
          .replace(/\(Madi\)/gi, '(ماضي)')
          .replace(/\(Mudari'\)/gi, '(مضارع)')
          .replace(/\(Amr\)/gi, '(أمر)');
      }

      // Fix isolated Arabic diacritics in explanations
      if (q.explanation) {
        const diacriticMap: Record<string, string> = {
          '\u064E': 'a',  // fatha
          '\u064F': 'u',  // damma
          '\u0650': 'i',  // kasra/kasrah
          '\u0651': '',   // shadda (remove)
          '\u0652': '',   // sukun (remove)
          '\u064B': 'an', // fathatan
          '\u064C': 'un', // dammatan
          '\u064D': 'in', // kasratan
        };

        // Replace isolated diacritics in parentheses like (ِ) or (َ) or (ُ)
        q.explanation = q.explanation.replace(/\((\u064E|\u064F|\u0650|\u0651|\u0652|\u064B|\u064C|\u064D)\)/g, (match: string, diacritic: string) => {
          const transliteration = diacriticMap[diacritic];
          if (transliteration) {
            return `(pronounced '-${transliteration}')`;
          }
          return '';
        });

        // Replace patterns like "kasrah (ِ)" or "a kasrah (ِ)" or "the kasrah (ِ)" with "kasrah (pronounced '-i')"
        q.explanation = q.explanation.replace(/(a\s+|the\s+)?(kasra[h]?|fatha|damma)\s*\((\u064E|\u064F|\u0650|\u0651|\u0652|\u064B|\u064C|\u064D)\)/gi, (match: string, article: string, term: string, diacritic: string) => {
          const transliteration = diacriticMap[diacritic];
          if (transliteration) {
            const articleText = article ? article.trim() + ' ' : '';
            return `${articleText}${term} (pronounced '-${transliteration}')`;
          }
          return match;
        });

        // Replace patterns like "ends with (ِ)" with "ends with '-i'"
        q.explanation = q.explanation.replace(/(ends?\s+with|has|contains)\s*\((\u064E|\u064F|\u0650|\u0651|\u0652|\u064B|\u064C|\u064D)\)/gi, (match: string, verb: string, diacritic: string) => {
          const transliteration = diacriticMap[diacritic];
          if (transliteration) {
            return `${verb} '-${transliteration}'`;
          }
          // Return original match to preserve context when transliteration unavailable (e.g., shadda, sukun)
          return match;
        });
      }

      return q;
    });

    // Delete existing quiz questions for this surah to avoid duplicates
    const { data: deletedQuestions, error: deleteError } = await supabase
      .from('quiz_bank')
      .delete()
      .eq('surah_id', surahId)
      .select();

    if (deleteError) {
      console.error('Error deleting existing quiz questions:', deleteError);
      // Don't throw - try to continue, but log the error
      console.warn('Warning: Could not delete existing questions. Insert may fail with duplicate key error.');
    } else if (deletedQuestions && deletedQuestions.length > 0) {
      console.log(`Deleted ${deletedQuestions.length} existing quiz questions for surah ${surahId}`);
    }

    // Insert into quiz_bank - validate and convert word_id to number
    const questionsToInsert = questions.map((q: any) => {
      // Validate and convert word_id to number or null
      let wordId: number | null = null;
      if (q.word_id) {
        const parsedId = typeof q.word_id === 'string' ? parseInt(q.word_id, 10) : q.word_id;
        if (!isNaN(parsedId) && parsedId > 0) {
          wordId = parsedId;
        } else {
          console.warn(`Invalid word_id in question: ${q.question}, word_id: ${q.word_id}`);
        }
      }

      return {
        surah_id: surahId,
        question_text: q.question,
        question_type: q.type,
        correct_answer: q.correct_answer,
        word_id: wordId,
        grammar_point: q.grammar_point || null,
        options: q.options,
        explanation: q.explanation || null
      };
    });

    // Use upsert to handle any remaining duplicates gracefully
    const { data: insertedQuestions, error: insertError } = await supabase
      .from('quiz_bank')
      .upsert(questionsToInsert, {
        onConflict: 'surah_id,question_text',
      })
      .select();

    if (insertError) {
      console.error('Error inserting quiz questions:', insertError);
      // If it's a duplicate key error, provide a clearer message
      if (insertError.message?.includes('duplicate key') || insertError.code === '23505') {
        throw new Error(`Duplicate quiz questions detected. Please try again - the system will regenerate questions. Error: ${insertError.message}`);
      }
      throw insertError;
    }

    return {
      success: true,
      questionsGenerated: insertedQuestions?.length || 0
    };

  } catch (error: any) {
    console.error('Error generating quiz:', error);
    return {
      success: false,
      questionsGenerated: 0,
      error: error.message || error.toString()
    };
  }
}

