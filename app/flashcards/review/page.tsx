'use client';

import { useState, Suspense } from 'react';
import { useSearchParams } from 'next/navigation';
import FlashcardReview from '@/components/FlashcardReview';
import Link from 'next/link';

function ReviewContent() {
  const searchParams = useSearchParams();
  const deckId = searchParams.get('deck_id') || undefined;
  const [sessionComplete, setSessionComplete] = useState(false);
  const [reviewsCompleted, setReviewsCompleted] = useState(0);

  const handleComplete = (completed: number) => {
    setReviewsCompleted(completed);
    setSessionComplete(true);
  };

  if (sessionComplete) {
    return (
      <div className="min-h-screen bg-gray-50">
        <div className="max-w-2xl mx-auto py-8 px-4 sm:px-6 lg:px-8">
          <div className="bg-white rounded-lg shadow-md p-8 text-center">
            <div className="text-6xl mb-4">🎉</div>
            <h2 className="text-3xl font-bold text-gray-900 mb-4">Session Complete!</h2>
            <p className="text-xl text-gray-600 mb-6">
              You reviewed {reviewsCompleted} {reviewsCompleted === 1 ? 'card' : 'cards'} today.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Link
                href="/flashcards"
                className="px-6 py-3 bg-blue-600 text-white rounded-lg font-semibold hover:bg-blue-700 transition-colors"
              >
                Back to Flashcards
              </Link>
              <button
                onClick={() => {
                  setSessionComplete(false);
                  setReviewsCompleted(0);
                }}
                className="px-6 py-3 bg-green-600 text-white rounded-lg font-semibold hover:bg-green-700 transition-colors"
              >
                Review More
              </button>
            </div>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="max-w-4xl mx-auto py-8 px-4 sm:px-6 lg:px-8">
        {/* Header */}
        <div className="flex justify-between items-center mb-8">
          <div>
            <h1 className="text-3xl font-bold text-gray-900 mb-2">Review Session</h1>
            <p className="text-gray-600">Study your flashcards</p>
          </div>
          <Link
            href="/flashcards"
            className="px-4 py-2 bg-gray-200 text-gray-800 rounded-lg hover:bg-gray-300 transition-colors"
          >
            Exit Review
          </Link>
        </div>

        {/* Review Component */}
        <FlashcardReview onComplete={handleComplete} deckId={deckId} />
      </div>
    </div>
  );
}

export default function ReviewPage() {
  return (
    <Suspense fallback={
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
      </div>
    }>
      <ReviewContent />
    </Suspense>
  );
}
