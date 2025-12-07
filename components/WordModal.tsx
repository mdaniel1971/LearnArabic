"use client";

import { useState } from "react";
import ArabicText from "./ArabicText";
import GrammarTutorialModal from "./GrammarTutorialModal";
import { Word } from "@/types/quran";

interface WordModalProps {
  word: Word;
  children: React.ReactNode;
}

export default function WordModal({ word, children }: WordModalProps) {
  const [isOpen, setIsOpen] = useState(false);
  const [isGrammarTutorialOpen, setIsGrammarTutorialOpen] = useState(false);

  // Debug: Log word data when modal opens
  if (isOpen) {
    console.log('Word data:', word);
    console.log('Grammar info:', word.grammar_info);
  }

  const handleOpenGrammarTutorial = () => {
    if (word.grammar_info) {
      setIsGrammarTutorialOpen(true);
    }
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
            <div className="flex justify-between items-start mb-4">
              <h3 className="text-xl font-semibold text-gray-900">
                Word Details
              </h3>
              <button
                onClick={() => setIsOpen(false)}
                className="text-gray-400 hover:text-gray-600"
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
            </div>

            <div className="space-y-4">
              {/* Arabic Word */}
              <div dir="rtl" className="text-right p-4 bg-gray-50 rounded-lg">
                <ArabicText variant="word" className="text-3xl">
                  {word.text_arabic}
                </ArabicText>
              </div>

              {/* Transliteration */}
              {word.transliteration && (
                <div dir="ltr">
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Transliteration
                  </label>
                  <p className="text-lg italic text-gray-900">
                    {word.transliteration}
                  </p>
                </div>
              )}

              {/* English Translation */}
              {word.translation_english && (
                <div dir="ltr">
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Translation
                  </label>
                  <p className="text-lg text-gray-900">
                    {word.translation_english}
                  </p>
                </div>
              )}

              {/* Grammar Information */}
              {word.grammar_info && (
                <div dir="ltr" className="border-t pt-4 mt-4">
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Grammar
                  </label>
                  <div className="space-y-2 text-sm">
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
                className="w-full px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
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
        />
      )}
    </>
  );
}

