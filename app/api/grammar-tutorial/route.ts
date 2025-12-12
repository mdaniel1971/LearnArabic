import { NextRequest, NextResponse } from "next/server";

// Initialize Mistral client dynamically to avoid issues with serverless functions
async function getMistralClient() {
  const { Mistral } = await import("@mistralai/mistralai");
  return new Mistral({
    apiKey: process.env.MISTRAL_API_KEY || "",
  });
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
    const hasPronounSuffix = hasUnderscoreCompound && grammar_info.part_of_speech.includes('pronoun') || distinctPOS.has('pronoun');
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

    // Build a focused prompt for the grammar explanation
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

    // Build context information if available
    let contextInfo = '';
    if (verse_context) {
      const { surah_number, verse_number, surrounding_words, full_verse_text } = verse_context;
      contextInfo = `\n\nCONTEXT (You must consider this when explaining meaning):`;
      if (surah_number && verse_number) {
        contextInfo += `\n- Location: Surah ${surah_number}, Verse ${verse_number}`;
      }
      if (full_verse_text) {
        contextInfo += `\n- Full verse: ${full_verse_text}`;
      }
      if (surrounding_words && surrounding_words.length > 0) {
        contextInfo += `\n- Surrounding words: ${surrounding_words.map((w: any) => w.text_arabic || w).join(' ')}`;

        // Check for negation particles
        const negationParticles = ['مَا', 'لَا', 'لَمْ', 'لَنْ', 'لَن', 'لِيس', 'لَيْسَ'];
        const hasNegation = surrounding_words.some((w: any) => {
          const text = (w.text_arabic || w || '').trim();
          return negationParticles.some(neg => text.includes(neg) || text === neg);
        });

        if (hasNegation) {
          contextInfo += `\n- IMPORTANT: This word is preceded by a negation particle. The meaning is NEGATED. You must explain the negated meaning, not just the base meaning.`;
        }
      }
      contextInfo += '\n';
    }

    // Build the instruction for compound words
    let compoundInstruction = '';
    if (isNounPronounCompound) {
      compoundInstruction = `
This is a COMPOUND WORD with a noun + pronoun suffix.

START YOUR EXPLANATION LIKE THIS:
"This consists of two parts: the noun [STEM_ARABIC] ([transliteration], meaning '[meaning]') + the pronoun suffix [SUFFIX_ARABIC] ([transliteration], meaning '[meaning]'). Together they mean '[combined_meaning]'."

For example, if the word is زِلۡزَالَهَا:
"This consists of two parts: the noun زِلۡزَال (zilzaal, meaning 'shaking/quaking') + the pronoun suffix ـهَا (-haa, meaning 'its/her'). Together they mean 'its shaking'."

Then explain:
- What the noun stem means
- What the pronoun suffix means  
- How they work together grammatically

DO NOT say "${arabic_word} is a noun" - that's incorrect. It's a noun WITH an attached pronoun suffix.`;
    } else if (isCompoundWord) {
      compoundInstruction = `
This is a COMPOUND WORD with multiple parts of speech.

START YOUR EXPLANATION LIKE THIS:
"This consists of two parts: [TYPE1] [ARABIC1] ([transliteration], meaning '[meaning]') + [TYPE2] [ARABIC2] ([transliteration], meaning '[meaning]'). Together they mean '[combined_meaning]'."

Then explain each part and how they combine.`;
    }

    const prompt = `You are teaching Quranic Arabic grammar to beginners. Explain this grammar concept clearly and conversationally.

WORD: ${arabic_word}
GRAMMAR CLASSIFICATION: ${grammarSubheading}
DETAILS: ${grammarSummary}${contextInfo}
${compoundInstruction}

Write a beginner-friendly explanation (2-3 short paragraphs) that:
${isCompoundWord ?
        `- Starts by explaining this is a compound with multiple parts (follow the format above)
- Breaks down each part with its meaning
- Explains how the parts combine` :
        `- Explains what "${grammarSubheading}" means in simple terms
- Shows how it applies to "${arabic_word}"${verse_context ? ' in context' : ''}
- Gives a practical tip for recognizing this grammar pattern`}
${verse_context?.surrounding_words?.some((w: any) => {
          const text = (w.text_arabic || w || '').trim();
          return ['مَا', 'لَا', 'لَمْ', 'لَنْ', 'لَن', 'لِيس', 'لَيْسَ'].some(neg => text.includes(neg) || text === neg);
        }) ? `
- IMPORTANT: There's a negation particle (مَا, لَا, لَمْ, etc.) before this word. Explain the NEGATED meaning.` : ''}
${grammar_info.voice === 'passive' ? `
- IMPORTANT: This is a passive verb. Explain what passive voice means (the subject receives the action).` : ''}
${grammar_info.form ? `
- IMPORTANT: Explain what Form ${grammar_info.form} means for this verb. Arabic verb forms (I-X) have specific meanings:
  • Form I: Basic meaning
  • Form II: Intensive/causative  
  • Form III: Reciprocal/attempting
  • Form IV: Causative
  • Form V-X: Various reflexive, reciprocal, and derived meanings` : ''}

STYLE GUIDELINES:
- Start directly with the explanation (no "Certainly!" or "Here's..." preambles)
- Use "tense" not "aspect" (e.g., "perfect tense" not "perfect aspect")
- For diacritics, write "-i" (kasra), "-a" (fatha), "-u" (damma) - never use isolated Arabic diacritic marks
- Keep it conversational and practical

Begin your explanation now:`;

    // Log the compound instruction to see if it's being triggered
    console.log('=== PROMPT DEBUG ===');
    console.log('compoundInstruction length:', compoundInstruction.length);
    console.log('compoundInstruction preview:', compoundInstruction.substring(0, 200));
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

    let explanation = response.choices[0]?.message?.content || "Unable to generate explanation.";

    // Remove common introductory phrases
    explanation = explanation
      .replace(/^(Certainly!|Here's|Let me|I'll|I can|I'd like to|Allow me to)[^:]*:\s*/i, '')
      .replace(/^(Here's a simple breakdown|Let me explain|I'll explain|I can explain)[^:]*:\s*/i, '')
      .trim();

    // Fix isolated Arabic diacritics that appear after hyphens/dashes
    explanation = explanation
      .replace(/"-(\u064E|\u064F|\u0650|\u0651|\u0652|\u064B|\u064C|\u064D)"/g, (match, diacritic) => {
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
      .replace(/-(\u064E|\u064F|\u0650|\u0651|\u0652|\u064B|\u064C|\u064D)/g, (match, diacritic) => {
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
      { error: error.message || "Failed to generate grammar explanation" },
      { status: 500 }
    );
  }
}