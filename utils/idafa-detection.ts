/**
 * Utility functions to detect idafa (إضافة) constructions
 * Idafa is a possessive construction where:
 * - First word (mudaf) is indefinite or lacks definite article
 * - Second word (mudaf ilayhi) is in genitive case
 * - The relationship is possessive: "X of Y" or "Y's X"
 */

export interface IdafaRelationship {
  isIdafa: boolean;
  isMudaf?: boolean; // Is this word the first term (mudaf)?
  isMudafIlayhi?: boolean; // Is this word the second term (mudaf ilayhi)?
  mudafWord?: string; // The mudaf (first term) if this is mudaf ilayhi
  mudafIlayhiWord?: string; // The mudaf ilayhi (second term) if this is mudaf
}

/**
 * Checks if a word is in an idafa construction
 * @param wordText - The Arabic text of the word to check
 * @param wordPosition - Position of the word in the verse (1-indexed)
 * @param surroundingWords - Array of surrounding words with their Arabic text, position, and grammar info
 * @param grammarInfo - Grammar info for the current word
 * @returns IdafaRelationship object
 */
export function detectIdafa(
  wordText: string,
  wordPosition: number,
  surroundingWords: Array<{
    text_arabic: string;
    word_position: number;
    grammar_info?: any;
  }>,
  grammarInfo?: any
): IdafaRelationship {
  // Check if current word is genitive
  const isGenitive = grammarInfo?.case === 'genitive' ||
    (Array.isArray(grammarInfo?.features) &&
      grammarInfo.features.some((f: string) =>
        f?.toLowerCase().includes('genitive')));

  if (!isGenitive) {
    return { isIdafa: false };
  }

  // Check if previous word is mudaf (indefinite noun or lacks definite article)
  const previousWord = surroundingWords.find(
    w => w.word_position === wordPosition - 1
  );

  if (!previousWord) {
    return { isIdafa: false };
  }

  const prevGrammarInfo = previousWord.grammar_info;
  const prevIsNoun = prevGrammarInfo?.part_of_speech?.toLowerCase().includes('noun') ||
    prevGrammarInfo?.part_of_speech?.toLowerCase() === 'noun';

  if (!prevIsNoun) {
    return { isIdafa: false };
  }

  // Check if previous word is indefinite (mudaf characteristics):
  // 1. Lacks definite article (ال)
  // 2. May have tanween (but mudaf often lacks tanween)
  // 3. Is in accusative or nominative case (not genitive)
  const prevIsDefinite = prevGrammarInfo?.definiteness === 'definite' ||
    previousWord.text_arabic.startsWith('ال') ||
    previousWord.text_arabic.startsWith('ٱل') ||
    previousWord.text_arabic.startsWith('أل');

  const prevCase = prevGrammarInfo?.case ||
    (Array.isArray(prevGrammarInfo?.features) &&
      prevGrammarInfo.features.find((f: string) =>
        f?.toLowerCase().includes('nominative') ||
        f?.toLowerCase().includes('accusative') ||
        f?.toLowerCase().includes('genitive')));

  // Mudaf is typically indefinite and in accusative or nominative
  // Mudaf ilayhi is genitive
  const prevIsAccusative = prevCase?.toLowerCase() === 'accusative' ||
    prevCase?.toLowerCase().includes('accusative');
  const prevIsNominative = prevCase?.toLowerCase() === 'nominative' ||
    prevCase?.toLowerCase().includes('nominative');

  // If previous word is indefinite and in accusative/nominative, and current is genitive
  // This is likely an idafa construction
  if (!prevIsDefinite && (prevIsAccusative || prevIsNominative)) {
    return {
      isIdafa: true,
      isMudaf: false,
      isMudafIlayhi: true,
      mudafWord: previousWord.text_arabic,
      mudafIlayhiWord: wordText
    };
  }

  // Also check if current word could be mudaf (followed by a genitive word)
  const nextWord = surroundingWords.find(
    w => w.word_position === wordPosition + 1
  );

  if (nextWord) {
    const nextGrammarInfo = nextWord.grammar_info;
    const nextIsGenitive = nextGrammarInfo?.case === 'genitive' ||
      (Array.isArray(nextGrammarInfo?.features) &&
        nextGrammarInfo.features.some((f: string) =>
          f?.toLowerCase().includes('genitive')));

    const currentIsNoun = grammarInfo?.part_of_speech?.toLowerCase().includes('noun') ||
      grammarInfo?.part_of_speech?.toLowerCase() === 'noun';

    const currentIsDefinite = grammarInfo?.definiteness === 'definite' ||
      wordText.startsWith('ال') ||
      wordText.startsWith('ٱل') ||
      wordText.startsWith('أل');

    // If current word is indefinite noun and next is genitive, current is mudaf
    if (currentIsNoun && !currentIsDefinite && nextIsGenitive) {
      return {
        isIdafa: true,
        isMudaf: true,
        isMudafIlayhi: false,
        mudafWord: wordText,
        mudafIlayhiWord: nextWord.text_arabic
      };
    }
  }

  return { isIdafa: false };
}

