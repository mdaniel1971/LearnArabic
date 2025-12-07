import { createClient } from "@/utils/supabase/server";
import { redirect } from "next/navigation";
import Link from "next/link";
import ArabicText from "@/components/ArabicText";
import VerseDisplay from "@/components/VerseDisplay";
import { Surah, Verse, Word } from "@/types/quran";

interface SurahPageProps {
  params: {
    id: string;
  };
}

export default async function SurahPage({ params }: SurahPageProps) {
  const surahId = parseInt(params.id);
  
  if (isNaN(surahId)) {
    redirect("/dashboard");
  }

  const supabase = await createClient();

  // Fetch surah
  const { data: surah, error: surahError } = await supabase
    .from("surahs")
    .select("*")
    .eq("surah_number", surahId)
    .single();

  if (surahError || !surah) {
    redirect("/dashboard");
  }

  // Fetch verses for this surah
  const { data: verses, error: versesError } = await supabase
    .from("verses")
    .select("*")
    .eq("surah_id", surah.id)
    .order("verse_number", { ascending: true });

  if (versesError || !verses) {
    return <div>Error loading verses</div>;
  }

  // Fetch all words for all verses
  // Explicitly select all columns including grammar_info
  const verseIds = verses.map((v) => v.id);
  const { data: words, error: wordsError } = await supabase
    .from("words")
    .select("id, verse_id, word_position, text_arabic, transliteration, translation_english, grammar_info, created_at, updated_at")
    .in("verse_id", verseIds)
    .order("verse_id", { ascending: true })
    .order("word_position", { ascending: true });

  if (wordsError) {
    return <div>Error loading words</div>;
  }

  // Debug: Log first word to verify grammar_info is included
  if (words && words.length > 0) {
    console.log('[Surah Page] First word data:', words[0]);
    console.log('[Surah Page] First word grammar_info:', words[0].grammar_info);
  }

  // Group words by verse_id
  const wordsByVerse = new Map<number, Word[]>();
  words?.forEach((word) => {
    if (!wordsByVerse.has(word.verse_id)) {
      wordsByVerse.set(word.verse_id, []);
    }
    wordsByVerse.get(word.verse_id)!.push(word);
  });

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-6">
          <Link
            href="/dashboard"
            className="text-indigo-600 hover:text-indigo-800"
          >
            ← Back to Dashboard
          </Link>
        </div>
        {/* Surah Header */}
        <div className="bg-white rounded-lg shadow-md p-6 mb-6">
          <div className="text-center">
            <h1 className="text-3xl font-bold text-gray-900 mb-2">
              {surah.name_english}
            </h1>
            <div dir="rtl" className="text-right">
              <ArabicText variant="verse" className="text-3xl">
                {surah.name_arabic}
              </ArabicText>
            </div>
            <p className="text-gray-600 mt-4">
              {surah.total_verses} verses
            </p>
            <Link 
              href={`/surah/${surah.surah_number}/quiz`}
              className="inline-block mt-6 w-full max-w-md bg-purple-600 text-white py-4 rounded-lg text-center font-semibold hover:bg-purple-700 transition-colors"
            >
              📝 Take Quiz
            </Link>
          </div>
        </div>

        {/* Verses */}
        <div className="space-y-6">
          {verses.map((verse) => {
            const verseWords = wordsByVerse.get(verse.id) || [];
            return (
              <VerseDisplay
                key={verse.id}
                verse={verse}
                words={verseWords}
              />
            );
          })}
        </div>
      </div>
    </div>
  );
}

