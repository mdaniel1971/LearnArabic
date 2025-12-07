import { createClient } from '@/utils/supabase/server';
import { NextRequest, NextResponse } from 'next/server';

export async function POST(request: NextRequest) {
  try {
    const { surahId } = await request.json();
    
    if (!process.env.MISTRAL_API_KEY) {
      return NextResponse.json({ 
        error: 'MISTRAL_API_KEY is not configured. Please add it to your .env.local file.' 
      }, { status: 500 });
    }
    
    const supabase = await createClient();

    // Verify user is authenticated
    const { data: { user }, error: userError } = await supabase.auth.getUser();
    if (userError || !user) {
      return NextResponse.json({ 
        error: 'Authentication required to generate quiz' 
      }, { status: 401 });
    }

    // Fetch surah data with all words - using correct column names
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
    
    const prompt = `You are creating a 10-question quiz for Surah ${surahData.name_english} (${surahData.name_arabic}) to test Quranic Arabic comprehension.

Available words and their data (use the word_id number for word meaning questions):
${wordsData.map((w: any) => `- word_id: ${w.id}, Arabic: ${w.text_arabic} (${w.transliteration || 'N/A'}): ${w.translation_english || 'N/A'}${w.grammar_info ? `, Grammar: ${JSON.stringify(w.grammar_info)}` : ''}`).join('\n')}

Verse Arabic text:
${surahData.verses?.map((v: any) => `Verse ${v.verse_number}: ${v.text_arabic}`).join('\n') || ''}

Create EXACTLY 10 questions with this distribution:
- 4 word meaning questions (multiple choice) - test Arabic word → English meaning
- 3 grammar questions (multiple choice) - test understanding of word types, cases, grammatical roles
- 2 phrase translation questions (multiple choice) - test translation of 2-3 word phrases
- 1 comprehension question (multiple choice) - test overall understanding of a verse

IMPORTANT: For grammar questions, use Arabic grammar terms in parentheses:
- Genitive case = "Genitive (جر)"
- Nominative case = "Nominative (رفع)"
- Accusative case = "Accusative (نصب)"
- Definite = "Definite (معرفة)"
- Indefinite = "Indefinite (نكرة)"
- Singular = "Singular (مفرد)"
- Dual = "Dual (مثنى)"
- Plural = "Plural (جمع)"
- Masculine = "Masculine (مذكر)"
- Feminine = "Feminine (مؤنث)"
- Past tense = "Past (ماضي)"
- Present tense = "Present (مضارع)"
- Imperative = "Imperative (أمر)"
- First person = "First person (متكلم)"
- Second person = "Second person (مخاطب)"
- Third person = "Third person (غائب)"
NEVER use transliteration (romanized Arabic) - always use Arabic script in parentheses.

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
   - ALWAYS write the question like this: "What part of speech is 'نَعْبُدُ'?"
   - NEVER include transliteration in parentheses - just the Arabic word
   - NEVER write "What part of speech is the word with word_id X?" - this is FORBIDDEN
   - NEVER mention word_id anywhere in the question text
   - Specify the grammar_point being tested as a string
   - Include the word_id as a NUMBER in the JSON (for database reference only, not in question text)
6. word_id must be a number or null, never a string or Arabic text
7. Question text should be natural and educational - always show the Arabic word directly, NEVER mention word_id
8. EXAMPLES OF BAD QUESTIONS (DO NOT USE):
   - "What does the word with word_id 14 (إِيَّاكَ) mean?" ❌
   - "What part of speech is the word with word_id 15 (نَعْبُدُ)?" ❌
9. EXAMPLES OF GOOD QUESTIONS (USE THESE):
   - "What does the word 'إِيَّاكَ' mean?" ✅ (NO transliteration)
   - "What part of speech is 'نَعْبُدُ'?" ✅ (NO transliteration)
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
    "question": "What grammatical case is the word 'الرَّحِيمِ' in?",
    "options": ["Genitive (جر)", "Nominative (رفع)", "Accusative (نصب)", "No case"],
    "correct_answer": "Genitive (جر)",
    "word_id": 456,
    "grammar_point": "grammatical_case",
    "explanation": "The word ends with kasrah (ِ) indicating genitive case, as it follows the preposition 'bi' (بِ)."
  }
]

Make questions educational and varied. Include clear explanations.`;

    // Call Mistral AI
    const mistralResponse = await fetch('https://api.mistral.ai/v1/chat/completions', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${process.env.MISTRAL_API_KEY}`
      },
      body: JSON.stringify({
        model: 'mistral-large-latest',
        messages: [{ role: 'user', content: prompt }],
        temperature: 0.7,
        max_tokens: 2000
      })
    });

    if (!mistralResponse.ok) {
      throw new Error(`Mistral API error: ${mistralResponse.statusText}`);
    }

    const mistralData = await mistralResponse.json();
    
    if (!mistralData.choices || !mistralData.choices[0] || !mistralData.choices[0].message) {
      console.error('Unexpected Mistral API response:', mistralData);
      throw new Error('Invalid response from Mistral AI. Please check the API key and try again.');
    }
    
    let questionsText = mistralData.choices[0].message.content.trim();
    
    // Clean up response - remove markdown code blocks if present
    questionsText = questionsText.replace(/```json\n?/g, '').replace(/```\n?/g, '').trim();
    
    let questions;
    try {
      questions = JSON.parse(questionsText);
    } catch (parseError: any) {
      console.error('Failed to parse Mistral response as JSON:', questionsText);
      throw new Error(`Failed to parse quiz questions: ${parseError.message}. Mistral may have returned invalid JSON.`);
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
      
      return q;
    });

    // Delete existing quiz questions for this surah to avoid duplicates
    // This must complete successfully before inserting new questions
    const { data: deletedQuestions, error: deleteError } = await supabase
      .from('quiz_bank')
      .delete()
      .eq('surah_id', surahId)
      .select();

    if (deleteError) {
      console.error('Error deleting existing quiz questions:', deleteError);
      // Don't throw - try to continue, but log the error
      // The insert will fail with duplicate key error if delete didn't work
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
    // The unique constraint is on (surah_id, question_text)
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

    return NextResponse.json({ 
      success: true, 
      questionsGenerated: insertedQuestions?.length || 0
    });

  } catch (error: any) {
    console.error('Error generating quiz:', error);
    return NextResponse.json({ 
      error: error.message,
      details: error.toString() 
    }, { status: 500 });
  }
}

