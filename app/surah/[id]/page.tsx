import { createClient } from "@/utils/supabase/server";
import { redirect } from "next/navigation";
import Link from "next/link";
import ArabicText from "@/components/ArabicText";
import VerseDisplay from "@/components/VerseDisplay";
import BismillahDisplay from "@/components/BismillahDisplay";
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

  // Fetch Bismillah words from Al-Fatiha verse 1 if needed
  // Bismillah should appear for all surahs except Al-Fatiha (1) and At-Tawbah (9)
  let bismillahWords: Word[] = [];
  const shouldShowBismillah = surah.surah_number !== 1 && surah.surah_number !== 9;

  if (shouldShowBismillah) {
    // Fetch Al-Fatiha verse 1 words
    const { data: alFatihaSurah } = await supabase
      .from("surahs")
      .select("id")
      .eq("surah_number", 1)
      .single();

    if (alFatihaSurah) {
      const { data: alFatihaVerse1 } = await supabase
        .from("verses")
        .select("id")
        .eq("surah_id", alFatihaSurah.id)
        .eq("verse_number", 1)
        .single();

      if (alFatihaVerse1) {
        const { data: bismillahWordsData } = await supabase
          .from("words")
          .select("id, verse_id, word_position, text_arabic, transliteration, translation_english, grammar_info, created_at, updated_at")
          .eq("verse_id", alFatihaVerse1.id)
          .order("word_position", { ascending: true });

        if (bismillahWordsData) {
          bismillahWords = bismillahWordsData;
        }
      }
    }
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
    <div className="min-h-screen bg-white py-8">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-6">
          <Link
            href="/dashboard"
            className="text-primary-600 hover:text-primary-700 font-medium inline-flex items-center gap-2 px-[10px] py-[10px]"
          >
            <span>←</span> Back to Dashboard
          </Link>
        </div>
        {/* Surah Header */}
        <div className="bg-green-50 border border-gray-200 rounded-xl shadow-sm p-8 mb-8">
          <div className="text-center">
            <div className="inline-flex items-center justify-center w-12 h-12 rounded-full bg-primary-100 text-primary-700 font-bold text-lg mb-4">
              {surah.surah_number}
            </div>
            <div className="flex items-center justify-center gap-4 mb-3">
              <h1 className="text-3xl font-bold text-gray-900">
                {surah.name_english}
              </h1>
              <div dir="rtl" className="text-center">
                <ArabicText variant="verse" className="text-primary-700" style={{ fontSize: '50px' }}>
                  {surah.name_arabic}
                </ArabicText>
              </div>
            </div>
            <p className="text-gray-600 mb-6">
              {surah.total_verses} Ayahs
            </p>
            <div className="flex items-center justify-center">
              <Link
                href={`/surah/${surah.surah_number}/quiz`}
                className="px-[15px] py-[8px] bg-primary-600 text-white rounded-lg hover:bg-primary-700 transition-colors font-semibold"
              >
                Take quiz
              </Link>
            </div>
          </div>
        </div>

        <p className="text-gray-600 my-4 text-left">
          Select a word to see its translation and grammar. In the Word Details box, select the grammar tutorial icon 📖 to learn more through examples from the Quran.
        </p>

        {/* Bismillah - Display for all surahs except Al-Fatiha (1) and At-Tawbah (9) */}
        {shouldShowBismillah && bismillahWords.length > 0 && (
          <BismillahDisplay words={bismillahWords} />
        )}

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

