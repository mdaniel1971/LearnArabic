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
    <div className="min-h-screen bg-gray-50">
      <div className="max-w-7xl mx-auto py-12 px-4 sm:px-6 lg:px-8">
        <div className="bg-white rounded-lg shadow-md p-8">
          <div className="flex justify-between items-center mb-6">
            <h1 className="text-3xl font-bold text-gray-900">Dashboard</h1>
            <LogoutButton />
          </div>
          <div className="mt-8 space-y-6">
            <p className="text-xl text-gray-700">
              Welcome <span className="font-semibold">{user.email}</span>
            </p>
            
            <div className="border-t pt-6">
              <h2 className="text-2xl font-semibold text-gray-900 mb-4">
                Throughout this site you can:
              </h2>
              <div className="mb-4 space-y-3">
                <div className="p-4 bg-blue-50 border border-blue-200 rounded-lg">
                  <div className="flex items-start gap-3">
                    <span className="text-2xl">📖</span>
                    <p className="text-gray-700" style={{ fontSize: '18px' }}>
                      Click this icon for grammar tutorials.
                    </p>
                  </div>
                </div>
                <div className="p-4 bg-blue-50 border border-blue-200 rounded-lg">
                  <div className="flex items-start gap-3">
                    <span className="text-2xl">📊</span>
                    <p className="text-gray-700" style={{ fontSize: '18px' }}>
                      Click this icon to view quiz histories.
                    </p>
                  </div>
                </div>
              </div>
              <div className="space-y-3">
                <h2 className="text-2xl font-semibold text-gray-900 mb-3">
                  Choose a surah to study:
                </h2>
                {surahs && surahs.length > 0 ? (
                  <div className="space-y-2">
                    {surahs.map((surah) => (
                      <div key={surah.surah_number} className="flex items-center gap-2">
                        <Link
                          href={`/surah/${surah.surah_number}`}
                          className="inline-block px-4 py-2 bg-green-50 border border-green-200 font-medium rounded-md text-gray-900 hover:bg-green-100 hover:border-green-300 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 transition-colors"
                          style={{ fontSize: '18px' }}
                        >
                          <span className="text-gray-900">{surah.name_english}</span>
                          {' - '}
                          <span dir="rtl" className="inline-block font-arabic" style={{ fontFamily: 'Amiri, serif', fontSize: '18px', direction: 'rtl' }}>
                            {surah.name_arabic}
                          </span>
                        </Link>
                        <Link
                          href="/quiz-history"
                          className="text-3xl hover:scale-110 transition-transform cursor-pointer"
                          title="View quiz history"
                        >
                          📊
                        </Link>
                      </div>
                    ))}
                  </div>
                ) : (
                  <p className="text-gray-600">No surahs available</p>
                )}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

