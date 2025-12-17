'use client';

import { useState, useEffect } from 'react';
import { Flashcard } from '@/types/flashcards';
import ArabicText from './ArabicText';

export default function FlashcardList() {
  const [flashcards, setFlashcards] = useState<Flashcard[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  const [filter, setFilter] = useState<'all' | 'due' | 'new' | 'mastered'>('all');
  const [sortBy, setSortBy] = useState<'date' | 'ease' | 'interval'>('date');

  useEffect(() => {
    loadFlashcards();
  }, [filter, sortBy]);

  const loadFlashcards = async () => {
    try {
      const url = filter === 'due'
        ? '/api/flashcards/list?due_only=true&limit=1000'
        : '/api/flashcards/list?limit=1000';

      const response = await fetch(url);
      if (response.ok) {
        const data = await response.json();
        let cards = data.flashcards || [];

        // Apply sorting
        cards = sortCards(cards, sortBy);

        setFlashcards(cards);
      }
    } catch (error) {
      console.error('Error loading flashcards:', error);
    } finally {
      setLoading(false);
    }
  };

  const sortCards = (cards: Flashcard[], sort: string) => {
    const sorted = [...cards];
    switch (sort) {
      case 'ease':
        return sorted.sort((a, b) => b.ease_factor - a.ease_factor);
      case 'interval':
        return sorted.sort((a, b) => b.interval_days - a.interval_days);
      case 'date':
      default:
        return sorted.sort((a, b) =>
          new Date(a.next_review_date).getTime() - new Date(b.next_review_date).getTime()
        );
    }
  };

  const handleDelete = async (id: string) => {
    if (!confirm('Are you sure you want to delete this flashcard?')) {
      return;
    }

    try {
      const response = await fetch(`/api/flashcards/delete?id=${id}`, {
        method: 'DELETE',
      });

      if (response.ok) {
        setFlashcards(flashcards.filter(card => card.id !== id));
      } else {
        alert('Failed to delete flashcard');
      }
    } catch (error) {
      console.error('Error deleting flashcard:', error);
      alert('Failed to delete flashcard');
    }
  };

  const filteredCards = flashcards.filter(card => {
    if (!searchTerm) return true;
    const term = searchTerm.toLowerCase();
    return (
      card.word?.text_arabic?.toLowerCase().includes(term) ||
      card.word?.transliteration?.toLowerCase().includes(term) ||
      card.word?.translation_english?.toLowerCase().includes(term)
    );
  });

  const getDueStatus = (nextReviewDate: string) => {
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    const reviewDate = new Date(nextReviewDate);
    reviewDate.setHours(0, 0, 0, 0);

    if (reviewDate < today) return 'overdue';
    if (reviewDate.getTime() === today.getTime()) return 'due';
    return 'upcoming';
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[400px]">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
      </div>
    );
  }

  return (
    <div className="space-y-4">
      {/* Filters and Search */}
      <div className="bg-white rounded-lg shadow-md p-4">
        <div className="flex flex-col md:flex-row gap-4">
          <input
            type="text"
            placeholder="Search by Arabic, transliteration, or translation..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="flex-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
          />

          <select
            value={filter}
            onChange={(e) => setFilter(e.target.value as any)}
            className="px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            <option value="all">All Cards</option>
            <option value="due">Due for Review</option>
            <option value="new">New Cards</option>
            <option value="mastered">Mastered</option>
          </select>

          <select
            value={sortBy}
            onChange={(e) => setSortBy(e.target.value as any)}
            className="px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            <option value="date">Sort by Date</option>
            <option value="ease">Sort by Ease</option>
            <option value="interval">Sort by Interval</option>
          </select>
        </div>
      </div>

      {/* Cards List */}
      <div className="bg-white rounded-lg shadow-md p-4">
        <div className="mb-4">
          <h3 className="text-lg font-semibold">
            {filteredCards.length} {filteredCards.length === 1 ? 'card' : 'cards'}
          </h3>
        </div>

        {filteredCards.length === 0 ? (
          <div className="text-center py-12 text-gray-500">
            <p>No flashcards found.</p>
          </div>
        ) : (
          <div className="space-y-4">
            {filteredCards.map((card) => {
              const dueStatus = getDueStatus(card.next_review_date);
              return (
                <div
                  key={card.id}
                  className="border border-gray-200 rounded-lg p-4 hover:shadow-md transition-shadow"
                >
                  <div className="flex justify-between items-start">
                    <div className="flex-1">
                      <div className="flex items-center gap-3 mb-2">
                        <div className="text-3xl font-amiri">
                          <ArabicText>{card.word?.text_arabic || card.word_text_arabic || ''}</ArabicText>
                        </div>
                        {(card.word?.transliteration || card.word_transliteration) && (
                          <div className="text-lg text-gray-600 italic">
                            {card.word?.transliteration || card.word_transliteration}
                          </div>
                        )}
                      </div>

                      <div className="text-lg font-semibold text-gray-800 mb-2">
                        {card.word?.translation_english || card.word_translation_english}
                      </div>
                      {card.word_details_text && (
                        <div className="text-sm text-gray-600 mb-2 italic">
                          {card.word_details_text}
                        </div>
                      )}

                      <div className="flex flex-wrap gap-4 text-sm text-gray-600">
                        <div>
                          <span className="font-semibold">Ease:</span> {card.ease_factor.toFixed(2)}
                        </div>
                        <div>
                          <span className="font-semibold">Interval:</span> {card.interval_days} days
                        </div>
                        <div>
                          <span className="font-semibold">Repetitions:</span> {card.repetitions}
                        </div>
                        <div>
                          <span className="font-semibold">Next Review:</span>{' '}
                          <span className={
                            dueStatus === 'overdue' ? 'text-red-600 font-semibold' :
                              dueStatus === 'due' ? 'text-orange-600 font-semibold' :
                                'text-gray-600'
                          }>
                            {new Date(card.next_review_date).toLocaleDateString()}
                          </span>
                        </div>
                      </div>
                    </div>

                    <button
                      onClick={() => handleDelete(card.id)}
                      className="ml-4 text-red-500 hover:text-red-700 transition-colors"
                      title="Delete flashcard"
                    >
                      🗑️
                    </button>
                  </div>
                </div>
              );
            })}
          </div>
        )}
      </div>
    </div>
  );
}

