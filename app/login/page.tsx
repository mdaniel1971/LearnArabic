"use client";

import { useState } from "react";
import { createClient } from "@/utils/supabase/client";
import { useRouter } from "next/navigation";

export default function LoginPage() {
  const [mode, setMode] = useState<"signup" | "signin" | null>(null);
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
    <div className="min-h-screen flex items-center justify-center bg-white">
      <div className="max-w-md w-full space-y-8 p-8 bg-white border border-gray-200 rounded-xl shadow-sm">
        <div>
          <h2 className="mt-6 text-center text-3xl font-bold text-gray-900">
            {mode === null
              ? "Welcome"
              : mode === "signin"
                ? "Sign in to your account"
                : "Create your account"}
          </h2>
        </div>

        {mode === null ? (
          <div className="mt-8 space-y-4">
            <button
              type="button"
              onClick={() => handleModeSelect("signup")}
              className="group relative w-full flex justify-center py-3 px-4 border border-transparent text-sm font-semibold rounded-lg text-white bg-primary-600 hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 transition-colors"
            >
              Sign up
            </button>
            <button
              type="button"
              onClick={() => handleModeSelect("signin")}
              className="group relative w-full flex justify-center py-3 px-4 border border-gray-300 text-sm font-semibold rounded-lg text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 transition-colors"
            >
              Sign in
            </button>
          </div>
        ) : (
          <form
            className="mt-8 space-y-6"
            onSubmit={mode === "signin" ? handleLogin : handleSignUp}
          >
            {error && (
              <div className="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded">
                {error}
              </div>
            )}
            <div className="rounded-md shadow-sm -space-y-px">
              <div>
                <label htmlFor="email" className="sr-only">
                  Email address
                </label>
                <input
                  id="email"
                  name="email"
                  type="email"
                  autoComplete="email"
                  required
                  className="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-primary-500 focus:border-primary-500 focus:z-10 sm:text-sm"
                  placeholder="Email address"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                />
              </div>
              <div>
                <label htmlFor="password" className="sr-only">
                  Password
                </label>
                <input
                  id="password"
                  name="password"
                  type="password"
                  autoComplete={mode === "signin" ? "current-password" : "new-password"}
                  required
                  className="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-primary-500 focus:border-primary-500 focus:z-10 sm:text-sm"
                  placeholder="Password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                />
              </div>
            </div>

            <div className="flex flex-col space-y-3">
              <button
                type="submit"
                disabled={loading}
                className="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-semibold rounded-lg text-white bg-primary-600 hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
              >
                {loading
                  ? "Loading..."
                  : mode === "signin"
                    ? "Sign in"
                    : "Sign up"}
              </button>
              <button
                type="button"
                onClick={() => handleModeSelect(mode === "signin" ? "signup" : "signin")}
                disabled={loading}
                className="group relative w-full flex justify-center py-2 px-4 border border-gray-300 text-sm font-semibold rounded-lg text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
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
                className="text-sm text-gray-600 hover:text-gray-900"
              >
                Back
              </button>
            </div>
          </form>
        )}
      </div>
    </div>
  );
}

