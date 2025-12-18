import { NextRequest, NextResponse } from "next/server";
import { detectIdafa, detectPreposition, explainGenitiveCase } from "@/utils/idafa-detection";
import { generateWithGemini } from "@/lib/gemini";

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

  // Check for verb form - only for actual verbs, not adjectives derived from verbs
  if (grammar_info?.form) {
    const partOfSpeech = grammar_info?.part_of_speech?.toLowerCase() || '';
    const isVerb = partOfSpeech === 'verb' || partOfSpeech.includes('verb');
    const isAdjective = partOfSpeech === 'adjective' || partOfSpeech.includes('adjective');

    const formNum = typeof grammar_info.form === 'string' ? parseInt(grammar_info.form.replace(/[^0-9]/g, '')) : grammar_info.form;
    if (!isNaN(formNum)) {
      if (isVerb) {
        const formMeaning = getFormMeaning(formNum);
        guidance.push(`⚠️ VERB FORM ${formNum}: Explain this form's special meaning: ${formMeaning}`);
      } else if (isAdjective) {
        const formMeaning = getFormMeaning(formNum);
        guidance.push(`⚠️ ADJECTIVE DERIVED FROM FORM ${formNum} VERB: This is an active participle or verbal noun derived from a Form ${formNum} verb. Explain that it's not a verb itself, but a noun/adjective derived from the verb pattern. The Form ${formNum} meaning is: ${formMeaning}`);
      }
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

    if (!process.env.GOOGLE_GEMINI_API_KEY) {
      return NextResponse.json(
        { error: "GOOGLE_GEMINI_API_KEY is not configured" },
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
    const partOfSpeech = grammar_info.part_of_speech?.toLowerCase() || '';
    const isVerb = partOfSpeech === 'verb' || partOfSpeech.includes('verb');
    const isAdjective = partOfSpeech === 'adjective' || partOfSpeech.includes('adjective');

    const grammarSummary = [
      grammar_info.part_of_speech && `Part of speech: ${grammar_info.part_of_speech}`,
      isCompoundWord && `COMPOUND WORD: This word consists of multiple grammatical parts`,
      hasPronounSuffix && `PRONOUN SUFFIX: This word has an attached pronoun suffix (like ـه، ـها، ـهم، ـك، etc.)`,
      grammar_info.case && `Case: ${grammar_info.case}`,
      grammar_info.definiteness && `Definiteness: ${grammar_info.definiteness}`,
      grammar_info.number && `Number: ${grammar_info.number}`,
      grammar_info.gender && `Gender: ${grammar_info.gender}`,
      // Only show "Verb form" if it's actually a verb
      grammar_info.form && isVerb && `Verb form: ${grammar_info.form} (Arabic verb forms I-X, each with distinct meanings and patterns)`,
      // For adjectives derived from verbs (like active participles), show the form differently
      grammar_info.form && isAdjective && `Derived from Form ${grammar_info.form} verb (this is an active participle or verbal noun, not a verb itself)`,
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
    const verse_phrase = verse_context?.full_verse_text || arabic_word;

    // Detect idafa relationship if word is genitive
    let idafaInstruction = '';
    const isGenitive = grammar_info?.case === 'genitive' ||
      (Array.isArray(grammar_info?.features) &&
        grammar_info.features.some((f: string) =>
          f?.toLowerCase().includes('genitive')));

    if (isGenitive && verse_context?.surrounding_words && verse_context?.word_position) {
      const surroundingWords = (verse_context.surrounding_words || []).map((w: any) => ({
        text_arabic: w.text_arabic || w,
        word_position: w.word_position || 0,
        grammar_info: w.grammar_info || null,
        translation_english: w.translation_english || null
      }));

      const idafa = detectIdafa(
        arabic_word,
        verse_context.word_position,
        surroundingWords,
        grammar_info
      );

      const preposition = detectPreposition(verse_context.word_position, surroundingWords);

      if (idafa.isIdafa && idafa.isMudafIlayhi && idafa.mudafWord) {
        // Word is mudaf ilayhi in idafa construction
        const mudafTranslation = surroundingWords.find(
          (w: any) => w.text_arabic === idafa.mudafWord
        )?.translation_english || idafa.mudafWord;

        idafaInstruction = `\n⚠️ CRITICAL IDAFA DETECTION:\nThis word (${arabic_word}) is in genitive case because it is the MUDAF ILAYHI (second term) in the idafa (possessive) construction '${idafa.mudafWord} ${arabic_word}' (${mudafTranslation} of [meaning]).\n\nDO NOT say it is genitive because of إِنَّ or any other particle. The genitive case is due to the idafa relationship, NOT because of particles that affect the mudaf (first term).\n\nWhen إِنَّ (or its sisters) appears before an idafa, it affects the mudaf (first term), making it accusative. The mudaf ilayhi (second term) is ALWAYS genitive because of the idafa relationship itself.\n\nExample: In 'إِنَّ يَوۡمَ ٱلۡفَصۡلِ', إِنَّ makes يَوۡمَ accusative (ism inna), but ٱلۡفَصۡلِ is genitive because it is mudaf ilayhi in the idafa 'يَوۡمَ ٱلۡفَصۡلِ' (day of judgment), NOT because of إِنَّ.\n\n`;
      } else if (preposition) {
        // Word follows a preposition
        idafaInstruction = `\n⚠️ PREPOSITION DETECTION:\nThis word (${arabic_word}) is in genitive case because it follows the preposition '${preposition}'.\n\n`;
      }
    }

    // Extract and normalize form number from grammar_info
    let formNumber: number | null = null;
    if (grammar_info?.form) {
      const formNum = typeof grammar_info.form === 'string'
        ? parseInt(grammar_info.form.replace(/[^0-9]/g, ''))
        : grammar_info.form;
      if (!isNaN(formNum) && formNum >= 1 && formNum <= 10) {
        formNumber = formNum;
      }
    }

    // Global instruction for all grammar tutorial prompts
    const globalInstruction = "IMPORTANT: When providing Quranic examples with translations, always give natural, grammatically correct English translations. Do NOT provide word-for-word literal translations that sound awkward. The translation should read fluently as proper English.\n\n";

    // Build form number instruction if form is available
    let formInstruction = '';
    if (formNumber !== null) {
      const formRoman = ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X'][formNumber - 1];
      if (isVerb) {
        formInstruction = `\nCRITICAL FORM INFORMATION:\nThe verb form for ${arabic_word} is Form ${formRoman} (Form ${formNumber}). You MUST use this exact form number in your explanation. Do NOT analyze or determine the form yourself - use the form number provided. This is stored in the database and is authoritative.\n\n`;
      } else if (isAdjective) {
        formInstruction = `\nCRITICAL FORM INFORMATION:\nThe word ${arabic_word} is derived from Form ${formRoman} (Form ${formNumber}) verb. You MUST use this exact form number when explaining the derivation. Do NOT analyze or determine the form yourself - use the form number provided. This is stored in the database and is authoritative.\n\n`;
      } else {
        // For other parts of speech that might have a form (like verbal nouns)
        formInstruction = `\nCRITICAL FORM INFORMATION:\nThe word ${arabic_word} is related to Form ${formRoman} (Form ${formNumber}). You MUST use this exact form number in your explanation. Do NOT analyze or determine the form yourself - use the form number provided. This is stored in the database and is authoritative.\n\n`;
      }
    }

    // Advanced prompt only
    const grammarConcept = grammarSubheading;
    const prompt = globalInstruction + formInstruction + idafaInstruction + `You are teaching Quranic Arabic to an advanced learner seeking scholarly depth.

Provide a comprehensive explanation of ${grammarConcept}:
- Use classical Arabic grammatical terminology (nahw/sarf)
${formNumber !== null ? `- ${isVerb ? 'This is' : isAdjective ? 'This word is derived from' : 'This word is related to'} Form ${['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X'][formNumber - 1]} (Form ${formNumber}). You MUST use this exact form number. Use both Western and Arabic terminology (e.g., Form ${['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X'][formNumber - 1]}/[Arabic term])` : '- If this is a verb or derived from a verb, identify its form (I-X) using both Western and Arabic terminology (e.g., Form IV/الإفعال)'}
${formNumber !== null && isAdjective ? `- ALWAYS state explicitly: "${arabic_word} is an Active Participle (or verbal noun) derived from Form ${['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X'][formNumber - 1]} (Form ${formNumber})"` : formNumber === null ? '- ALWAYS include information on what verb form the word is derived from where possible. For example, if it is an Active Participle derived from Form X, state: "is an Active Participle derived from Form X". If it is a verbal noun (masdar) or other derivative, identify the source verb form.' : ''}
- Explain linguistic reasoning and etymology where relevant
- Provide 3-4 examples from different Quranic contexts showing nuance
- Discuss rhetorical significance (balagha) where applicable
- Reference classical grammar rules (عامل patterns, إعراب)

Word being studied: ${arabic_word}
Translation: ${translation_english}
Context: ${verse_phrase}

Write TWO SHORT PARAGRAPHS maximum. Use bullet points where possible. Treat the learner as a serious student.

CRITICAL: Do NOT include patronizing messages, encouragement phrases, or emojis. Do NOT write things like "Keep practicing—you're doing great! 😊" or similar motivational messages. Focus purely on the grammar explanation.

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

${buildCompoundWordInstruction(word_data)}
${buildContextualGuidance(verse_context, grammar_info)}`;

    // Log the prompt for debugging
    console.log('=== PROMPT DEBUG ===');
    console.log('Word:', arabic_word);
    console.log('Is compound:', isCompoundWord);
    console.log('Has pronoun suffix:', hasPronounSuffix);
    console.log('==================');

    // Call Google Gemini API
    let explanation: string = "Unable to generate explanation.";
    try {
      const content = await generateWithGemini(prompt, {
        temperature: 0.7,
        maxTokens: 500
      });
      explanation = content;
    } catch (error: any) {
      console.error('Gemini API error:', error);
      throw new Error(`Failed to generate grammar tutorial: ${error.message}`);
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