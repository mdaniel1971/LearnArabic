"use client";

import { useState, useEffect, useCallback, useRef } from "react";
import ReactMarkdown from "react-markdown";
import ArabicText from "./ArabicText";
import { GrammarInfo } from "@/types/quran";

interface GrammarTutorialModalProps {
  isOpen: boolean;
  onClose: () => void;
  arabicWord: string;
  grammarInfo: GrammarInfo;
  wordId?: number; // Optional: to fetch verse context
}

export default function GrammarTutorialModal({
  isOpen,
  onClose,
  arabicWord,
  grammarInfo,
  wordId,
}: GrammarTutorialModalProps) {
  const [explanation, setExplanation] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const hasGeneratedRef = useRef(false);

  // Handle ESC key to close
  useEffect(() => {
    if (!isOpen) return;

    const handleEscape = (e: KeyboardEvent) => {
      if (e.key === "Escape") {
        onClose();
      }
    };

    document.addEventListener("keydown", handleEscape);
    return () => document.removeEventListener("keydown", handleEscape);
  }, [isOpen, onClose]);

  // Reset state when modal closes
  useEffect(() => {
    if (!isOpen) {
      setExplanation(null);
      setError(null);
      setIsLoading(false);
      hasGeneratedRef.current = false;
    }
  }, [isOpen]);

  const generateExplanation = useCallback(async () => {
    // Prevent multiple simultaneous calls or re-generation
    if (isLoading || hasGeneratedRef.current) return;

    hasGeneratedRef.current = true;
    setIsLoading(true);
    setError(null);
    setExplanation(null);

    try {
      // Fetch verse context if wordId is provided
      let verseContext = null;
      if (wordId) {
        try {
          const { createClient } = await import('@/utils/supabase/client');
          const supabase = createClient();

          // Fetch word with verse and surah info
          const { data: wordData, error: wordError } = await supabase
            .from('words')
            .select(`
              word_position,
              verse_id,
              verses!inner (
                id,
                verse_number,
                text_arabic,
                surahs!inner (
                  surah_number,
                  name_english
                )
              )
            `)
            .eq('id', wordId)
            .single();

          if (!wordError && wordData) {
            const verse = wordData.verses as any;
            const surah = verse.surahs as any;
            const verseId = verse.id || wordData.verse_id;

            // Fetch surrounding words (2 words before and after)
            const { data: surroundingWords } = await supabase
              .from('words')
              .select('text_arabic, word_position')
              .eq('verse_id', verseId)
              .gte('word_position', Math.max(1, (wordData.word_position || 1) - 2))
              .lte('word_position', (wordData.word_position || 1) + 2)
              .order('word_position', { ascending: true });

            verseContext = {
              surah_number: surah.surah_number,
              verse_number: verse.verse_number,
              surah_name: surah.name_english,
              full_verse_text: verse.text_arabic,
              surrounding_words: surroundingWords || [],
              word_position: wordData.word_position,
            };
          }
        } catch (contextError) {
          console.warn('Could not fetch verse context:', contextError);
          // Continue without context if fetch fails
        }
      }

      const response = await fetch("/api/grammar-tutorial", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          grammar_info: grammarInfo,
          arabic_word: arabicWord,
          verse_context: verseContext,
        }),
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || "Failed to generate explanation");
      }

      const data = await response.json();
      // Only set explanation once - ensure we have the final cleaned version
      if (data.explanation) {
        setExplanation(data.explanation);
      }
    } catch (error: any) {
      console.error("Error generating explanation:", error);
      setError(error.message || "Failed to generate explanation. Please try again.");
      hasGeneratedRef.current = false; // Allow retry on error
    } finally {
      setIsLoading(false);
    }
  }, [grammarInfo, arabicWord, wordId, isLoading]);

  // Generate explanation when modal opens (only once)
  useEffect(() => {
    if (isOpen && !explanation && !isLoading && !error && !hasGeneratedRef.current) {
      generateExplanation();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [isOpen]); // Only depend on isOpen to generate once when modal opens

  if (!isOpen) return null;

  // Build grammar summary for subtitle
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

  const buildGrammarSubtitle = (info: GrammarInfo): string => {
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

    // For particles, show type if available (like "preposition")
    // Check multiple possible fields where type might be stored
    if (posLower === 'particle') {
      // First check if type is explicitly set
      let particleType = info.type;

      // If not, check if it's in features array (but skip generic "particle")
      if (!particleType && Array.isArray(info.features)) {
        const specificFeature = info.features.find((f: string) =>
          f && f.toLowerCase() !== 'particle' && f.length > 0
        );
        if (specificFeature) {
          particleType = specificFeature;
        }
      }

      // If still no type, try to infer from Arabic text (common prepositions)
      if (!particleType && arabicWord) {
        const arabic = arabicWord.trim();
        // Common Arabic prepositions
        if (arabic.match(/^م[ِنّ]|^فِي|^بِ|^لِ|^عَلَى|^إِلَى|^حَتَّى|^عَنْ|^عَلَى|^مِن|^فِي/)) {
          particleType = 'preposition';
        }
        // Common negative particles
        else if (arabic.match(/^لَا|^لَمْ|^لَنْ|^لَن/)) {
          particleType = 'negative';
        }
      }

      if (particleType) {
        return `${partOfSpeech}: ${particleType}`;
      }
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

  const grammarSubtitle = buildGrammarSubtitle(grammarInfo);

  return (
    <div
      className="fixed inset-0 bg-black bg-opacity-60 flex items-center justify-center z-[60] p-4"
      onClick={onClose}
    >
      <div
        className="bg-white rounded-lg shadow-2xl max-w-2xl w-full max-h-[90vh] overflow-hidden flex flex-col"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header */}
        <div className="relative p-6 border-b border-gray-200">
          <button
            onClick={onClose}
            className="absolute top-6 right-6 text-gray-400 hover:text-gray-600 transition-colors z-10"
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
          <div className="pr-10">
            <div className="text-left mb-4">
              <h3 className="text-xl font-semibold text-gray-900 text-left">
                Grammar Tutorial
              </h3>
              <p className="text-sm text-gray-600 mt-1 text-left">{grammarSubtitle}</p>
            </div>
            <div dir="rtl" className="p-4 bg-gray-50 rounded-lg" style={{ textAlign: 'right', direction: 'rtl' }}>
              <ArabicText variant="word" className="text-3xl">
                {renderColoredArabicWord(arabicWord, grammarInfo)}
              </ArabicText>
            </div>
          </div>
        </div>

        {/* Content */}
        <div className="flex-1 overflow-y-auto p-6" dir="ltr" style={{ textAlign: 'left', direction: 'ltr' }}>
          {isLoading && (
            <div className="flex flex-col items-center justify-center py-12">
              <svg
                className="animate-spin h-12 w-12 text-primary-600 mb-4"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
              >
                <circle
                  className="opacity-25"
                  cx="12"
                  cy="12"
                  r="10"
                  stroke="currentColor"
                  strokeWidth="4"
                ></circle>
                <path
                  className="opacity-75"
                  fill="currentColor"
                  d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
                ></path>
              </svg>
              <p className="text-gray-600 text-lg">Generating grammar explanation...</p>
            </div>
          )}

          {error && (
            <div className="p-4 bg-red-50 rounded-lg border border-red-200">
              <p className="text-red-800">{error}</p>
              <button
                onClick={generateExplanation}
                className="mt-3 px-4 py-2 bg-red-600 text-white rounded-md hover:bg-red-700 text-sm"
              >
                Try Again
              </button>
            </div>
          )}

          {explanation && !isLoading && (
            <div dir="ltr" className="text-left" style={{ textAlign: 'left', direction: 'ltr' }}>
              <ReactMarkdown
                components={{
                  h1: ({ node, ...props }) => <h1 className="text-2xl font-bold text-gray-900 mb-4 mt-6 first:mt-0" {...props} />,
                  h2: ({ node, ...props }) => <h2 className="text-xl font-bold text-gray-900 mb-3 mt-5 first:mt-0" {...props} />,
                  h3: ({ node, ...props }) => <h3 className="text-lg font-bold text-gray-900 mb-2 mt-4 first:mt-0" {...props} />,
                  p: ({ node, ...props }) => <p className="text-gray-800 leading-relaxed mb-4" {...props} />,
                  strong: ({ node, ...props }) => <strong className="font-semibold text-gray-900" {...props} />,
                  em: ({ node, ...props }) => <em className="italic text-gray-800" {...props} />,
                  ul: ({ node, ...props }) => <ul className="list-disc ml-6 mb-4 space-y-2" {...props} />,
                  ol: ({ node, ...props }) => <ol className="list-decimal ml-6 mb-4 space-y-2" {...props} />,
                  li: ({ node, ...props }) => <li className="text-gray-800 leading-relaxed" {...props} />,
                  code: ({ node, inline, ...props }) =>
                    inline ? (
                      <code className="bg-gray-100 px-1.5 py-0.5 rounded text-sm font-mono text-gray-900" {...props} />
                    ) : (
                      <code className="block bg-gray-100 p-3 rounded text-sm font-mono text-gray-900 mb-4 overflow-x-auto" {...props} />
                    ),
                }}
              >
                {explanation}
              </ReactMarkdown>
            </div>
          )}
        </div>

        {/* Footer */}
        <div className="border-t border-gray-200 p-4">
          <button
            onClick={onClose}
            className="w-full px-6 py-3 bg-primary-600 text-white rounded-lg hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 transition-colors font-semibold"
          >
            Close
          </button>
        </div>
      </div>
    </div>
  );
}

