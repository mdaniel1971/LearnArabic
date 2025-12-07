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
}

export default function GrammarTutorialModal({
  isOpen,
  onClose,
  arabicWord,
  grammarInfo,
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
      const response = await fetch("/api/grammar-tutorial", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          grammar_info: grammarInfo,
          arabic_word: arabicWord,
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
  }, [grammarInfo, arabicWord, isLoading]);

  // Generate explanation when modal opens (only once)
  useEffect(() => {
    if (isOpen && !explanation && !isLoading && !error && !hasGeneratedRef.current) {
      generateExplanation();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [isOpen]); // Only depend on isOpen to generate once when modal opens

  if (!isOpen) return null;

  // Build grammar summary for title
  const grammarSummary = [
    grammarInfo.part_of_speech,
    grammarInfo.case && `(${grammarInfo.case})`,
    grammarInfo.tense && grammarInfo.person && `${grammarInfo.tense} ${grammarInfo.person}`,
  ]
    .filter(Boolean)
    .join(" ");

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
        <div className="flex justify-between items-start p-6 border-b border-gray-200">
          <div className="flex-1">
            <div className="flex items-center gap-4 mb-2">
              <div dir="rtl" className="text-right">
                <ArabicText variant="word" className="text-2xl">
                  {arabicWord}
                </ArabicText>
              </div>
              <div className="h-6 w-px bg-gray-300"></div>
              <div>
                <h3 className="text-xl font-semibold text-gray-900">
                  Grammar Tutorial
                </h3>
                <p className="text-sm text-gray-600 mt-1">{grammarSummary}</p>
              </div>
            </div>
          </div>
          <button
            onClick={onClose}
            className="text-gray-400 hover:text-gray-600 transition-colors"
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
        </div>

        {/* Content */}
        <div className="flex-1 overflow-y-auto p-6" dir="ltr" style={{ textAlign: 'left' }}>
          {isLoading && (
            <div className="flex flex-col items-center justify-center py-12">
              <svg
                className="animate-spin h-12 w-12 text-indigo-600 mb-4"
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
            <div dir="ltr" className="text-left">
              <ReactMarkdown
                components={{
                  h1: ({node, ...props}) => <h1 className="text-2xl font-bold text-gray-900 mb-4 mt-6 first:mt-0" {...props} />,
                  h2: ({node, ...props}) => <h2 className="text-xl font-bold text-gray-900 mb-3 mt-5 first:mt-0" {...props} />,
                  h3: ({node, ...props}) => <h3 className="text-lg font-bold text-gray-900 mb-2 mt-4 first:mt-0" {...props} />,
                  p: ({node, ...props}) => <p className="text-gray-800 leading-relaxed mb-4" {...props} />,
                  strong: ({node, ...props}) => <strong className="font-semibold text-gray-900" {...props} />,
                  em: ({node, ...props}) => <em className="italic text-gray-800" {...props} />,
                  ul: ({node, ...props}) => <ul className="list-disc ml-6 mb-4 space-y-2" {...props} />,
                  ol: ({node, ...props}) => <ol className="list-decimal ml-6 mb-4 space-y-2" {...props} />,
                  li: ({node, ...props}) => <li className="text-gray-800 leading-relaxed" {...props} />,
                  code: ({node, inline, ...props}) => 
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
            className="w-full px-6 py-3 bg-indigo-600 text-white rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition-colors font-medium"
          >
            Close
          </button>
        </div>
      </div>
    </div>
  );
}

