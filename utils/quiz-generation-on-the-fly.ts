import { SupabaseClient } from '@supabase/supabase-js';
import { detectIdafa, detectPreposition } from '@/utils/idafa-detection';
import { generateJSONWithMistral } from '@/lib/mistral';

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
 * Generates a quiz for a given surah on-the-fly (doesn't store in database)
 * This ensures users always get fresh questions with correct grammar explanations
 */
export async function generateQuizForSurahOnTheFly(
  supabase: any,
  surahId: number
): Promise<QuizGenerationResult> {
  try {
    if (!process.env.MISTRAL_API_KEY) {
      return {
        success: false,
        error: 'MISTRAL_API_KEY is not configured'
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
        words: verseWords.sort((a: any, b: any) => a.word_position - b.word_position)
      };
    }) || [];

    // Create phrase contexts for each word with proper translations
    const wordContexts = wordsData.map((word: any) => {
      // Find the verse this word belongs to
      const verse = verseContexts.find((v: any) =>
        v.words.some((w: any) => w.id === word.id)
      );

      if (!verse) return null;

      // Get 2-3 words of context around this word
      const wordIndex = verse.words.findIndex((w: any) => w.id === word.id);
      const startIndex = Math.max(0, wordIndex - 1);
      const endIndex = Math.min(verse.words.length, wordIndex + 3);
      const contextWords = verse.words.slice(startIndex, endIndex);

      const phraseArabic = contextWords.map((w: any) => w.text_arabic).join(' ');
      const phraseTranslation = contextWords.map((w: any) => w.translation_english || '').filter((t: string) => t).join(' ');

      return {
        word_id: word.id,
        target_word: word.text_arabic,
        target_translation: word.translation_english,
        phrase_arabic: phraseArabic,
        phrase_translation: phraseTranslation,
        grammar: word.grammar_info
      };
    }).filter(Boolean);

    const prompt = `You are generating a 10-question quiz for Surah ${surahData.name_english} (${surahData.name_arabic}) to test Quranic Arabic comprehension.

**Critical**: 
- Return ONLY a valid JSON array. No markdown, no code blocks, no backticks, no explanations. Your response must start with [ and end with ].
- **NO TRANSLITERATION** in question text - show only Arabic script and English translations

---

Available Data:

Words with Individual Translations:
${wordsData.map((w: any) => `- word_id: ${w.id}, Arabic: ${w.text_arabic}, transliteration: ${w.transliteration || 'N/A'}, translation: ${w.translation_english || 'N/A'}${w.grammar_info ? `, grammar: ${JSON.stringify(w.grammar_info)}` : ''}`).join('\n')}

Phrase Contexts (for Grammar Questions - USE THESE EXACT TRANSLATIONS):
${wordContexts.map((ctx: any) => `- word_id: ${ctx.word_id}, target: ${ctx.target_word}, phrase: "${ctx.phrase_arabic}" = "${ctx.phrase_translation}"`).join('\n')}

Complete Verses (for Comprehension Questions):
${verseContexts.map((v: any) => `- Verse ${v.verse_number}: ${v.text_arabic} (${v.translation || 'translation not available'})`).join('\n') || ''}

---

Question Distribution (EXACTLY 10 questions):

1. 4 Word Meaning Questions - Test Arabic word → English meaning
2. 3 Grammar Questions - Test grammatical properties
3. 2 Comprehension Questions - Test understanding of specific verses
4. 1 Phrase Translation Question - Test translation of 2-3 word phrases

---

WORD MEANING QUESTIONS:

Format: "What does the word 'ٱلرَّحْمَـٰنِ' mean?"

Rules:
- Show only Arabic word in quotes - NO transliteration
- Never mention word_id in question text
- Include word_id as number in JSON only
- Provide 4 clear options

Example:
{
  "type": "multiple_choice",
  "question": "What does the word 'ٱلرَّحْمَـٰنِ' mean?",
  "options": ["The Most Merciful", "The King", "The Guide", "The Creator"],
  "correct_answer": "The Most Merciful",
  "word_id": 123,
  "grammar_point": null,
  "explanation": "ٱلرَّحْمَـٰنِ (ar-raḥmāni) means 'The Most Merciful', one of Allah's names."
}

---

GRAMMAR QUESTIONS:

**CRITICAL**: Use ONLY the pre-built phrase contexts provided above. Do NOT construct your own translations.

Format: "In the phrase '[Arabic phrase]' ([English translation from phrase context]), what is [target word]?"

Rules:
- Find the word in "Phrase Contexts" section above
- Use the EXACT phrase_arabic and phrase_translation provided
- ALWAYS include English translation in parentheses after Arabic phrase
- NO transliteration - only Arabic script and English
- Use plain language in options
- Ask simple, direct questions

Question Patterns:
- For Number: "what is [word]?" → Options: "Singular", "Dual", "Plural"
- For Case: "what case is [word] in?" → Options: "Nominative", "Genitive", "Accusative"
- For Role: "what is [word]?" → Options: "The subject", "The object", "A possessive construction"
  **CRITICAL**: Say "The subject", "The object" - NOT "Subject form", "Object form"

Example:
{
  "type": "multiple_choice",
  "question": "In the phrase 'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ' (In the name of Allah, the Most Gracious), what is ٱللَّهِ?",
  "options": ["The subject", "The object", "Part of a possessive construction", "A time expression"],
  "correct_answer": "Part of a possessive construction",
  "word_id": 456,
  "grammar_point": "role",
  "explanation": "ٱللَّهِ is the second term (mudaf ilayhi) in the possessive construction 'بِسۡمِ ٱللَّهِ'."
}

---

COMPREHENSION QUESTIONS:

**CRITICAL NEW RULE**: When asking about a specific verse, ALWAYS include the Arabic text of that verse in the question so the user can see it.

Format: "Verse [number] says: '[Arabic text of verse]'. What [question about meaning/message]?"

CRITICAL RULE - Single Verse Precision:
- The correct answer MUST come ONLY from the specific verse mentioned
- Do NOT use information from adjacent verses for the correct answer
- You MAY use adjacent verses' messages as wrong options (distractors)
- ALWAYS display the Arabic verse text in the question

Process:
1. Analyze what THIS verse says (not the next/previous verse)
2. Include the full Arabic text of the verse in the question
3. Generate question about the verse's meaning or message
4. Create distractors from adjacent verses or related themes

Example:
{
  "type": "multiple_choice",
  "question": "Verse 16 says: 'بَلۡ تُؤۡثِرُونَ ٱلۡحَيَوٰةَ ٱلدُّنۡيَا'. What human tendency is criticized in this verse?",
  "options": ["Neglecting prayer", "Prioritizing worldly pleasures over spiritual matters", "Believing the Hereafter is better", "Following misguided leaders"],
  "correct_answer": "Prioritizing worldly pleasures over spiritual matters",
  "word_id": null,
  "grammar_point": null,
  "explanation": "Verse 16 specifically criticizes the human tendency to prefer worldly life (al-hayāt ad-dunyā). The next verse states the Hereafter is better, but verse 16 itself identifies this problematic preference."
}

---

PHRASE TRANSLATION QUESTION:

Format: "What does the phrase 'بِسۡمِ ٱللَّهِ' mean?"

Rules:
- Show only Arabic text - NO transliteration
- 2-3 word meaningful phrase
- 4 translation options

Example:
{
  "type": "multiple_choice",
  "question": "What does the phrase 'بِسۡمِ ٱللَّهِ' mean?",
  "options": ["In the name of Allah", "By the grace of Allah", "For the sake of Allah", "With the help of Allah"],
  "correct_answer": "In the name of Allah",
  "word_id": null,
  "grammar_point": null,
  "explanation": "بِسۡمِ ٱللَّهِ (bismi llāhi) means 'In the name of Allah'."
}

---

CRITICAL INSTRUCTIONS:
1. Return ONLY valid JSON - no markdown, backticks, or extra text
2. Start with [ and end with ]
3. Exactly 10 questions
4. NO transliteration in question text
5. For Grammar questions: Use EXACT phrase translations from "Phrase Contexts" section
6. For Comprehension questions: ALWAYS include the Arabic verse text in the question
7. Grammar questions MUST have English translation in parentheses
8. Use plain language: "The subject" not "Subject form"
9. word_id must be number or null, never string
10. One option must exactly match correct_answer

Remember: Return ONLY the JSON array. No other text.`;

    // Call Mistral AI API

    console.log('=== MISTRAL API CALL ===');
    console.log('Prompt length:', prompt.length);
    console.log('========================');

    let questions: QuizQuestion[] | null = null;
    const maxAttempts = 3;

    for (let attempt = 1; attempt <= maxAttempts; attempt++) {
      try {
        const result = await generateJSONWithMistral(prompt, {
          temperature: 0.3, // Lower temperature for more consistent JSON
          maxTokens: 4000
        });

        // Validate response
        if (!Array.isArray(result)) {
          throw new Error(`Invalid response: expected array, got ${typeof result}`);
        }

        if (result.length === 0) {
          throw new Error('Empty questions array received');
        }

        questions = result;
        break; // Success, exit retry loop

      } catch (error: any) {
        if (attempt < maxAttempts) {
          // Wait before retry (exponential backoff)
          const waitTime = 1000 * attempt;
          await new Promise(resolve => setTimeout(resolve, waitTime));
        } else {
          throw new Error(`Failed to generate quiz questions after ${maxAttempts} attempts: ${error.message}`);
        }
      }
    }

    if (!questions) {
      throw new Error('Failed to generate quiz questions: all attempts failed');
    }

    if (questions.length < 10) {
      console.warn(`Only ${questions.length} questions generated, expected 10`);
    }

    // Validate and normalize questions
    const validatedQuestions = questions.map((q: any) => {
      // Validate and convert word_id to number or null
      let wordId: number | null = null;
      if (q.word_id) {
        const parsedId = typeof q.word_id === 'string' ? parseInt(q.word_id, 10) : q.word_id;
        if (!isNaN(parsedId) && parsedId > 0) {
          wordId = parsedId;
        }
      }

      return {
        type: q.type || 'multiple_choice',
        question: q.question || '',
        options: Array.isArray(q.options) ? q.options : [],
        correct_answer: q.correct_answer || '',
        word_id: wordId,
        grammar_point: q.grammar_point || null,
        explanation: q.explanation || ''
      };
    });

    return {
      success: true,
      questions: validatedQuestions
    };

  } catch (error: any) {
    console.error('Error generating quiz:', error);
    return {
      success: false,
      error: error.message || error.toString()
    };
  }
}
