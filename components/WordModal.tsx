"use client";

import { useState } from "react";
import ArabicText from "./ArabicText";
import GrammarTutorialModal from "./GrammarTutorialModal";
import { Word, GrammarInfo } from "@/types/quran";
import { cleanTranslation } from "@/utils/translation";

interface WordModalProps {
  word: Word;
  children: React.ReactNode;
}

export default function WordModal({ word, children }: WordModalProps) {
  const [isOpen, setIsOpen] = useState(false);
  const [isGrammarTutorialOpen, setIsGrammarTutorialOpen] = useState(false);


  const handleOpenGrammarTutorial = () => {
    if (word.grammar_info) {
      setIsGrammarTutorialOpen(true);
    }
  };

  // Helper function to split compound words and return colored JSX
  const renderColoredArabicWord = (arabicText: string, grammarInfo: GrammarInfo | null): JSX.Element => {
    if (!grammarInfo) {
      return <span>{arabicText}</span>;
    }

    const partOfSpeech = grammarInfo.part_of_speech || '';
    const isCompound = partOfSpeech.includes('_pronoun') ||
      (Array.isArray(grammarInfo.features) &&
        grammarInfo.features.includes('pronoun') &&
        (grammarInfo.features.includes('noun') || grammarInfo.features.includes('verb')));

    if (!isCompound) {
      return <span>{arabicText}</span>;
    }

    // Common Arabic pronoun suffixes (ordered by length to match longer ones first)
    const pronounSuffixes = [
      'هُمْ', 'هُمُ', 'هُمِ', 'هِنَّ', 'هِنِّ', 'هِنْ', // them (plural)
      'كُمْ', 'كُنَّ', 'كُنِّ', 'كُنْ', // you (plural)
      'هَا', 'هَآ', // her/it
      'هُم', 'هُمُ', 'هُمِ', // them (alternative)
      'كَ', 'كِ', 'كُ', // you (singular)
      'ه', 'هُ', 'هِ', // his/it
      'نَا', 'نَآ', // us
      'نِي', 'نِ', // me
      'ي', // I/me (short form)
    ];

    // Try to find and split the suffix
    let stem = arabicText;
    let suffix = '';

    for (const suffixPattern of pronounSuffixes) {
      if (arabicText.endsWith(suffixPattern)) {
        suffix = suffixPattern;
        stem = arabicText.slice(0, arabicText.length - suffixPattern.length);
        break;
      }
    }

    if (suffix) {
      return (
        <>
          <span>{stem}</span>
          <span className="text-primary-600 font-semibold">{suffix}</span>
        </>
      );
    }

    return <span>{arabicText}</span>;
  };

  // Build grammar summary for subtitle (same logic as GrammarTutorialModal)
  const buildGrammarSubtitle = (info: GrammarInfo, arabicText?: string): string => {
    const partOfSpeech = info.part_of_speech || 'Grammar point';
    const posLower = partOfSpeech.toLowerCase();

    // Check for compound words (multiple parts of speech)
    // Method 1: Check if part_of_speech contains underscores (e.g., "noun_pronoun", "preposition_pronoun")
    const hasUnderscoreCompound = partOfSpeech.includes('_');

    // Method 2: Check if features array contains multiple distinct parts of speech
    let featuresArray: string[] = [];
    if (Array.isArray((info as any).features)) {
      featuresArray = (info as any).features;
    }

    // Extract distinct parts of speech from features array
    const distinctPOS = new Set<string>();
    if (featuresArray.length > 0) {
      featuresArray.forEach((f: string) => {
        const fLower = f.toLowerCase();
        // Check for common parts of speech in features
        // CRITICAL: Check "pronoun" FIRST before "noun" to avoid substring match
        // "pronoun" contains "noun", so checking "noun" first would incorrectly match "pronoun"
        const fTrimmed = fLower.trim();
        if (fTrimmed === 'pronoun' || fTrimmed === 'pronouns') {
          distinctPOS.add('Pronoun');
        } else if (fTrimmed === 'noun' || fTrimmed === 'nouns') {
          distinctPOS.add('Noun');
        } else if (fTrimmed === 'preposition' || fTrimmed === 'prepositions') {
          distinctPOS.add('Preposition');
        } else if (fTrimmed === 'verb' || fTrimmed === 'verbs') {
          distinctPOS.add('Verb');
        } else if (fTrimmed === 'conjunction' || fTrimmed === 'conjunctions') {
          distinctPOS.add('Conjunction');
        }
        if (fLower === 'particle' && !distinctPOS.has('Preposition')) distinctPOS.add('Particle');
      });
    }

    // Method 3: Detect pronoun suffixes from Arabic text if not already detected
    // Common pronoun suffixes: ـهَا, ـه, ـهم, ـك, ـكِ, ـكُم, ـنَا, etc.
    const arabicWord = arabicText || word.text_arabic || '';
    const hasPronounSuffix = arabicWord && (
      arabicWord.endsWith('هَا') ||
      arabicWord.endsWith('ه') ||
      arabicWord.endsWith('هم') ||
      arabicWord.endsWith('همُ') ||
      arabicWord.endsWith('همِ') ||
      arabicWord.endsWith('ك') ||
      arabicWord.endsWith('كِ') ||
      arabicWord.endsWith('كَ') ||
      arabicWord.endsWith('كُم') ||
      arabicWord.endsWith('كُنَّ') ||
      arabicWord.endsWith('نَا') ||
      arabicWord.endsWith('نِي') ||
      arabicWord.endsWith('هُ') ||
      arabicWord.endsWith('هُم') ||
      arabicWord.endsWith('هُنَّ') ||
      arabicWord.match(/[هك]َا$/) || // ends with هَا or كَا
      arabicWord.match(/[هك]ِ$/) ||  // ends with هِ or كِ
      arabicWord.match(/[هك]َ$/)     // ends with هَ or كَ
    );

    // If we detect a pronoun suffix but it's not in the features, add it
    if (hasPronounSuffix && !distinctPOS.has('Pronoun') && !hasUnderscoreCompound) {
      distinctPOS.add('Pronoun');
      // Also ensure the main part is identified
      if (posLower.includes('noun')) {
        distinctPOS.add('Noun');
      }
    }

    // Extract case from features array if not in case field
    const getCase = (): string | null => {
      if (info.case) return info.case;
      if (Array.isArray(info.features)) {
        const caseFeature = info.features.find((f: string) =>
          f && (f.toLowerCase() === 'nominative' ||
            f.toLowerCase() === 'accusative' ||
            f.toLowerCase() === 'genitive')
        );
        if (caseFeature) return caseFeature.toLowerCase();
      }
      return null;
    };

    // Extract pronoun details from features or info
    const getPronounDetails = (): string | null => {
      // First, check for structured pronoun fields from morphology data
      const pronounPerson = (info as any).pronoun_person;
      const pronounNumber = (info as any).pronoun_number;
      const pronounGender = (info as any).pronoun_gender;

      if (pronounPerson && pronounNumber) {
        // Third person
        if (pronounPerson === 'third') {
          if (pronounNumber === 'singular') {
            if (pronounGender === 'feminine') return 'her/it';
            if (pronounGender === 'masculine') return 'his/it';
            return 'his/it'; // Default for third singular
          } else if (pronounNumber === 'plural') {
            return 'them';
          } else if (pronounNumber === 'dual') {
            return 'them (dual)';
          }
        }
        // Second person
        else if (pronounPerson === 'second') {
          if (pronounNumber === 'singular') {
            return 'you';
          } else if (pronounNumber === 'plural') {
            return 'you (pl)';
          } else if (pronounNumber === 'dual') {
            return 'you (dual)';
          }
        }
        // First person
        else if (pronounPerson === 'first') {
          if (pronounNumber === 'singular') {
            return 'me';
          } else if (pronounNumber === 'plural') {
            return 'us';
          }
        }
      }

      // Fallback: Check for pronoun type in features (e.g., "third person feminine singular" -> "her/it")
      if (Array.isArray(info.features)) {
        const pronounFeatures = info.features.filter((f: string) => {
          const fLower = f.toLowerCase();
          return fLower.includes('pronoun') ||
            fLower.includes('feminine') ||
            fLower.includes('masculine') ||
            fLower.includes('third') ||
            fLower.includes('second') ||
            fLower.includes('first');
        });

        // Try to determine pronoun meaning from features
        if (pronounFeatures.some(f => f.toLowerCase().includes('feminine') && f.toLowerCase().includes('singular'))) {
          return 'her/it';
        } else if (pronounFeatures.some(f => f.toLowerCase().includes('masculine') && f.toLowerCase().includes('singular'))) {
          return 'his/it';
        } else if (pronounFeatures.some(f => f.toLowerCase().includes('plural'))) {
          return 'them';
        } else if (pronounFeatures.some(f => f.toLowerCase().includes('dual'))) {
          return 'them (dual)';
        } else if (pronounFeatures.some(f => f.toLowerCase().includes('second'))) {
          return 'you';
        } else if (pronounFeatures.some(f => f.toLowerCase().includes('first'))) {
          return 'me/us';
        }
      }

      // Check if pronoun type is explicitly set
      if ((info as any).pronoun) {
        const pronounType = (info as any).pronoun.toLowerCase();
        if (pronounType.includes('feminine') && pronounType.includes('singular')) return 'her/it';
        if (pronounType.includes('masculine') && pronounType.includes('singular')) return 'his/it';
        if (pronounType.includes('plural')) return 'them';
        if (pronounType.includes('dual')) return 'them (dual)';
      }

      return null;
    };

    // If we have a compound word (either from underscore or features array), display it with details
    if (hasUnderscoreCompound || distinctPOS.size > 1) {
      const parts: string[] = [];
      const nounCase = getCase();
      const pronounDetails = getPronounDetails();

      // Handle underscore format (e.g., "noun_pronoun")
      if (hasUnderscoreCompound) {
        const posParts = partOfSpeech.split('_');
        posParts.forEach((pos, index) => {
          const posLower = pos.toLowerCase();
          const posFormatted = pos.charAt(0).toUpperCase() + pos.slice(1).toLowerCase();

          if (posLower === 'noun' && nounCase) {
            parts.push(`${posFormatted}: ${nounCase}`);
          } else if (posLower === 'pronoun' && pronounDetails) {
            parts.push(`${posFormatted}: ${pronounDetails}`);
          } else if (posLower === 'pronoun') {
            parts.push(posFormatted);
          } else {
            parts.push(posFormatted);
          }
        });
      } else {
        // Handle features array format - ensure Noun comes first, then Pronoun
        const posArray = Array.from(distinctPOS);
        // Sort to ensure Noun comes before Pronoun
        posArray.sort((a, b) => {
          if (a === 'Noun' && b !== 'Noun') return -1;
          if (a !== 'Noun' && b === 'Noun') return 1;
          if (a === 'Pronoun' && b !== 'Pronoun' && b !== 'Noun') return -1;
          if (a !== 'Pronoun' && a !== 'Noun' && b === 'Pronoun') return 1;
          return 0;
        });

        posArray.forEach((pos) => {
          if (pos === 'Noun' && nounCase) {
            parts.push(`${pos}: ${nounCase}`);
          } else if (pos === 'Pronoun' && pronounDetails) {
            parts.push(`${pos}: ${pronounDetails}`);
          } else if (pos === 'Pronoun') {
            parts.push(pos);
          } else {
            parts.push(pos);
          }
        });
      }

      return parts.join(', ');
    }

    // Extract person and number from features array
    const getPerson = (): string | null => {
      if (info.person) return info.person;
      if (Array.isArray(info.features)) {
        const personFeature = info.features.find((f: string) =>
          f && (f.toLowerCase().includes('first') ||
            f.toLowerCase().includes('second') ||
            f.toLowerCase().includes('third'))
        );
        if (personFeature) {
          if (personFeature.toLowerCase().includes('first')) return 'first';
          if (personFeature.toLowerCase().includes('second')) return 'second';
          if (personFeature.toLowerCase().includes('third')) return 'third';
        }
      }
      return null;
    };

    const getNumber = (): string | null => {
      if (info.number) return info.number;
      if (Array.isArray(info.features)) {
        const numberFeature = info.features.find((f: string) =>
          f && (f.toLowerCase().includes('singular') ||
            f.toLowerCase().includes('dual') ||
            f.toLowerCase().includes('plural'))
        );
        if (numberFeature) {
          if (numberFeature.toLowerCase().includes('singular')) return 'singular';
          if (numberFeature.toLowerCase().includes('dual')) return 'dual';
          if (numberFeature.toLowerCase().includes('plural')) return 'plural';
        }
      }
      return null;
    };

    // Extract gender from features array
    const getGender = (): string | null => {
      if (info.gender) return info.gender;
      if (Array.isArray(info.features)) {
        const genderFeature = info.features.find((f: string) =>
          f && (f.toLowerCase().includes('masculine') ||
            f.toLowerCase().includes('feminine'))
        );
        if (genderFeature) {
          if (genderFeature.toLowerCase().includes('masculine')) return 'masculine';
          if (genderFeature.toLowerCase().includes('feminine')) return 'feminine';
        }
      }
      return null;
    };

    // Extract tense from features array
    const getTense = (): string | null => {
      if (info.tense) return info.tense;
      if (Array.isArray(info.features)) {
        const tenseFeature = info.features.find((f: string) =>
          f && (f.toLowerCase().includes('present') ||
            f.toLowerCase().includes('past') ||
            f.toLowerCase().includes('imperative') ||
            f.toLowerCase().includes('future'))
        );
        if (tenseFeature) {
          if (tenseFeature.toLowerCase().includes('present')) return 'present';
          if (tenseFeature.toLowerCase().includes('past')) return 'past';
          if (tenseFeature.toLowerCase().includes('imperative')) return 'imperative';
          if (tenseFeature.toLowerCase().includes('future')) return 'future';
        }
      }
      return null;
    };

    // Extract mood from features array
    const getMood = (): string | null => {
      if (info.mood) return info.mood;
      if (Array.isArray(info.features)) {
        const moodFeature = info.features.find((f: string) =>
          f && (f.toLowerCase().includes('indicative') ||
            f.toLowerCase().includes('subjunctive') ||
            f.toLowerCase().includes('jussive') ||
            f.toLowerCase().includes('imperative'))
        );
        if (moodFeature) {
          if (moodFeature.toLowerCase().includes('indicative')) return 'indicative';
          if (moodFeature.toLowerCase().includes('subjunctive')) return 'subjunctive';
          if (moodFeature.toLowerCase().includes('jussive')) return 'jussive';
          if (moodFeature.toLowerCase().includes('imperative')) return 'imperative';
        }
      }
      return null;
    };

    // For nouns (including compound nouns), show case if available
    const nounCase = getCase();
    if (posLower.includes('noun') && nounCase) {
      return `${partOfSpeech}: ${nounCase}`;
    }

    // For particles, show type if available
    if (posLower === 'particle' && info.type) {
      return `${partOfSpeech}: ${info.type}`;
    }

    // For verbs, show form + aspect + voice + person + number + tense + mood (or gender + number if person not available)
    if (posLower === 'verb') {
      const parts: string[] = [];
      const form = info.form;
      const aspect = info.aspect; // perfect, imperfect, or imperative
      const voice = info.voice;
      const person = getPerson() || info.person;
      const number = getNumber() || info.number;
      const gender = getGender() || info.gender;
      const tense = getTense() || info.tense;
      const mood = getMood() || info.mood;

      // Add form first if available (important for understanding verb meaning)
      if (form) {
        parts.push(form.toLowerCase()); // "Form 1" -> "form 1"
      }

      // Add aspect if available (perfect/imperfect/imperative)
      if (aspect) {
        parts.push(aspect);
      }

      // Add voice if available
      if (voice) {
        parts.push(voice);
      }

      // Build descriptive string: "first-person plural" or "masculine plural"
      if (person && number) {
        parts.push(`${person}-person ${number}`);
      } else if (person) {
        parts.push(`${person}-person`);
      } else if (gender && number) {
        // If no person, show gender + number (e.g., "masculine plural")
        parts.push(`${gender} ${number}`);
      } else if (number) {
        parts.push(number);
      } else if (gender) {
        parts.push(gender);
      }

      // Add tense if available
      if (tense) {
        parts.push(`${tense} tense`);
      }

      // Add mood if available
      if (mood) {
        parts.push(mood);
      }

      if (parts.length > 0) {
        return `${partOfSpeech}: ${parts.join(', ')}`;
      }

      // Fallback: just show tense if available
      if (tense) {
        return `${partOfSpeech}: ${tense}`;
      }
    }

    // For prepositions (standalone), just show the part of speech
    if (posLower === 'preposition') {
      return partOfSpeech;
    }

    // For compound words like "preposition_noun", show case if available
    const compoundCase = getCase();
    if (posLower.includes('preposition') && posLower.includes('noun') && compoundCase) {
      return `${partOfSpeech}: ${compoundCase}`;
    }

    // Default: just show part of speech
    return partOfSpeech;
  };

  return (
    <>
      <div onClick={() => setIsOpen(true)} className="cursor-pointer">
        {children}
      </div>

      {isOpen && (
        <div
          className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4"
          onClick={() => setIsOpen(false)}
        >
          <div
            className="bg-white rounded-lg shadow-xl max-w-md w-full p-6"
            onClick={(e) => e.stopPropagation()}
          >
            {/* Header with close button in top right */}
            <div className="relative mb-4">
              <button
                onClick={() => setIsOpen(false)}
                className="absolute top-0 right-0 text-gray-400 hover:text-gray-600 transition-colors"
                aria-label="Close"
              >
                <svg
                  className="w-6 h-6"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth={2}
                    d="M6 18L18 6M6 6l12 12"
                  />
                </svg>
              </button>
              <div className="text-left pr-8">
                <h3 className="text-xl font-semibold text-gray-900 text-left">
                  Word Details
                </h3>
                {word.grammar_info && (
                  <p className="text-sm text-gray-600 mt-1 text-left">
                    {buildGrammarSubtitle(word.grammar_info, word.text_arabic)}
                  </p>
                )}
              </div>
            </div>

            <div className="space-y-4" dir="ltr" style={{ textAlign: 'left' }}>
              {/* Arabic Word */}
              <div dir="rtl" className="p-4 bg-gray-50 rounded-lg" style={{ textAlign: 'right', direction: 'rtl' }}>
                <ArabicText variant="word" className="text-3xl">
                  {renderColoredArabicWord(word.text_arabic, word.grammar_info)}
                </ArabicText>
              </div>

              {/* Transliteration */}
              {word.transliteration && (
                <div dir="ltr" style={{ textAlign: 'left' }}>
                  <label className="block text-sm font-medium text-gray-700 mb-1" style={{ textAlign: 'left' }}>
                    Transliteration
                  </label>
                  <p className="text-lg italic text-gray-900" style={{ textAlign: 'left' }}>
                    {word.transliteration}
                  </p>
                </div>
              )}

              {/* English Translation */}
              {word.translation_english && (
                <div dir="ltr" style={{ textAlign: 'left' }}>
                  <label className="block text-sm font-medium text-gray-700 mb-1" style={{ textAlign: 'left' }}>
                    Translation
                  </label>
                  <p className="text-lg text-gray-900" style={{ textAlign: 'left' }}>
                    {cleanTranslation(word.translation_english, word.grammar_info)}
                  </p>
                </div>
              )}

              {/* Grammar Information */}
              {word.grammar_info && (
                <div dir="ltr" className="border-t pt-4 mt-4" style={{ textAlign: 'left' }}>
                  <label className="block text-sm font-medium text-gray-700 mb-2" style={{ textAlign: 'left' }}>
                    Grammar
                  </label>
                  <div className="space-y-2 text-sm" style={{ textAlign: 'left' }}>
                    <div>
                      <span className="font-semibold">Part of Speech:</span>{' '}
                      <span className="text-gray-900">{word.grammar_info.part_of_speech}</span>
                    </div>
                    {word.grammar_info.case && (
                      <div>
                        <span className="font-semibold">Case:</span>{' '}
                        <span className="text-gray-900 capitalize">{word.grammar_info.case}</span>
                      </div>
                    )}
                    {word.grammar_info.definiteness && (
                      <div>
                        <span className="font-semibold">Definiteness:</span>{' '}
                        <span className="text-gray-900 capitalize">{word.grammar_info.definiteness}</span>
                      </div>
                    )}
                    {word.grammar_info.number && (
                      <div>
                        <span className="font-semibold">Number:</span>{' '}
                        <span className="text-gray-900 capitalize">{word.grammar_info.number}</span>
                      </div>
                    )}
                    {word.grammar_info.gender && (
                      <div>
                        <span className="font-semibold">Gender:</span>{' '}
                        <span className="text-gray-900 capitalize">{word.grammar_info.gender}</span>
                      </div>
                    )}
                    {word.grammar_info.tense && (
                      <div>
                        <span className="font-semibold">Tense:</span>{' '}
                        <span className="text-gray-900 capitalize">{word.grammar_info.tense}</span>
                      </div>
                    )}
                    {word.grammar_info.person && (
                      <div>
                        <span className="font-semibold">Person:</span>{' '}
                        <span className="text-gray-900 capitalize">{word.grammar_info.person}</span>
                      </div>
                    )}
                    {word.grammar_info.mood && (
                      <div>
                        <span className="font-semibold">Mood:</span>{' '}
                        <span className="text-gray-900 capitalize">{word.grammar_info.mood}</span>
                      </div>
                    )}
                    {word.grammar_info.form && (
                      <div>
                        <span className="font-semibold">Form:</span>{' '}
                        <span className="text-gray-900">{word.grammar_info.form}</span>
                      </div>
                    )}
                    {word.grammar_info.notes && (
                      <div className="mt-2 pt-2 border-t">
                        <span className="font-semibold">Notes:</span>{' '}
                        <span className="text-gray-700 italic">{word.grammar_info.notes}</span>
                      </div>
                    )}
                  </div>

                  {/* Grammar Explanation Button */}
                  <div className="mt-4">
                    <button
                      onClick={handleOpenGrammarTutorial}
                      className="w-full px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 transition-colors"
                    >
                      Learn more about this grammar point
                    </button>
                  </div>
                </div>
              )}
            </div>

            <div className="mt-6">
              <button
                onClick={() => setIsOpen(false)}
                className="w-full px-4 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 font-semibold transition-colors"
              >
                Close
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Grammar Tutorial Modal */}
      {word.grammar_info && (
        <GrammarTutorialModal
          isOpen={isGrammarTutorialOpen}
          onClose={() => setIsGrammarTutorialOpen(false)}
          arabicWord={word.text_arabic}
          grammarInfo={word.grammar_info}
          wordId={word.id}
        />
      )}
    </>
  );
}