/**
 * Checks if a word follows a preposition (which would make it genitive)
 * @param wordPosition - Position of the word in the verse
 * @param surroundingWords - Array of surrounding words
 * @returns The preposition text if found, null otherwise
 */
export function detectPreposition(
  wordPosition: number,
  surroundingWords: Array<{
    text_arabic: string;
    word_position: number;
    grammar_info?: any;
  }>
): string | null {
  const previousWord = surroundingWords.find(
    w => w.word_position === wordPosition - 1
  );

  if (!previousWord) {
    return null;
  }

  const prevText = previousWord.text_arabic.trim();
  const prevGrammarInfo = previousWord.grammar_info;

  // Common prepositions that take genitive
  const prepositions = [
    'بِ', 'بِسْمِ', 'بِسۡمِ', // bi (in, with)
    'فِي', 'فِي', // fi (in)
    'مِن', 'مِن', // min (from)
    'إِلَى', 'إِلَى', 'إِلَي', // ila (to)
    'عَلَى', 'عَلَى', 'عَلَي', // ala (on)
    'عَن', 'عَن', // an (about)
    'لِ', 'لِ', // li (for, to)
    'كَ', 'كَ', // ka (like)
    'مَع', 'مَع', // maa (with)
    'حَتَّى', 'حَتَّى', // hatta (until)
    'مُذ', 'مُذ', // mudh (since)
    'مُنذ', 'مُنذ', // mundh (since)
  ];

  // Check if previous word is a preposition
  const isPreposition = prepositions.some(prep => prevText === prep || prevText.startsWith(prep)) ||
    prevGrammarInfo?.part_of_speech?.toLowerCase() === 'preposition' ||
    prevGrammarInfo?.part_of_speech?.toLowerCase().includes('preposition');

  if (isPreposition) {
    return prevText;
  }

  return null;
}

/**
 * Generates explanation for why a word is in genitive case
 * Priority: 1) Idafa (mudaf ilayhi), 2) Preposition, 3) Other
 */
export function explainGenitiveCase(
  wordText: string,
  wordPosition: number,
  surroundingWords: Array<{
    text_arabic: string;
    word_position: number;
    grammar_info?: any;
    translation_english?: string;
  }>,
  grammarInfo?: any,
  verseTranslation?: string
): string {
  // First check: Is it mudaf ilayhi in idafa?
  const idafa = detectIdafa(wordText, wordPosition, surroundingWords, grammarInfo);
  
  if (idafa.isIdafa && idafa.isMudafIlayhi && idafa.mudafWord) {
    // Get translations if available
    const mudafTranslation = surroundingWords.find(
      w => w.text_arabic === idafa.mudafWord
    )?.translation_english || idafa.mudafWord;
    
    const mudafIlayhiTranslation = surroundingWords.find(
      w => w.text_arabic === wordText
    )?.translation_english || wordText;

    return `This word is genitive (majrur) because it is the mudaf ilayhi (second term) in the possessive construction '${idafa.mudafWord} ${wordText}' (${mudafTranslation} of ${mudafIlayhiTranslation}).`;
  }

  // Second check: Does it follow a preposition?
  const preposition = detectPreposition(wordPosition, surroundingWords);
  
  if (preposition) {
    return `This word is genitive (majrur) because it follows the preposition '${preposition}'.`;
  }

  // Other reasons (less common)
  return `This word is in genitive case (majrur).`;
}

