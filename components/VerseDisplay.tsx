"use client";

import ArabicText from "./ArabicText";
import WordModal from "./WordModal";
import { Verse, Word } from "@/types/quran";

interface VerseDisplayProps {
  verse: Verse;
  words: Word[];
}

export default function VerseDisplay({ verse, words }: VerseDisplayProps) {
  return (
    <div className="bg-white border border-gray-200 rounded-xl p-6 hover:border-primary-300 transition-colors">
      <div className="mb-4 flex items-center gap-3">
        <span className="inline-flex items-center justify-center w-10 h-10 rounded-full bg-primary-100 text-primary-700 font-semibold text-sm">
          {verse.verse_number}
        </span>
      </div>
      
      <div dir="rtl" className="text-right">
        {words.length > 0 ? (
          <div dir="rtl" className="flex flex-wrap gap-2">
            {words.map((word) => (
              <WordModal key={word.id} word={word}>
                <button className="hover:bg-primary-50 px-3 py-2 rounded-lg transition-colors">
                  <ArabicText variant="word" className="text-primary-900">{word.text_arabic}</ArabicText>
                </button>
              </WordModal>
            ))}
          </div>
        ) : (
          <ArabicText variant="verse" className="text-primary-900">{verse.text_arabic}</ArabicText>
        )}
      </div>
    </div>
  );
}
