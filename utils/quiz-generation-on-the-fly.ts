import { SupabaseClient } from '@supabase/supabase-js';
import { detectIdafa, detectPreposition } from '@/utils/idafa-detection';
import { generateJSONWithClaude } from '@/lib/claude';
// import { generateJSONWithGroq } from '@/lib/groq'; // Fallback option

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
    if (!process.env.ANTHROPIC_API_KEY) {
      return {
        success: false,
        error: 'ANTHROPIC_API_KEY is not configured'
      };
    }
    // Fallback check (commented out - uncomment if switching back to Groq)
    // if (!process.env.GROQ_API_KEY) {
    //   return {
    //     success: false,
    //     error: 'GROQ_API_KEY is not configured'
    //   };
    // }

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

    // Create phrase contexts only for words with grammar info (likely to be used in grammar questions)
    // This reduces prompt size significantly
    const wordsWithGrammar = wordsData.filter((w: any) => w.grammar_info && (
      w.grammar_info.part_of_speech === 'noun' ||
      w.grammar_info.part_of_speech === 'adjective' ||
      w.grammar_info.part_of_speech === 'verb' ||
      w.grammar_info.case
    ));

    // Create phrase contexts for each word with proper translations and grammatical relationships
    const wordContexts = wordsWithGrammar.map((word: any) => {
      // Find the verse this word belongs to
      const verse = verseContexts.find((v: any) =>
        v.words.some((w: any) => w.id === word.id)
      );

      if (!verse) return null;

      // Get full verse context for grammatical analysis
      const wordIndex = verse.words.findIndex((w: any) => w.id === word.id);

      // Get 2-3 words of context around this word for phrase display
      const startIndex = Math.max(0, wordIndex - 1);
      const endIndex = Math.min(verse.words.length, wordIndex + 3);
      const contextWords = verse.words.slice(startIndex, endIndex);

      const phraseArabic = contextWords.map((w: any) => w.text_arabic).join(' ');
      const phraseTranslation = contextWords.map((w: any) => w.translation_english || '').filter((t: string) => t).join(' ');

      // Build verse structure with all words and their grammar info for context
      const verseStructure = verse.words.map((w: any, idx: number) => ({
        position: idx + 1,
        arabic: w.text_arabic,
        translation: w.translation_english || '',
        grammar: w.grammar_info || {}
      }));

      return {
        word_id: word.id,
        target_word: word.text_arabic,
        target_translation: word.translation_english,
        phrase_arabic: phraseArabic,
        phrase_translation: phraseTranslation,
        grammar: word.grammar_info,
        full_verse_arabic: verse.text_arabic,
        full_verse_translation: verse.translation,
        verse_number: verse.verse_number,
        verse_structure: verseStructure // Full verse with all words and their grammar
      };
    }).filter(Boolean);

    const prompt = `You are generating a 10-question quiz for Surah ${surahData.name_english} (${surahData.name_arabic}) to test Quranic Arabic comprehension.

**Critical**: 
- Return ONLY a valid JSON array. No markdown, no code blocks, no backticks, no explanations. Your response must start with [ and end with ].
- **NO TRANSLITERATION** in question text - show only Arabic script and English translations

---

Available Data:

Words with Individual Translations (compact format):
${wordsData.map((w: any) => {
      const g = w.grammar_info || {};
      const grammarStr = [g.part_of_speech, g.case, g.gender, g.number].filter(Boolean).join(',');
      return `- word_id: ${w.id}, ${w.text_arabic} = "${w.translation_english || 'N/A'}" [${grammarStr || 'N/A'}]`;
    }).join('\n')}

Phrase Contexts (for Grammar Questions - USE THESE EXACT TRANSLATIONS):
${wordContexts.map((ctx: any) => {
      // Compact grammar representation - only key fields
      const grammarStr = ctx.grammar ? [
        ctx.grammar.part_of_speech,
        ctx.grammar.case,
        ctx.grammar.gender,
        ctx.grammar.number
      ].filter(Boolean).join(',') : 'N/A';

      let contextInfo = `- word_id: ${ctx.word_id}, target: ${ctx.target_word}, phrase: "${ctx.phrase_arabic}" = "${ctx.phrase_translation}"`;
      contextInfo += `\n  Grammar: ${grammarStr}`;
      contextInfo += `\n  Verse ${ctx.verse_number}: "${ctx.full_verse_arabic}"`;

      // Only include nearby words (2 before, 2 after) with compact grammar for context
      const wordIndex = ctx.verse_structure.findIndex((w: any) => w.arabic === ctx.target_word);
      const startIdx = Math.max(0, wordIndex - 2);
      const endIdx = Math.min(ctx.verse_structure.length, wordIndex + 3);
      const nearbyWords = ctx.verse_structure.slice(startIdx, endIdx);

      if (nearbyWords.length > 0) {
        contextInfo += `\n  Context: ${nearbyWords.map((w: any) => {
          const g = w.grammar || {};
          const gStr = [g.part_of_speech, g.case].filter(Boolean).join('/');
          return `${w.arabic}(${gStr || 'N/A'})`;
        }).join(' ')}`;
      }

      return contextInfo;
    }).join('\n')}

${surahData.surah_number === 1 ? `**SPECIAL NOTE FOR AL-FATIHA:**
- In verse 1, ٱلرَّحْمَـٰنِ and ٱلرَّحِيمِ are both adjectives describing ٱللَّهِ
- They are coordinate adjectives (not modifying each other)
- They take genitive case to match ٱللَّهِ which is genitive after بِسْمِ
- When explaining the case of ٱلرَّحْمَـٰنِ or ٱلرَّحِيمِ, state: "This word is genitive because it is an adjective agreeing with ٱللَّهِ, which is genitive as the second term (mudaf ilayhi) in the possessive construction 'بِسْمِ ٱللَّهِ'"
` : ''}

Complete Verses (for Comprehension Questions):
${verseContexts.map((v: any) => `- V${v.verse_number}: ${v.text_arabic}`).join('\n') || ''}

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
- **For case questions**: Use the full verse context and grammatical relationships provided to generate accurate explanations

Question Patterns:
- For Number: "what is [word]?" → Options: "Singular", "Dual", "Plural"
- For Case: "what case is [word] in?" → Options: "Nominative", "Genitive", "Accusative"
- For Role: "what is [word]?" → Options: "The subject", "The object", "A possessive construction"
  **CRITICAL**: Say "The subject", "The object" - NOT "Subject form", "Object form"

**EXPLANATION REQUIREMENTS FOR GRAMMAR QUESTIONS:**

When explaining grammatical case, you MUST:
1. Identify WHAT the word is agreeing with or relating to
2. State the grammatical relationship clearly
3. Use the full verse context provided in "Phrase Contexts"
4. Reference the grammatical relationships if provided

**For Case Explanations:**
- If idafa: "This word is genitive because it is the mudaf ilayhi (second term) in the possessive construction '[mudaf] [mudaf ilayhi]' meaning '[translation]'"
- If preposition: "This word is genitive because it follows the preposition '[preposition]'"
- If adjective: "This word is [case] because it is an adjective agreeing with [noun] in [case] case. [Noun] is [case] because [reason]"
- Always identify what the word relates to grammatically, not just state the case

**For Al-Fatiha specifically:**
- When explaining ٱلرَّحْمَـٰنِ or ٱلرَّحِيمِ: "This word is genitive because it is an adjective agreeing with ٱللَّهِ, which is genitive as the second term (mudaf ilayhi) in the possessive construction 'بِسْمِ ٱللَّهِ'"
- They are coordinate adjectives (both describe ٱللَّهِ, not each other)

Example:
{
  "type": "multiple_choice",
  "question": "In the phrase 'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ' (In the name of Allah, the Most Gracious), what case is ٱلرَّحۡمَـٰنِ in?",
  "options": ["Nominative", "Genitive", "Accusative", "No case"],
  "correct_answer": "Genitive",
  "word_id": 456,
  "grammar_point": "case",
  "explanation": "ٱلرَّحۡمَـٰنِ is genitive because it is an adjective agreeing with ٱللَّهِ, which is genitive as the second term (mudaf ilayhi) in the possessive construction 'بِسْمِ ٱللَّهِ' (in the name of Allah)."
}

---

COMPREHENSION QUESTIONS:

**CRITICAL NEW RULE**: When asking about a specific verse, ALWAYS include the Arabic text of that verse in the question so the user can see it.

Format: "Verse [number] says: '[Arabic text of verse]'. What [question about meaning/message]?"

**CRITICAL RESTRICTIONS - NEVER ASK:**
- NEVER ask questions about the surah's name, number, or classification
- NEVER use verse 1 (Bismillah) for comprehension questions as it's generic across surahs
- NEVER ask "What is the name of this surah?"
- NEVER ask "What does the Bismillah tell us about this surah?"
- NEVER ask "Which surah is this verse from?"
- Focus on substantive content that teaches understanding of the Quranic message

**WHAT TO ASK INSTEAD:**
Comprehension questions should ONLY ask about:
1. The meaning or message of a specific verse
2. What action is commanded/forbidden in a verse
3. What characteristic or attribute is described
4. What consequence or result is mentioned

CRITICAL RULE - Single Verse Precision:
- The correct answer MUST come ONLY from the specific verse mentioned
- Do NOT use information from adjacent verses for the correct answer
- You MAY use adjacent verses' messages as wrong options (distractors)
- ALWAYS display the Arabic verse text in the question
- Skip verse 1 (Bismillah) - start from verse 2 or later

Process:
1. Analyze what THIS verse says (not the next/previous verse)
2. Skip verse 1 (Bismillah) - it's generic and not surah-specific
3. Include the full Arabic text of the verse in the question
4. Generate question about the verse's meaning, message, command, characteristic, or consequence
5. Create distractors from adjacent verses or related themes

**BAD Examples (DO NOT USE):**
- "What is the name of this surah?" ❌
- "What does the Bismillah tell us about this surah?" ❌
- "Which surah is this verse from?" ❌
- "Verse 1 says: 'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِيمِ'. What is this phrase called?" ❌

**GOOD Example:**
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
11. NEVER ask about surah name, number, or classification in comprehension questions
12. NEVER use verse 1 (Bismillah) for comprehension questions - start from verse 2 or later

Remember: Return ONLY the JSON array. No other text.`;

    // Call Mistral AI API

    // Call Claude API

    console.log('=== CLAUDE API CALL ===');
    console.log('Prompt length:', prompt.length);
    console.log('========================');

    // Generate quiz questions (retry logic is handled inside generateJSONWithClaude)
    const result = await generateJSONWithClaude(prompt, {
      temperature: 0.3, // Lower temperature for more consistent JSON
      maxTokens: 4000
    });

    // Fallback option (commented out - uncomment if switching back to Groq)
    // const result = await generateJSONWithGroq(prompt, {
    //   temperature: 0.3,
    //   maxTokens: 4000
    // });

    // Validate response
    if (!Array.isArray(result)) {
      throw new Error(`Invalid response: expected array, got ${typeof result}`);
    }

    if (result.length === 0) {
      throw new Error('Empty questions array received');
    }

    const questions = result;

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
