'use client';

import { useState, useEffect } from 'react';
import { Flashcard, Difficulty } from '@/types/flashcards';
import ArabicText from './ArabicText';

interface FlashcardReviewProps {
  onComplete: (reviewsCompleted: number) => void;
  deckId?: string;
}

export default function FlashcardReview({ onComplete, deckId }: FlashcardReviewProps) {
  const [cards, setCards] = useState<Flashcard[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [isFlipped, setIsFlipped] = useState(false);
  const [loading, setLoading] = useState(true);
  const [reviewing, setReviewing] = useState(false);
  const [reviewsCompleted, setReviewsCompleted] = useState(0);

  useEffect(() => {
    loadCards();
  }, [deckId]);

  // Keyboard shortcuts
  useEffect(() => {
    const handleKeyPress = (e: KeyboardEvent) => {
      if (reviewing || cards.length === 0) return;

      if (e.key === ' ' || e.key === 'Spacebar') {
        e.preventDefault();
        if (!isFlipped) {
          handleFlip();
        }
      } else if (e.key === '1' && isFlipped) {
        e.preventDefault();
        handleReview('hard');
      } else if (e.key === '2' && isFlipped) {
        e.preventDefault();
        handleReview('medium');
      } else if (e.key === '3' && isFlipped) {
        e.preventDefault();
        handleReview('easy');
      }
    };

    window.addEventListener('keydown', handleKeyPress);
    return () => window.removeEventListener('keydown', handleKeyPress);
  }, [isFlipped, reviewing, cards.length]);

  const loadCards = async () => {
    try {
      // Load all cards, not just due ones, so learners can review any card
      let url = '/api/flashcards/list?limit=1000';
      if (deckId) {
        url += `&deck_id=${deckId}`;
      }
      const response = await fetch(url);
      if (response.ok) {
        const data = await response.json();
        setCards(data.flashcards || []);
      }
    } catch (error) {
      console.error('Error loading cards:', error);
    } finally {
      setLoading(false);
    }
  };

  const handleFlip = () => {
    setIsFlipped(!isFlipped);
  };

  const handleReview = async (difficulty: Difficulty) => {
    if (reviewing || !cards[currentIndex]) return;

    setReviewing(true);
    try {
      const response = await fetch('/api/flashcards/review', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          flashcard_id: cards[currentIndex].id,
          difficulty,
        }),
      });

      if (!response.ok) {
        throw new Error('Failed to review card');
      }

      // Remove reviewed card from list
      const newCards = cards.filter((_, index) => index !== currentIndex);
      setCards(newCards);

      // Reset flip state for next card
      setIsFlipped(false);
      setReviewsCompleted(reviewsCompleted + 1);

      // If no more cards, complete session
      if (newCards.length === 0) {
        onComplete(reviewsCompleted + 1);
      } else {
        // Stay on same index (next card moved up)
        if (currentIndex >= newCards.length) {
          setCurrentIndex(newCards.length - 1);
        }
      }
    } catch (error) {
      console.error('Error reviewing card:', error);
      alert('Failed to review card. Please try again.');
    } finally {
      setReviewing(false);
    }
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[400px]">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto mb-4"></div>
          <p className="text-gray-600">Loading flashcards...</p>
        </div>
      </div>
    );
  }

  if (cards.length === 0) {
    return (
      <div className="flex items-center justify-center min-h-[400px]">
        <div className="text-center">
          <p className="text-xl text-gray-600 mb-4">No cards due for review!</p>
          <p className="text-gray-500">Great job staying on top of your reviews.</p>
        </div>
      </div>
    );
  }

  const currentCard = cards[currentIndex];
  const progress = ((currentIndex + 1) / cards.length) * 100;

  if (!currentCard || (!currentCard.word && !currentCard.word_text_arabic)) {
    return null;
  }

  return (
    <div className="max-w-2xl mx-auto">
      {/* Progress bar */}
      <div className="mb-6">
        <div className="flex justify-between text-sm text-gray-600 mb-2">
          <span>Card {currentIndex + 1} of {cards.length}</span>
          <span>{Math.round(progress)}%</span>
        </div>
        <div className="w-full bg-gray-200 rounded-full h-2">
          <div
            className="bg-blue-600 h-2 rounded-full transition-all duration-300"
            style={{ width: `${progress}%` }}
          ></div>
        </div>
      </div>

      {/* Flashcard */}
      <div
        className="bg-white rounded-lg shadow-lg p-8 min-h-[400px] flex flex-col items-center justify-center cursor-pointer"
        onClick={handleFlip}
      >
        {!isFlipped ? (
          // Front of card - Arabic only, no transliteration
          <div className="text-center">
            <div className="mb-4">
              <ArabicText className="text-6xl font-amiri">
                {currentCard.word?.text_arabic || currentCard.word_text_arabic || ''}
              </ArabicText>
            </div>
            <p className="text-sm text-gray-500 mt-4">Click or press Space to flip</p>
          </div>
        ) : (
          // Back of card - English translation and all grammar details
          <div className="text-left w-full">
            <div className="mb-6">
              <ArabicText className="text-4xl font-amiri mb-4">
                {currentCard.word?.text_arabic || currentCard.word_text_arabic || ''}
              </ArabicText>
              {(currentCard.word?.transliteration || currentCard.word_transliteration) && (
                <div className="text-xl text-gray-600 mb-4 italic">
                  {currentCard.word?.transliteration || currentCard.word_transliteration}
                </div>
              )}
            </div>

            <div className="bg-gray-50 rounded-lg p-4 mb-6">
              <div className="text-2xl font-semibold text-gray-800 mb-2">
                {currentCard.word?.translation_english || currentCard.word_translation_english}
              </div>
            </div>

            {/* Word Details - comprehensive grammar information */}
            {(currentCard.word_details_text || currentCard.word?.grammar_info || currentCard.word_grammar_info) && (
              <div className="text-sm text-gray-700 mb-6 space-y-2">
                <div className="font-semibold text-base mb-3">Word Details</div>
                {currentCard.word_details_text ? (
                  <div className="italic text-gray-600 mb-3">{currentCard.word_details_text}</div>
                ) : null}

                {/* Comprehensive grammar display */}
                {(() => {
                  const grammarInfo = currentCard.word?.grammar_info || currentCard.word_grammar_info;
                  if (!grammarInfo) return null;

                  return (
                    <div className="space-y-1.5">
                      {grammarInfo.part_of_speech && (
                        <div>
                          <span className="font-semibold">Part of Speech:</span>{' '}
                          <span className="text-gray-900">{grammarInfo.part_of_speech}</span>
                        </div>
                      )}
                      {grammarInfo.case && (
                        <div>
                          <span className="font-semibold">Case:</span>{' '}
                          <span className="text-gray-900 capitalize">{grammarInfo.case}</span>
                        </div>
                      )}
                      {grammarInfo.definiteness && (
                        <div>
                          <span className="font-semibold">Definiteness:</span>{' '}
                          <span className="text-gray-900 capitalize">{grammarInfo.definiteness}</span>
                        </div>
                      )}
                      {grammarInfo.number && (
                        <div>
                          <span className="font-semibold">Number:</span>{' '}
                          <span className="text-gray-900 capitalize">{grammarInfo.number}</span>
                        </div>
                      )}
                      {grammarInfo.gender && (
                        <div>
                          <span className="font-semibold">Gender:</span>{' '}
                          <span className="text-gray-900 capitalize">{grammarInfo.gender}</span>
                        </div>
                      )}
                      {grammarInfo.person && (
                        <div>
                          <span className="font-semibold">Person:</span>{' '}
                          <span className="text-gray-900 capitalize">{grammarInfo.person}</span>
                        </div>
                      )}
                      {grammarInfo.tense && (
                        <div>
                          <span className="font-semibold">Tense:</span>{' '}
                          <span className="text-gray-900 capitalize">{grammarInfo.tense}</span>
                        </div>
                      )}
                      {grammarInfo.mood && (
                        <div>
                          <span className="font-semibold">Mood:</span>{' '}
                          <span className="text-gray-900 capitalize">{grammarInfo.mood}</span>
                        </div>
                      )}
                      {grammarInfo.voice && (
                        <div>
                          <span className="font-semibold">Voice:</span>{' '}
                          <span className="text-gray-900 capitalize">{grammarInfo.voice}</span>
                        </div>
                      )}
                      {grammarInfo.aspect && (
                        <div>
                          <span className="font-semibold">Aspect:</span>{' '}
                          <span className="text-gray-900 capitalize">{grammarInfo.aspect}</span>
                        </div>
                      )}
                      {grammarInfo.form && (
                        <div>
                          <span className="font-semibold">Form:</span>{' '}
                          <span className="text-gray-900">{grammarInfo.form}</span>
                        </div>
                      )}
                      {grammarInfo.type && (
                        <div>
                          <span className="font-semibold">Type:</span>{' '}
                          <span className="text-gray-900">{grammarInfo.type}</span>
                        </div>
                      )}
                      {grammarInfo.preposition && (
                        <div>
                          <span className="font-semibold">Preposition:</span>{' '}
                          <span className="text-gray-900">{grammarInfo.preposition}</span>
                        </div>
                      )}
                      {grammarInfo.noun && (
                        <div>
                          <span className="font-semibold">Noun:</span>{' '}
                          <span className="text-gray-900">{grammarInfo.noun}</span>
                        </div>
                      )}
                      {grammarInfo.conjunction && (
                        <div>
                          <span className="font-semibold">Conjunction:</span>{' '}
                          <span className="text-gray-900">{grammarInfo.conjunction}</span>
                        </div>
                      )}
                      {grammarInfo.negative && (
                        <div>
                          <span className="font-semibold">Negative:</span>{' '}
                          <span className="text-gray-900">{grammarInfo.negative}</span>
                        </div>
                      )}
                      {grammarInfo.pronoun && (
                        <div>
                          <span className="font-semibold">Pronoun:</span>{' '}
                          <span className="text-gray-900">{grammarInfo.pronoun}</span>
                        </div>
                      )}
                      {grammarInfo.notes && (
                        <div className="mt-2 pt-2 border-t border-gray-300">
                          <span className="font-semibold">Notes:</span>{' '}
                          <span className="text-gray-900 italic">{grammarInfo.notes}</span>
                        </div>
                      )}
                    </div>
                  );
                })()}
              </div>
            )}

            {/* Difficulty buttons */}
            <div className="flex flex-col sm:flex-row gap-3 mt-6">
              <button
                onClick={(e) => {
                  e.stopPropagation();
                  handleReview('hard');
                }}
                disabled={reviewing}
                className="flex-1 py-3 px-6 bg-red-500 text-white rounded-lg font-semibold hover:bg-red-600 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
              >
                Hard (1)
              </button>
              <button
                onClick={(e) => {
                  e.stopPropagation();
                  handleReview('medium');
                }}
                disabled={reviewing}
                className="flex-1 py-3 px-6 bg-yellow-500 text-white rounded-lg font-semibold hover:bg-yellow-600 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
              >
                Medium (2)
              </button>
              <button
                onClick={(e) => {
                  e.stopPropagation();
                  handleReview('easy');
                }}
                disabled={reviewing}
                className="flex-1 py-3 px-6 bg-green-500 text-white rounded-lg font-semibold hover:bg-green-600 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
              >
                Easy (3)
              </button>
            </div>
          </div>
        )}
      </div>

      {/* Keyboard shortcuts hint */}
      <div className="mt-4 text-center text-sm text-gray-500">
        {!isFlipped ? (
          <p>Press <kbd className="px-2 py-1 bg-gray-100 rounded">Space</kbd> to flip</p>
        ) : (
          <p>Press <kbd className="px-2 py-1 bg-gray-100 rounded">1</kbd>, <kbd className="px-2 py-1 bg-gray-100 rounded">2</kbd>, or <kbd className="px-2 py-1 bg-gray-100 rounded">3</kbd> to rate</p>
        )}
      </div>
    </div>
  );
}

