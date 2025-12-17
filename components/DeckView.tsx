'use client';

import { useState, useEffect } from 'react';
import { Flashcard, Deck } from '@/types/flashcards';
import ArabicText from './ArabicText';
import Link from 'next/link';

interface DeckViewProps {
  deckId: string;
  onBack: () => void;
}

export default function DeckView({ deckId, onBack }: DeckViewProps) {
  const [deck, setDeck] = useState<Deck | null>(null);
  const [cards, setCards] = useState<Flashcard[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  const [isEditing, setIsEditing] = useState(false);
  const [editName, setEditName] = useState('');
  const [editDescription, setEditDescription] = useState('');
  const [editColor, setEditColor] = useState('#3B82F6');
  const [saving, setSaving] = useState(false);

  const DEFAULT_COLORS = [
    '#3B82F6', // Blue
    '#10B981', // Green
    '#F59E0B', // Amber
    '#EF4444', // Red
    '#8B5CF6', // Purple
    '#EC4899', // Pink
    '#06B6D4', // Cyan
    '#F97316', // Orange
  ];

  useEffect(() => {
    loadDeckAndCards();
  }, [deckId]);

  useEffect(() => {
    if (deck) {
      setEditName(deck.name);
      setEditDescription(deck.description || '');
      setEditColor(deck.color);
    }
  }, [deck]);

  const loadDeckAndCards = async () => {
    try {
      // Load deck info
      const decksResponse = await fetch('/api/decks/list');
      if (decksResponse.ok) {
        const decksData = await decksResponse.json();
        const foundDeck = decksData.decks?.find((d: Deck) => d.id === deckId);
        setDeck(foundDeck || null);
      }

      // Load cards for this deck
      const cardsResponse = await fetch(`/api/flashcards/list?deck_id=${deckId}&limit=1000`);
      if (cardsResponse.ok) {
        const cardsData = await cardsResponse.json();
        setCards(cardsData.flashcards || []);
      } else {
        console.error('Failed to load cards:', cardsResponse.status);
      }
    } catch (error) {
      console.error('Error loading deck:', error);
    } finally {
      setLoading(false);
    }
  };

  const handleSaveEdit = async () => {
    if (!editName.trim()) {
      alert('Deck name is required');
      return;
    }

    setSaving(true);
    try {
      const response = await fetch('/api/decks/update', {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          deck_id: deckId,
          name: editName.trim(),
          description: editDescription.trim() || null,
          color: editColor,
        }),
      });

      const data = await response.json();

      if (!response.ok) {
        throw new Error(data.error || 'Failed to update deck');
      }

      setDeck(data.deck);
      setIsEditing(false);
    } catch (error: any) {
      console.error('Error updating deck:', error);
      alert(error.message || 'Failed to update deck');
    } finally {
      setSaving(false);
    }
  };

  const handleDeleteDeck = async () => {
    if (!confirm(`Are you sure you want to delete "${deck?.name}"? This will also delete all ${cards.length} cards in this deck.`)) {
      return;
    }

    try {
      const response = await fetch(`/api/decks/delete?id=${deckId}`, {
        method: 'DELETE',
      });

      if (response.ok) {
        onBack(); // Return to dashboard
      } else {
        const data = await response.json();
        alert(data.error || 'Failed to delete deck');
      }
    } catch (error) {
      console.error('Error deleting deck:', error);
      alert('Failed to delete deck');
    }
  };

  const handleDelete = async (cardId: string) => {
    if (!confirm('Are you sure you want to delete this flashcard?')) {
      return;
    }

    try {
      const response = await fetch(`/api/flashcards/delete?flashcard_id=${cardId}`, {
        method: 'DELETE',
      });

      if (response.ok) {
        setCards(cards.filter(card => card.id !== cardId));
      } else {
        const data = await response.json();
        alert(data.error || 'Failed to delete flashcard');
      }
    } catch (error) {
      console.error('Error deleting flashcard:', error);
      alert('Failed to delete flashcard');
    }
  };

  const filteredCards = cards.filter(card => {
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

  if (!deck) {
    return (
      <div className="text-center py-8">
        <p className="text-gray-600 mb-4">Deck not found</p>
        <button
          onClick={onBack}
          className="px-4 py-2 bg-gray-200 text-gray-800 rounded-lg hover:bg-gray-300 transition-colors"
        >
          Back to Dashboard
        </button>
      </div>
    );
  }

  return (
    <div className="space-y-4">
      {/* Header */}
      <div className="flex items-center justify-between mb-4">
        <div className="flex items-center gap-3">
          <button
            onClick={onBack}
            className="text-gray-600 hover:text-gray-800"
          >
            ← Back
          </button>
          {!isEditing ? (
            <div className="flex items-center gap-3">
              <div
                className="w-5 h-5 rounded-full"
                style={{ backgroundColor: deck.color }}
              ></div>
              <h2 className="text-2xl font-bold">{deck.name}</h2>
            </div>
          ) : (
            <div className="flex items-center gap-3 flex-1">
              <div className="flex items-center gap-2">
                <div
                  className="w-5 h-5 rounded-full"
                  style={{ backgroundColor: editColor }}
                ></div>
                <input
                  type="text"
                  value={editName}
                  onChange={(e) => setEditName(e.target.value)}
                  className="px-3 py-1 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 text-2xl font-bold"
                  placeholder="Deck name"
                />
              </div>
            </div>
          )}
        </div>
        <div className="flex items-center gap-2">
          {!isEditing ? (
            <>
              <button
                onClick={() => setIsEditing(true)}
                className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors font-semibold"
              >
                Edit Deck
              </button>
              <Link
                href={`/flashcards/review?deck_id=${deckId}`}
                className="px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-colors font-semibold"
              >
                Review Deck
              </Link>
              <button
                onClick={handleDeleteDeck}
                className="px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-colors font-semibold"
              >
                Delete Deck
              </button>
            </>
          ) : (
            <>
              <button
                onClick={handleSaveEdit}
                disabled={saving}
                className="px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-colors font-semibold disabled:opacity-50"
              >
                {saving ? 'Saving...' : 'Save'}
              </button>
              <button
                onClick={() => {
                  setIsEditing(false);
                  if (deck) {
                    setEditName(deck.name);
                    setEditDescription(deck.description || '');
                    setEditColor(deck.color);
                  }
                }}
                className="px-4 py-2 bg-gray-200 text-gray-800 rounded-lg hover:bg-gray-300 transition-colors"
              >
                Cancel
              </button>
            </>
          )}
        </div>
      </div>

      {!isEditing ? (
        deck.description && (
          <p className="text-gray-600 mb-4">{deck.description}</p>
        )
      ) : (
        <div className="mb-4 space-y-3">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Description
            </label>
            <textarea
              value={editDescription}
              onChange={(e) => setEditDescription(e.target.value)}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              rows={2}
              placeholder="Add a description..."
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Color
            </label>
            <div className="flex gap-2 flex-wrap">
              {DEFAULT_COLORS.map((c) => (
                <button
                  key={c}
                  type="button"
                  onClick={() => setEditColor(c)}
                  className={`w-10 h-10 rounded-full border-2 transition-all ${editColor === c ? 'border-gray-800 scale-110' : 'border-gray-300'
                    }`}
                  style={{ backgroundColor: c }}
                />
              ))}
            </div>
          </div>
        </div>
      )}

      {/* Search */}
      <div className="mb-4">
        <input
          type="text"
          placeholder="Search cards..."
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
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

