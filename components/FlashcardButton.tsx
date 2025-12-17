'use client';

import { useState, useEffect } from 'react';
import { createClient } from '@/utils/supabase/client';
import DeckSelectionModal from './DeckSelectionModal';
import CreateDeckModal from './CreateDeckModal';

interface FlashcardButtonProps {
  wordId: number;
  onSaved?: () => void;
}

export default function FlashcardButton({ wordId, onSaved }: FlashcardButtonProps) {
  const [isSaved, setIsSaved] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const [isChecking, setIsChecking] = useState(true);
  const [showDeckSelection, setShowDeckSelection] = useState(false);
  const [showCreateDeck, setShowCreateDeck] = useState(false);
  const [message, setMessage] = useState<string | null>(null);

  useEffect(() => {
    checkIfSaved();
  }, [wordId]);

  const checkIfSaved = async () => {
    try {
      const supabase = createClient();
      const { data: { user } } = await supabase.auth.getUser();

      if (!user) {
        setIsChecking(false);
        return;
      }

      const response = await fetch(`/api/flashcards/list?limit=1000`);
      if (response.ok) {
        const data = await response.json();
        const exists = data.flashcards?.some((card: any) => card.word_id === wordId);
        setIsSaved(exists);
      }
    } catch (error) {
      console.error('Error checking flashcard status:', error);
    } finally {
      setIsChecking(false);
    }
  };

  const handleSaveClick = () => {
    if (isSaved) {
      setMessage('Already saved as a card');
      setTimeout(() => setMessage(null), 2000);
      return;
    }
    setShowDeckSelection(true);
  };

  const handleDeckSelect = async (deckId: string) => {
    setShowDeckSelection(false);
    await saveFlashcard(deckId);
  };

  const handleCreateDeck = () => {
    setShowDeckSelection(false);
    setShowCreateDeck(true);
  };

  const handleDeckCreated = async (deckId: string) => {
    setShowCreateDeck(false);
    await saveFlashcard(deckId);
  };

  const saveFlashcard = async (deckId: string) => {
    if (isLoading) return;

    setIsLoading(true);
    try {
      const response = await fetch('/api/flashcards/create', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ word_id: wordId, deck_id: deckId }),
      });

      const data = await response.json();

      if (response.status === 409) {
        // Already exists
        setIsSaved(true);
        setMessage('Already saved as a card');
        setTimeout(() => setMessage(null), 2000);
        return;
      }

      if (!response.ok) {
        throw new Error(data.error || 'Failed to save flashcard');
      }

      setIsSaved(true);
      setMessage('Card saved');
      setTimeout(() => setMessage(null), 2000);

      if (onSaved) {
        onSaved();
      }
    } catch (error: any) {
      console.error('Error saving flashcard:', error);
      setMessage(error.message || 'Failed to save flashcard');
      setTimeout(() => setMessage(null), 3000);
    } finally {
      setIsLoading(false);
    }
  };

  if (isChecking) {
    return (
      <button
        disabled
        className="text-2xl opacity-50 cursor-not-allowed"
        title="Checking..."
      >
        🔖
      </button>
    );
  }

  return (
    <>
      <div className="relative">
        <button
          onClick={handleSaveClick}
          disabled={isLoading}
          className={`text-2xl hover:scale-110 transition-transform ${isSaved ? 'opacity-100' : 'opacity-70 hover:opacity-100'
            } ${isLoading ? 'opacity-50' : ''}`}
          title={isSaved ? 'Already saved to flashcards' : 'Save to flashcards'}
        >
          {isSaved ? '🔖' : '🔖'}
        </button>
        {message && (
          <div className="absolute top-full left-1/2 transform -translate-x-1/2 mt-2 px-3 py-1 bg-gray-800 text-white text-xs rounded whitespace-nowrap z-50">
            {message}
          </div>
        )}
      </div>

      <DeckSelectionModal
        isOpen={showDeckSelection}
        onClose={() => setShowDeckSelection(false)}
        onSelect={handleDeckSelect}
        onCreateNew={handleCreateDeck}
      />

      <CreateDeckModal
        isOpen={showCreateDeck}
        onClose={() => setShowCreateDeck(false)}
        onCreated={handleDeckCreated}
      />
    </>
  );
}

