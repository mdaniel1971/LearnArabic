import { NextRequest, NextResponse } from "next/server";

// Initialize Mistral client dynamically to avoid issues with serverless functions
async function getMistralClient() {
  const { Mistral } = await import("@mistralai/mistralai");
  return new Mistral({
    apiKey: process.env.MISTRAL_API_KEY || "",
  });
}

// Get verb form meanings
function getFormMeaning(form: number): string {
  const meanings: Record<number, string> = {
    1: 'Basic/simple meaning (the root action)',
    2: 'Intensive or causative (making something happen intensely)',
    3: 'Reciprocal or attempting (mutual action between parties)',
    4: 'Causative (causing someone/something to do the action)',
    5: 'Reflexive of Form II (action done to oneself)',
    6: 'Reflexive of Form III (mutual/reciprocal action)',
    7: 'Passive reflexive (action happening to the subject)',
    8: 'Reflexive (action done for oneself or automatically)',
    9: 'Colors, defects, or special characteristics',
    10: 'Seeking or requesting (asking for the action)'
  };
  return meanings[form] || 'Derived meaning with special nuance';
}

// Helper function for compound word instructions
function buildCompoundWordInstruction(wordData: {
  text_arabic: string;
  is_compound: boolean;
  has_pronoun_suffix: boolean;
  grammar_info?: any;
}): string {
  if (!wordData.is_compound && !wordData.has_pronoun_suffix) return '';

  // Detect if this is a noun + pronoun compound
  const isNounPronounCompound = wordData.has_pronoun_suffix ||
    (wordData.grammar_info?.part_of_speech === 'noun' && wordData.text_arabic.match(/ها|هم|هن|ك|كم|كن|ي$/));

  if (isNounPronounCompound) {
    return `
COMPOUND WORD - NOUN + PRONOUN SUFFIX:
This word consists of a noun stem with an attached pronoun suffix.

Start your explanation like this:
"${wordData.text_arabic} combines two elements: the noun [STEM] (meaning '[STEM_MEANING]') + the pronoun suffix [SUFFIX] (meaning '[SUFFIX_MEANING]'). Together they mean '[COMBINED_MEANING]'."

Then explain:
1. What the noun stem means and its role
2. What the pronoun suffix indicates (possession, object, etc.)
3. How they work together grammatically

DO NOT say "${wordData.text_arabic} is a noun" - it's a noun WITH an attached pronoun suffix.`;
  }

  return '';
}

// Helper function for contextual guidance
function buildContextualGuidance(verse_context: any, grammar_info: any): string {
  const guidance: string[] = [];

  // Check for negation
  if (verse_context?.surrounding_words) {
    const negationParticles = ['مَا', 'لَا', 'لَمْ', 'لَنْ', 'لَن', 'لِيس', 'لَيْسَ'];
    const hasNegation = verse_context.surrounding_words.some((w: any) => {
      const text = (w.text_arabic || w || '').trim();
      return negationParticles.some(neg => text.includes(neg) || text === neg);
    });

    if (hasNegation) {
      guidance.push(`⚠️ NEGATION PRESENT: A negation particle (مَا/لَا/لَمْ/لَنْ) appears near this word. Explain the NEGATED meaning clearly.`);
    }
  }

  // Check for passive voice
  if (grammar_info?.voice === 'passive') {
    guidance.push(`⚠️ PASSIVE VOICE: This is a passive verb. Explain that the subject RECEIVES the action rather than performing it.`);
  }

  // Check for verb form
  if (grammar_info?.form) {
    const formNum = typeof grammar_info.form === 'string' ? parseInt(grammar_info.form) : grammar_info.form;
    if (!isNaN(formNum)) {
      const formMeaning = getFormMeaning(formNum);
      guidance.push(`⚠️ VERB FORM ${formNum}: Explain this form's special meaning: ${formMeaning}`);
    }
  }

  // Check for vocative (after يَا)
  if (verse_context?.surrounding_words || verse_context?.preceding_words) {
    const words = verse_context.preceding_words || verse_context.surrounding_words || [];
    const hasVocative = words.some((w: any) =>
      (w.text_arabic || '').includes('يَا'));
    if (hasVocative) {
      guidance.push(`⚠️ VOCATIVE: This word follows يَا (yaa, "O"), making it vocative - someone/something being called or addressed.`);
    }
  }

  return guidance.length > 0 ? '\nSPECIAL CONSIDERATIONS:\n' + guidance.join('\n') : '';
}

