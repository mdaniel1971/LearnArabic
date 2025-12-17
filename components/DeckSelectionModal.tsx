'use client';

import { useState, useEffect } from 'react';
import { Deck } from '@/types/flashcards';

interface DeckSelectionModalProps {
  isOpen: boolean;
  onClose: () => void;
  onSelect: (deckId: string) => void;
  onCreateNew: () => void;
}

export default function DeckSelectionModal({
  isOpen,
  onClose,
  onSelect,
  onCreateNew,
}: DeckSelectionModalProps) {
  const [decks, setDecks] = useState<Deck[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (isOpen) {
      loadDecks();
    }
  }, [isOpen]);

  const loadDecks = async () => {
    try {
      const response = await fetch('/api/decks/list');
      if (response.ok) {
        const data = await response.json();
        setDecks(data.decks || []);
      }
    } catch (error) {
      console.error('Error loading decks:', error);
    } finally {
      setLoading(false);
    }
  };

  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
      <div className="bg-white rounded-lg shadow-xl max-w-md w-full mx-4">
        <div className="p-6">
          <h2 className="text-2xl font-bold mb-4">Select a Deck</h2>
          
          {loading ? (
            <div className="text-center py-8">
              <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600 mx-auto"></div>
            </div>
          ) : (
            <>
              {decks.length === 0 ? (
                <div className="text-center py-8">
                  <p className="text-gray-600 mb-4">No decks yet. Create your first deck!</p>
                </div>
              ) : (
                <div className="space-y-2 mb-4 max-h-64 overflow-y-auto">
                  {decks.map((deck) => (
                    <button
                      key={deck.id}
                      onClick={() => onSelect(deck.id)}
                      className="w-full text-left p-3 rounded-lg border border-gray-200 hover:bg-gray-50 hover:border-blue-300 transition-colors"
                    >
                      <div className="flex items-center gap-3">
                        <div
                          className="w-4 h-4 rounded-full"
                          style={{ backgroundColor: deck.color }}
                        ></div>
                        <div className="flex-1">
                          <div className="font-semibold">{deck.name}</div>
                          {deck.description && (
                            <div className="text-sm text-gray-500">{deck.description}</div>
                          )}
                        </div>
                      </div>
                    </button>
                  ))}
                </div>
              )}
              
              <div className="flex gap-3">
                <button
                  onClick={onCreateNew}
                  className="flex-1 px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-colors font-semibold"
                >
                  Create New Deck
                </button>
                <button
                  onClick={onClose}
                  className="px-4 py-2 bg-gray-200 text-gray-800 rounded-lg hover:bg-gray-300 transition-colors"
                >
                  Cancel
                </button>
              </div>
            </>
          )}
        </div>
      </div>
    </div>
  );
}

