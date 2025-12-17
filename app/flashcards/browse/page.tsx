import { redirect } from 'next/navigation';
import { createClient } from '@/utils/supabase/server';
import FlashcardList from '@/components/FlashcardList';
import Link from 'next/link';

export default async function BrowseFlashcardsPage() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();

  if (!user) {
    redirect('/login');
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="max-w-6xl mx-auto py-8 px-4 sm:px-6 lg:px-8">
        {/* Header */}
        <div className="flex justify-between items-center mb-8">
          <div>
            <h1 className="text-4xl font-bold text-gray-900 mb-2">Browse Flashcards</h1>
            <p className="text-gray-600">View and manage all your flashcards</p>
          </div>
          <Link
            href="/flashcards"
            className="px-4 py-2 bg-gray-200 text-gray-800 rounded-lg hover:bg-gray-300 transition-colors"
          >
            Back to Flashcards
          </Link>
        </div>

        {/* Flashcard List */}
        <FlashcardList />
      </div>
    </div>
  );
}

