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
    <div className="bg-green-50 rounded-lg shadow-sm p-3">
      <div className="mb-2">
        <span className="inline-flex items-center justify-center w-8 h-8 rounded-full bg-indigo-100 text-indigo-800 font-semibold text-sm">
          {verse.verse_number}
        </span>
      </div>
      
      <div dir="rtl" className="text-right mb-2">
        {words.length > 0 ? (
          <div dir="rtl" className="flex flex-wrap gap-2">
            {words.map((word) => (
              <WordModal key={word.id} word={word}>
                <button className="hover:bg-indigo-50 px-2 py-1 rounded transition-colors">
                  <ArabicText variant="word">{word.text_arabic}</ArabicText>
                </button>
              </WordModal>
            ))}
          </div>
        ) : (
          <ArabicText variant="verse">{verse.text_arabic}</ArabicText>
        )}
      </div>
    </div>
  );
}
