import { redirect } from "next/navigation";
import { createClient } from "@/utils/supabase/server";
import LogoutButton from "@/components/LogoutButton";
import Link from "next/link";

export default async function DashboardPage() {
  const supabase = await createClient();
  const {
    data: { user },
    error,
  } = await supabase.auth.getUser();

  console.log('[Dashboard] Auth check:', { user: !!user, error, userId: user?.id });

  if (!user) {
    redirect("/login");
  }

  // Fetch all surahs
  const { data: surahs, error: surahsError } = await supabase
    .from("surahs")
    .select("surah_number, name_english, name_arabic")
    .order("surah_number", { ascending: true });

  return (
    <div className="min-h-screen bg-white">
      <div className="max-w-6xl mx-auto py-8 px-4 sm:px-6 lg:px-8">
        {/* Header */}
        <div className="flex justify-between items-center mb-8">
          <div>
            <h1 className="text-4xl font-bold text-gray-900 mb-2">Start Reading</h1>
            <p className="text-gray-600">Welcome back, <span className="font-semibold text-primary-700">{user.email}</span></p>
          </div>
          <LogoutButton />
        </div>

        {/* Info Cards */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-8">
          <div className="p-5 bg-primary-50 border border-primary-200 rounded-xl">
            <div className="flex items-start gap-3">
              <span className="text-2xl">📖</span>
              <div>
                <p className="text-gray-900 font-medium mb-1">Grammar Tutorials</p>
                <p className="text-sm text-gray-600">Click words to learn Arabic grammar</p>
              </div>
            </div>
          </div>
          <div className="p-5 bg-primary-50 border border-primary-200 rounded-xl">
            <div className="flex items-start gap-3">
              <span className="text-2xl">📊</span>
              <div>
                <p className="text-gray-900 font-medium mb-1">Quiz History</p>
                <p className="text-sm text-gray-600">Track your learning progress</p>
              </div>
            </div>
          </div>
        </div>

        {/* Surahs List */}
        <div className="bg-white rounded-xl border border-gray-200 shadow-sm">
          <div className="p-6 border-b border-gray-200">
            <h2 className="text-2xl font-semibold text-gray-900">Surahs</h2>
            <p className="text-sm text-gray-600 mt-1">Choose a surah to study</p>
          </div>
          <div className="p-6">
            {surahs && surahs.length > 0 ? (
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
                {surahs.map((surah) => (
                  <div key={surah.surah_number} className="group">
                    <div className="relative block p-4 bg-white border border-gray-200 rounded-lg hover:border-primary-400 hover:bg-primary-50 transition-all duration-200">
                      <Link
                        href={`/surah/${surah.surah_number}`}
                        className="block"
                      >
                        <div className="flex items-center justify-between mb-2">
                          <span className="text-sm font-semibold text-primary-600">
                            {String(surah.surah_number).padStart(3, '0')}
                          </span>
                        </div>
                        <div className="text-left">
                          <p className="font-semibold text-gray-900 mb-1">{surah.name_english}</p>
                          <p dir="rtl" className="font-arabic text-primary-700" style={{ fontFamily: 'Amiri, serif', fontSize: '16px', direction: 'rtl' }}>
                            {surah.name_arabic}
                          </p>
                          <p className="text-xs text-gray-500 mt-1">{surah.total_verses} Ayahs</p>
                        </div>
                      </Link>
                      <Link
                        href="/quiz-history"
                        className="absolute top-4 right-4 text-lg opacity-0 group-hover:opacity-100 transition-opacity hover:text-primary-600 z-10"
                        title="View quiz history"
                      >
                        📊
                      </Link>
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <p className="text-gray-600 text-center py-8">No surahs available</p>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}