export async function POST(request: NextRequest) {
  try {
    const { grammar_info, arabic_word, verse_context } = await request.json();

    if (!grammar_info || !arabic_word) {
      return NextResponse.json(
        { error: "grammar_info and arabic_word are required" },
        { status: 400 }
      );
    }

    if (!process.env.MISTRAL_API_KEY) {
      return NextResponse.json(
        { error: "MISTRAL_API_KEY is not configured" },
        { status: 500 }
      );
    }

    // Check for compound words (multiple parts of speech)
    const featuresArray = Array.isArray((grammar_info as any).features) ? (grammar_info as any).features : [];
    const hasUnderscoreCompound = grammar_info.part_of_speech && grammar_info.part_of_speech.includes('_');
    const distinctPOS = new Set<string>();
    if (featuresArray.length > 0) {
      featuresArray.forEach((f: string) => {
        const fLower = f.toLowerCase().trim();
        // Use exact matches to avoid substring matches
        // CRITICAL: "pronoun" contains "noun", so we must check "pronoun" FIRST, then "noun"
        // Otherwise "pronoun" will match both checks
        if (fLower === 'pronoun' || fLower === 'pronouns') {
          distinctPOS.add('pronoun');
        } else if (fLower === 'noun' || fLower === 'nouns') {
          distinctPOS.add('noun');
        } else if (fLower === 'preposition' || fLower === 'prepositions') {
          distinctPOS.add('preposition');
        } else if (fLower === 'verb' || fLower === 'verbs') {
          distinctPOS.add('verb');
        } else if (fLower === 'conjunction' || fLower === 'conjunctions') {
          distinctPOS.add('conjunction');
        }
      });
    }
    const isCompoundWord = hasUnderscoreCompound || distinctPOS.size > 1;
    // A pronoun suffix only exists when it's a compound word AND contains a pronoun
    // Standalone pronouns (like هُمۡ) should NOT be considered "pronoun suffixes"
    const hasPronounSuffix = isCompoundWord && distinctPOS.has('pronoun');
    const isNounPronounCompound = (hasUnderscoreCompound && grammar_info.part_of_speech.includes('noun') && grammar_info.part_of_speech.includes('pronoun')) ||
      (distinctPOS.has('noun') && distinctPOS.has('pronoun'));

    // Build the subheading that will be displayed (same logic as components)
    let grammarSubheading = '';
    if (isCompoundWord) {
      const parts: string[] = [];
      if (hasUnderscoreCompound) {
        const posParts = grammar_info.part_of_speech.split('_');
        posParts.forEach((pos: string) => {
          const posFormatted = pos.charAt(0).toUpperCase() + pos.slice(1).toLowerCase();
          parts.push(posFormatted);
        });
      } else {
        const posArray = Array.from(distinctPOS);
        posArray.sort((a, b) => {
          if (a === 'noun' && b !== 'noun') return -1;
          if (a !== 'noun' && b === 'noun') return 1;
          if (a === 'pronoun' && b !== 'pronoun' && b !== 'noun') return -1;
          if (a !== 'pronoun' && a !== 'noun' && b === 'pronoun') return 1;
          return 0;
        });
        posArray.forEach((pos: string) => {
          const posFormatted = pos.charAt(0).toUpperCase() + pos.slice(1).toLowerCase();
          parts.push(posFormatted);
        });
      }
      grammarSubheading = parts.join(', ');
    } else {
      grammarSubheading = grammar_info.part_of_speech || 'Grammar point';
    }

    // Diagnostic logging - AFTER grammarSubheading is calculated
    console.log('=== COMPOUND WORD DETECTION DEBUG ===');
    console.log('Word:', arabic_word);
    console.log('Full grammar_info:', JSON.stringify(grammar_info, null, 2));
    console.log('part_of_speech:', grammar_info.part_of_speech);
    console.log('features:', featuresArray);
    console.log('hasUnderscoreCompound:', hasUnderscoreCompound);
    console.log('distinctPOS:', Array.from(distinctPOS));
    console.log('isCompoundWord:', isCompoundWord);
    console.log('isNounPronounCompound:', isNounPronounCompound);
    console.log('grammarSubheading:', grammarSubheading);
    console.log('====================================');

    // Build a focused prompt for the grammar tutorial
    const grammarSummary = [
      grammar_info.part_of_speech && `Part of speech: ${grammar_info.part_of_speech}`,
      isCompoundWord && `COMPOUND WORD: This word consists of multiple grammatical parts`,
      hasPronounSuffix && `PRONOUN SUFFIX: This word has an attached pronoun suffix (like ـه، ـها، ـهم، ـك، etc.)`,
      grammar_info.case && `Case: ${grammar_info.case}`,
      grammar_info.definiteness && `Definiteness: ${grammar_info.definiteness}`,
      grammar_info.number && `Number: ${grammar_info.number}`,
      grammar_info.gender && `Gender: ${grammar_info.gender}`,
      grammar_info.form && `Verb form: ${grammar_info.form} (Arabic verb forms I-X, each with distinct meanings and patterns)`,
      grammar_info.aspect && `Tense: ${grammar_info.aspect === 'perfect' ? 'perfect tense (past tense, completed action)' : grammar_info.aspect === 'imperfect' ? 'imperfect tense (present/future tense, ongoing or incomplete action)' : 'imperative tense (command form)'}`,
      grammar_info.tense && `Tense: ${grammar_info.tense}`,
      grammar_info.person && `Person: ${grammar_info.person}`,
      grammar_info.mood && `Mood: ${grammar_info.mood}`,
      grammar_info.voice && `Voice: ${grammar_info.voice}`,
      grammar_info.notes && `Notes: ${grammar_info.notes}`,
    ]
      .filter(Boolean)
      .join(", ");

    // Prepare word data for helper functions
    const word_data = {
      text_arabic: arabic_word,
      translation_english: (verse_context as any)?.translation_english || '',
      grammar_info: grammar_info,
      is_compound: isCompoundWord,
      has_pronoun_suffix: hasPronounSuffix
    };

    // Get translation if available from verse context
    const translation_english = (verse_context as any)?.translation_english || '';
    const surah_name = verse_context?.surah_name || (verse_context?.surah_number ? `Surah ${verse_context.surah_number}` : '');

    const prompt = `You are teaching Quranic Arabic grammar to English-speaking beginners. Explain this grammar concept clearly and accurately.

WORD DETAILS:
- Arabic: ${arabic_word}
${translation_english ? `- Translation: ${translation_english}` : ''}
- Classification: ${grammarSubheading}
- Grammar Details: ${grammarSummary}
${verse_context ? `- Verse Context: This word appears in ${surah_name}${verse_context.verse_number ? `, Verse ${verse_context.verse_number}` : ''}` : ''}
${verse_context?.full_verse_text ? `- Full verse: ${verse_context.full_verse_text}` : ''}

CRITICAL TRANSLATION RULE:
- Translate Arabic words by their BASE MEANING ONLY, without adding English prepositions
- Do NOT translate genitive case nouns with 'of' prepended
- Do NOT translate accusative case nouns with prepositions
- The grammatical case (genitive, accusative, nominative) should be explained separately from the word's meaning

Examples:
✅ CORRECT: اللَّهِ → 'Allah' (in genitive case due to preceding preposition)
❌ WRONG: اللَّهِ → 'of Allah'

✅ CORRECT: ٱلرَّحۡمَـٰنِ → 'the Most Gracious' (in genitive case)
❌ WRONG: ٱلرَّحۡمَـٰنِ → 'of the Most Gracious'

Format explanations as:
- Word meaning: [base translation]
- Grammatical note: [explain the case and why]

The genitive/possessive relationship is already indicated by the context (e.g., following a preposition like بِسْمِ). Keep translations clean and direct: translate the word itself, then explain the grammatical case separately.

${buildCompoundWordInstruction(word_data)}
${buildContextualGuidance(verse_context, grammar_info)}

STRUCTURE YOUR EXPLANATION (3 paragraphs, NO HEADINGS):

Write three paragraphs without any headings, labels, or section titles. Do NOT include "Paragraph 1", "Paragraph 2", "Paragraph 3", or any similar labels in your response.

**First paragraph (NO HEADING):**
- Start with what this word means in THIS verse
- Use the format: "Word meaning: [base translation]" followed by "Grammatical note: [explain the case and why]"
- Break down its components:
  * If it has ال (definite article): mention it separately
  * Show the root/stem meaning
  * Identify endings (plural markers, case endings, pronouns)
- Explain the grammatical classification in context
- Remember: Translate the BASE MEANING only, then explain the grammatical case separately

**Second paragraph (NO HEADING):**
- Explain WHY it has this form (what grammatical role it plays)
- Give 2-3 similar examples from the Quran using this same pattern
  * Format: "المؤمنون (al-mu'minoon, 'the believers'), الظالمون (adh-dhalimoon, 'the wrongdoers')"
- Show how recognizing this pattern helps with future reading

**Third paragraph (NO HEADING):**
- Give ONE clear, actionable tip for spotting this pattern
- Keep it simple and memorable
- Focus on visual/auditory markers learners can quickly identify

CRITICAL: Do NOT include any headings like "Paragraph 1 - WHAT & WHERE:" or similar labels. Write the paragraphs directly without any section titles.

WORD BREAKDOWN REQUIREMENTS:
- For words with ال: ALWAYS mention the definite article separately
- For plural nouns: ALWAYS identify the specific plural pattern:
  * Sound masculine plural: ون/ين endings (NOT nunation)
  * Sound feminine plural: ات ending
  * Broken/irregular plurals: explain the pattern change
- For derived words: Show root letters when relevant (e.g., ك-ف-ر for كافر)
- For compound words: Break down each component with its meaning

TERMINOLOGY ACCURACY:
- Sound masculine plural = ون (nominative) or ين (genitive/accusative) - NOT nunation
- Nunation (tanween) = ONLY double diacritics ً ٌ ٍ
- Nominative case = subject or predicate, marked by -u (damma ُ) or -un (tanween ٌ)
- Genitive case = after prepositions or in possessive constructions, marked by -i (kasra ِ)
- Accusative case = direct object, marked by -a (fatha َ)
- Vocative = addressing/calling someone (after يَا)

PATTERN RECOGNITION:
After explaining THIS word, give 2-3 similar examples from the Quran that use the same grammatical pattern. This helps learners recognize the pattern in future verses.

Example: "You'll see this same ون ending in المؤمنون (al-mu'minoon, 'the believers'), المسلمون (al-muslimoon, 'the Muslims'), الظالمون (adh-dhalimoon, 'the wrongdoers')."

CONTEXT INTEGRATION:
- Start with what the word MEANS and DOES in this verse
- Then explain the grammar that creates that meaning
- Don't start with generic textbook definitions
- Connect grammar to actual usage immediately

STYLE REQUIREMENTS:
- Write in a conversational but precise tone
- No preambles ("Here's...", "Certainly!", "Let me explain...")
- Start directly with the word and its meaning
- Use accessible language while maintaining technical accuracy
- For diacritics in explanations: write "-i" (kasra), "-a" (fatha), "-u" (damma)
- Never use isolated Arabic diacritic marks (ِ َ ُ) in running text
- Use "tense" not "aspect" (e.g., "perfect tense" not "perfect aspect")

Begin your explanation now:`;

    // Log the prompt for debugging
    console.log('=== PROMPT DEBUG ===');
    console.log('Word:', arabic_word);
    console.log('Is compound:', isCompoundWord);
    console.log('Has pronoun suffix:', hasPronounSuffix);
    console.log('==================');

    const mistral = await getMistralClient();
    const response = await mistral.chat.complete({
      model: "mistral-small-latest",
      messages: [
        {
          role: "user",
          content: prompt,
        },
      ],
      maxTokens: 500,
      temperature: 0.7,
    });

    let explanation: string = "Unable to generate explanation.";
    const content = response.choices[0]?.message?.content;

    // Ensure explanation is a string
    if (typeof content === 'string') {
      explanation = content;
    } else if (Array.isArray(content)) {
      // If it's an array of ContentChunk, convert to string
      explanation = content.map(chunk => {
        if (typeof chunk === 'string') return chunk;
        if (chunk && typeof chunk === 'object' && 'text' in chunk) {
          return (chunk as { text?: string }).text || '';
        }
        return '';
      }).join('');
    }

    // Remove common introductory phrases
    explanation = explanation
      .replace(/^(Certainly!|Here's|Let me|I'll|I can|I'd like to|Allow me to)[^:]*:\s*/i, '')
      .replace(/^(Here's a simple breakdown|Let me explain|I'll explain|I can explain)[^:]*:\s*/i, '')
      .trim();

    // Remove paragraph headings (e.g., "Paragraph 1 - WHAT & WHERE:", "**Paragraph 1 - WHAT & WHERE:**", etc.)
    explanation = explanation
      .replace(/^\*\*?Paragraph\s+\d+\s*[-–—]\s*[^*\n]+:\*\*?\s*/gim, '')
      .replace(/^Paragraph\s+\d+\s*[-–—]\s*[^\n]+:\s*/gim, '')
      .replace(/^\*\*?[^*\n]*Paragraph\s+\d+[^*\n]*:\*\*?\s*/gim, '')
      .trim();

    // Fix isolated Arabic diacritics that appear after hyphens/dashes
    explanation = explanation
      .replace(/"-(\u064E|\u064F|\u0650|\u0651|\u0652|\u064B|\u064C|\u064D)"/g, (match: string, diacritic: string) => {
        const map: Record<string, string> = {
          '\u064E': '-a',  // fatha
          '\u064F': '-u',  // damma
          '\u0650': '-i',  // kasra
          '\u0651': '',    // shadda (remove)
          '\u0652': '',    // sukun (remove)
          '\u064B': '-an', // fathatan
          '\u064C': '-un', // dammatan
          '\u064D': '-in', // kasratan
        };
        return `"${map[diacritic] || ''}"`;
      })
      .replace(/-(\u064E|\u064F|\u0650|\u0651|\u0652|\u064B|\u064C|\u064D)/g, (match: string, diacritic: string) => {
        const map: Record<string, string> = {
          '\u064E': '-a',  // fatha
          '\u064F': '-u',  // damma
          '\u0650': '-i',  // kasra
          '\u0651': '',    // shadda (remove)
          '\u0652': '',    // sukun (remove)
          '\u064B': '-an', // fathatan
          '\u064C': '-un', // dammatan
          '\u064D': '-in', // kasratan
        };
        return map[diacritic] || '';
      });

    return NextResponse.json({ explanation });
  } catch (error: any) {
    console.error("Error generating grammar tutorial:", error);
    return NextResponse.json(
      { error: error.message || "Failed to generate grammar tutorial" },
      { status: 500 }
    );
  }
}