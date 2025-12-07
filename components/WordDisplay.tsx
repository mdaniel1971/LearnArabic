import ArabicText from './ArabicText';
import { Word } from '@/types/quran';

interface WordDisplayProps {
  word: Word;
  showTransliteration?: boolean;
  showTranslation?: boolean;
}

/**
 * Component for displaying a single Arabic word with proper styling
 * Shows the word with diacritical marks, transliteration, and translation
 */
export default function WordDisplay({ 
  word, 
  showTransliteration = true,
  showTranslation = true 
}: WordDisplayProps) {
  return (
    <div className="flex flex-col items-end mb-3 p-2 border-b border-gray-200">
      <ArabicText variant="word">
        {word.text_arabic}
      </ArabicText>
      {showTransliteration && word.transliteration && (
        <p className="text-sm italic text-gray-600 mt-1">
          {word.transliteration}
        </p>
      )}
      {showTranslation && word.translation_english && (
        <p className="text-sm text-gray-700 mt-1">
          {word.translation_english}
        </p>
      )}
    </div>
  );
}

