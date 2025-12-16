"use client";

import { useState, useEffect } from "react";
import { createClient } from "@/utils/supabase/client";
import { useRouter } from "next/navigation";
import ArabicText from "@/components/ArabicText";

export default function LoginPage() {
  const [mode, setMode] = useState<"signup" | "signin" | null>(null);
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);
  }, []);
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);
  const router = useRouter();
  const supabase = createClient();

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);
    setLoading(true);

    try {
      const { error } = await supabase.auth.signInWithPassword({
        email,
        password,
      });

      if (error) throw error;

      // Verify session is set
      const { data: { session } } = await supabase.auth.getSession();
      console.log("Session after login:", session ? "exists" : "missing");

      if (!session) {
        throw new Error("Session not created. Please try again.");
      }

      // Small delay to ensure cookies are written
      await new Promise(resolve => setTimeout(resolve, 100));

      // Force full page reload
      console.log("Redirecting to /dashboard");
      window.location.href = "/dashboard";
    } catch (error: any) {
      setError(error.message || "An error occurred during login");
      setLoading(false);
    }
  };

  const handleSignUp = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);
    setLoading(true);

    // Validate inputs
    if (!email || !password) {
      setError("Please enter both email and password");
      setLoading(false);
      return;
    }

    if (password.length < 6) {
      setError("Password must be at least 6 characters long");
      setLoading(false);
      return;
    }

    try {
      // Sign up the user
      const { data, error } = await supabase.auth.signUp({
        email,
        password,
      });

      if (error) {
        // Handle specific error cases
        if (error.message.includes("already registered") || error.message.includes("already exists")) {
          setError("An account with this email already exists. Please sign in instead.");
        } else if (error.message.includes("password")) {
          setError("Password is too weak. Please use a stronger password.");
        } else {
          setError(error.message || "Signup failed. Please try again.");
        }
        setLoading(false);
        return;
      }

      if (!data.user) {
        setError("Signup failed - no user data returned. Please try again.");
        setLoading(false);
        return;
      }

      // With email confirmation disabled, we should have a session immediately
      // If not, sign in automatically
      let session = data.session;

      if (!session) {
        // Sign in immediately to get session
        const { data: signInData, error: signInError } = await supabase.auth.signInWithPassword({
          email,
          password,
        });

        if (signInError) {
          setError("Account created but could not sign you in. Please try signing in manually.");
          setLoading(false);
          return;
        }

        session = signInData.session;
      }

      // Verify session is set
      if (!session) {
        setError("Account created but session not accessible. Please try signing in.");
        setLoading(false);
        return;
      }

      // Small delay to ensure cookies are written
      await new Promise(resolve => setTimeout(resolve, 100));

      // Redirect to dashboard
      window.location.href = "/dashboard";
    } catch (error: any) {
      console.error("Signup error:", error);
      setError(error.message || "An error occurred during signup. Please try again.");
      setLoading(false);
    }
  };

  const handleModeSelect = (selectedMode: "signup" | "signin") => {
    setMode(selectedMode);
    setError(null);
    setEmail("");
    setPassword("");
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-teal-50 via-cyan-50 to-blue-50 relative overflow-hidden">
      {/* Decorative background pattern */}
      <div className="absolute inset-0 opacity-5">
        <div className="absolute top-0 left-0 w-96 h-96 bg-teal-400 rounded-full blur-3xl"></div>
        <div className="absolute bottom-0 right-0 w-96 h-96 bg-cyan-400 rounded-full blur-3xl"></div>
      </div>

      {/* Subtle geometric pattern overlay */}
      <div className="absolute inset-0 opacity-[0.02]" style={{
        backgroundImage: `url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23000000' fill-opacity='1'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E")`,
      }}></div>

      <div className="relative z-10 max-w-md w-full mx-4">
        <div className="bg-white/95 backdrop-blur-sm border border-white/20 rounded-2xl shadow-2xl p-8 md:p-10 space-y-8">
          {/* Arabic Welcome Text */}
          {mounted && mode === null && (
            <div className="text-center mb-6">
              <div className="flex justify-center items-center mb-3">
                <ArabicText
                  variant="verse"
                  className="text-3xl md:text-4xl text-teal-700 font-bold block"
                  style={{ fontFamily: 'Amiri, serif', fontSize: '2.5rem', lineHeight: '1.5', textAlign: 'center' }}
                >
                  تعلم العربية القرآنية
                </ArabicText>
              </div>
              <p className="text-lg md:text-xl text-teal-600 font-semibold">Learn Quranic Arabic</p>
            </div>
          )}

          <div>
            <h2 className="text-center text-3xl md:text-4xl font-bold text-gray-900 mb-2">
              {!mounted ? "Welcome to Learn Quranic Arabic" : mode === null
                ? ""
                : mode === "signin"
                  ? "Sign in to your account"
                  : "Create your account"}
            </h2>
            {mounted && mode !== null && (
              <p className="text-center text-gray-600 text-sm mt-2">
                {mode === "signin"
                  ? "Continue your learning journey"
                  : "Start your journey with the Quran"}
              </p>
            )}
          </div>

          {mode === null ? (
            <div className="mt-8 space-y-4">
              <button
                type="button"
                onClick={() => handleModeSelect("signup")}
                className="group relative w-full flex justify-center items-center gap-2 py-4 px-6 border border-transparent text-base font-semibold rounded-xl text-white bg-gradient-to-r from-primary-600 to-primary-700 hover:from-primary-700 hover:to-primary-800 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 shadow-lg hover:shadow-xl transform hover:-translate-y-0.5 transition-all duration-200"
              >
                <span>📖</span>
                Sign up
              </button>
              <button
                type="button"
                onClick={() => handleModeSelect("signin")}
                className="group relative w-full flex justify-center items-center gap-2 py-4 px-6 border-2 border-gray-300 text-base font-semibold rounded-xl text-gray-700 bg-white hover:bg-gray-50 hover:border-primary-400 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 shadow-md hover:shadow-lg transition-all duration-200"
              >
                <span>🔐</span>
                Sign in
              </button>
            </div>
          ) : (
            <form
              className="mt-8 space-y-6"
              onSubmit={mode === "signin" ? handleLogin : handleSignUp}
            >
              {error && (
                <div className="bg-red-50 border-l-4 border-red-500 text-red-700 px-4 py-3 rounded-lg shadow-sm animate-pulse">
                  <div className="flex items-center gap-2">
                    <span className="text-lg">⚠️</span>
                    <p className="font-medium">{error}</p>
                  </div>
                </div>
              )}
              <div className="space-y-4">
                <div>
                  <label htmlFor="email" className="block text-sm font-medium text-gray-700 mb-2">
                    Email address
                  </label>
                  <div className="relative">
                    <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                      <span className="text-gray-400 text-sm">✉️</span>
                    </div>
                    <input
                      id="email"
                      name="email"
                      type="email"
                      autoComplete="email"
                      required
                      className="appearance-none relative block w-full pl-10 pr-3 py-3 border border-gray-300 placeholder-gray-400 text-gray-900 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-all duration-200 bg-white"
                      placeholder="your.email@example.com"
                      value={email}
                      onChange={(e) => setEmail(e.target.value)}
                    />
                  </div>
                </div>
                <div>
                  <label htmlFor="password" className="block text-sm font-medium text-gray-700 mb-2">
                    Password
                  </label>
                  <div className="relative">
                    <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                      <span className="text-gray-400 text-sm">🔒</span>
                    </div>
                    <input
                      id="password"
                      name="password"
                      type="password"
                      autoComplete={mode === "signin" ? "current-password" : "new-password"}
                      required
                      className="appearance-none relative block w-full pl-10 pr-3 py-3 border border-gray-300 placeholder-gray-400 text-gray-900 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-all duration-200 bg-white"
                      placeholder="Enter your password"
                      value={password}
                      onChange={(e) => setPassword(e.target.value)}
                    />
                  </div>
                </div>
              </div>

              <div className="flex flex-col space-y-3">
                <button
                  type="submit"
                  disabled={loading}
                  className="group relative w-full flex justify-center items-center gap-2 py-3.5 px-6 border border-transparent text-base font-semibold rounded-xl text-white bg-gradient-to-r from-primary-600 to-primary-700 hover:from-primary-700 hover:to-primary-800 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 disabled:opacity-50 disabled:cursor-not-allowed shadow-lg hover:shadow-xl transform hover:-translate-y-0.5 transition-all duration-200"
                >
                  {loading ? (
                    <>
                      <svg className="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                        <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                        <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                      </svg>
                      Loading...
                    </>
                  ) : (
                    <>
                      {mode === "signin" ? "🔐 Sign in" : "📖 Sign up"}
                    </>
                  )}
                </button>
                <button
                  type="button"
                  onClick={() => handleModeSelect(mode === "signin" ? "signup" : "signin")}
                  disabled={loading}
                  className="group relative w-full flex justify-center py-3 px-4 border-2 border-gray-300 text-sm font-semibold rounded-xl text-gray-700 bg-white hover:bg-gray-50 hover:border-primary-400 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 disabled:opacity-50 disabled:cursor-not-allowed shadow-sm hover:shadow-md transition-all duration-200"
                >
                  {mode === "signin" ? "Need to sign up?" : "Already have an account?"}
                </button>
                <button
                  type="button"
                  onClick={() => {
                    setMode(null);
                    setError(null);
                    setEmail("");
                    setPassword("");
                  }}
                  disabled={loading}
                  className="text-sm text-gray-600 hover:text-primary-600 font-medium transition-colors duration-200 disabled:opacity-50"
                >
                  ← Back
                </button>
              </div>
            </form>
          )}
        </div>
      </div>
    </div>
  );
}

