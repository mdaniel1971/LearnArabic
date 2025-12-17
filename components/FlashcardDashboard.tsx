'use client';

import { useState, useEffect } from 'react';
import Link from 'next/link';
import { FlashcardStats, Deck } from '@/types/flashcards';
import DeckView from './DeckView';

export default function FlashcardDashboard() {
  const [stats, setStats] = useState<FlashcardStats | null>(null);
  const [decks, setDecks] = useState<Deck[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedDeckId, setSelectedDeckId] = useState<string | null>(null);

  useEffect(() => {
    fetchStats();
    fetchDecks();
  }, []);

  const fetchStats = async () => {
    try {
      const response = await fetch('/api/flashcards/stats');
      if (response.ok) {
        const data = await response.json();
        setStats(data.stats);
      }
    } catch (error) {
      console.error('Error fetching stats:', error);
    } finally {
      setLoading(false);
    }
  };

  const fetchDecks = async () => {
    try {
      const response = await fetch('/api/decks/list');
      if (response.ok) {
        const data = await response.json();
        setDecks(data.decks || []);
      }
    } catch (error) {
      console.error('Error fetching decks:', error);
    }
  };

  const handleDeckClick = (deckId: string) => {
    setSelectedDeckId(deckId);
  };

  const handleBack = () => {
    setSelectedDeckId(null);
    // Refresh stats after returning
    fetchStats();
    fetchDecks();
  };

  if (loading) {
    return (
      <div className="bg-white rounded-lg shadow-md p-6">
        <div className="animate-pulse space-y-4">
          <div className="h-8 bg-gray-200 rounded w-1/3"></div>
          <div className="grid grid-cols-2 md:grid-cols-3 gap-4">
            {[1, 2, 3, 4, 5, 6].map((i) => (
              <div key={i} className="h-20 bg-gray-200 rounded"></div>
            ))}
          </div>
        </div>
      </div>
    );
  }

  if (!stats) {
    return (
      <div className="bg-white rounded-lg shadow-md p-6">
        <p className="text-gray-600">Failed to load statistics</p>
      </div>
    );
  }

  // Show deck view if a deck is selected
  if (selectedDeckId) {
    return <DeckView deckId={selectedDeckId} onBack={handleBack} />;
  }

  return (
    <div className="space-y-6">
      {/* Decks Section */}
      <div className="bg-white rounded-lg shadow-md p-6">
        <h2 className="text-2xl font-bold mb-4">Your Decks</h2>
        {decks.length === 0 ? (
          <p className="text-gray-600">No decks yet. Create your first deck by saving a word!</p>
        ) : (
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {decks.map((deck) => (
              <div
                key={deck.id}
                className="block p-4 border-2 border-gray-200 rounded-lg hover:border-blue-400 hover:shadow-md transition-all cursor-pointer"
                onClick={() => handleDeckClick(deck.id)}
              >
                <div className="flex items-center justify-between mb-2">
                  <div className="flex items-center gap-3">
                    <div
                      className="w-5 h-5 rounded-full"
                      style={{ backgroundColor: deck.color }}
                    ></div>
                    <h3 className="text-lg font-semibold">{deck.name}</h3>
                  </div>
                </div>
                {deck.description && (
                  <p className="text-sm text-gray-600 mb-2">{deck.description}</p>
                )}
                <div className="flex gap-2 mt-3">
                  <button
                    onClick={(e) => {
                      e.stopPropagation();
                      handleDeckClick(deck.id);
                    }}
                    className="flex-1 px-3 py-1.5 bg-blue-600 text-white text-sm rounded hover:bg-blue-700 transition-colors"
                  >
                    View Cards
                  </button>
                  <Link
                    href={`/flashcards/review?deck_id=${deck.id}`}
                    onClick={(e) => e.stopPropagation()}
                    className="flex-1 px-3 py-1.5 bg-green-600 text-white text-sm rounded hover:bg-green-700 transition-colors text-center"
                  >
                    Review
                  </Link>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>

      {/* Statistics Section */}
      <div className="bg-white rounded-lg shadow-md p-6">
        <h2 className="text-2xl font-bold mb-6">Flashcard Statistics</h2>

        <div className="grid grid-cols-2 md:grid-cols-3 gap-4 mb-6">
          <div className="bg-blue-50 rounded-lg p-4">
            <div className="text-sm text-gray-600 mb-1">Total Cards</div>
            <div className="text-3xl font-bold text-blue-600">{stats.total_cards}</div>
          </div>

          <div className="bg-orange-50 rounded-lg p-4">
            <div className="text-sm text-gray-600 mb-1">Due Today</div>
            <div className="text-3xl font-bold text-orange-600">{stats.due_today}</div>
          </div>

          <div className="bg-green-50 rounded-lg p-4">
            <div className="text-sm text-gray-600 mb-1">Reviewed Today</div>
            <div className="text-3xl font-bold text-green-600">{stats.reviewed_today}</div>
          </div>

          <div className="bg-purple-50 rounded-lg p-4">
            <div className="text-sm text-gray-600 mb-1">Mastered</div>
            <div className="text-3xl font-bold text-purple-600">{stats.mastered_cards}</div>
          </div>

          <div className="bg-yellow-50 rounded-lg p-4">
            <div className="text-sm text-gray-600 mb-1">New Cards</div>
            <div className="text-3xl font-bold text-yellow-600">{stats.new_cards}</div>
          </div>

          <div className="bg-indigo-50 rounded-lg p-4">
            <div className="text-sm text-gray-600 mb-1">Avg Ease Factor</div>
            <div className="text-3xl font-bold text-indigo-600">{stats.average_ease_factor.toFixed(2)}</div>
          </div>
        </div>

        <div className="flex flex-col sm:flex-row gap-4">
          <Link
            href="/flashcards/review"
            className={`flex-1 text-center py-3 px-6 rounded-lg font-semibold transition-colors ${stats.due_today > 0
              ? 'bg-green-600 text-white hover:bg-green-700'
              : 'bg-gray-300 text-gray-600 cursor-not-allowed'
              }`}
          >
            {stats.due_today > 0 ? `Review ${stats.due_today} Cards` : 'No Cards Due'}
          </Link>

          <Link
            href="/flashcards/browse"
            className="flex-1 text-center py-3 px-6 rounded-lg font-semibold bg-blue-600 text-white hover:bg-blue-700 transition-colors"
          >
            Browse All Cards
          </Link>

          <Link
            href="/flashcards/stats"
            className="flex-1 text-center py-3 px-6 rounded-lg font-semibold bg-gray-600 text-white hover:bg-gray-700 transition-colors"
          >
            View Statistics
          </Link>
        </div>
      </div>
    </div>
  );
}

