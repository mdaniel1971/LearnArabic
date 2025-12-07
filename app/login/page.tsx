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
      console.log("Starting signup with email:", email);
      
      // Verify Supabase client is initialized
      if (!supabase) {
        throw new Error("Supabase client not initialized");
      }
      
      // Check if Supabase URL and key are available
      const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
      const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
      
      console.log("Supabase config check:", {
        hasUrl: !!supabaseUrl,
        hasKey: !!supabaseKey,
        urlPreview: supabaseUrl ? `${supabaseUrl.substring(0, 20)}...` : "missing",
        clientExists: !!supabase
      });
      
      if (!supabaseUrl || !supabaseKey) {
        throw new Error("Supabase configuration is missing. Please check your .env.local file and restart the dev server.");
      }

      console.log("Calling signUp...");
      
      // Add timeout to prevent hanging
      const signupPromise = supabase.auth.signUp({
        email,
        password,
      });
      
      const timeoutPromise = new Promise((_, reject) => 
        setTimeout(() => reject(new Error("Signup request timed out. Please check your internet connection and try again.")), 10000)
      );
      
      const { data, error } = await Promise.race([signupPromise, timeoutPromise]) as any;

      console.log("Signup response received:", { 
        hasUser: !!data?.user,
        userId: data?.user?.id,
        hasSession: !!data?.session,
        error: error?.message 
      });

      if (error) {
        console.error("Signup error:", error);
        setError(error.message || "Signup failed. Please try again.");
        setLoading(false);
        return;
      }

      if (!data.user) {
        setError("Signup failed - no user data returned. Please try again.");
        setLoading(false);
        return;
      }

      // Check if we have a session (email confirmation disabled)
      if (data.session) {
        // Verify session is set
        const { data: { session } } = await supabase.auth.getSession();
        console.log("Session after signup:", session ? "exists" : "missing");

        if (!session) {
          setError("Account created but session not accessible. Please try signing in.");
          setLoading(false);
          return;
        }

        // Small delay to ensure cookies are written
        await new Promise(resolve => setTimeout(resolve, 100));

        // Force full page reload
        window.location.href = "/dashboard";
        return;
      }

      // No session - try to sign in immediately
      console.log("No session after signup, attempting sign in...");
      const { error: signInError, data: signInData } = await supabase.auth.signInWithPassword({
        email,
        password,
      });

      console.log("Sign in response:", {
        hasSession: !!signInData?.session,
        error: signInError?.message
      });

      if (signInError) {
        console.error("Sign in after signup error:", signInError);
        setError(
          "Account created! However, you may need to confirm your email. Please check your email inbox or try signing in."
        );
        setLoading(false);
        return;
      }

      // Verify session is set
      const { data: { session } } = await supabase.auth.getSession();
      console.log("Session after signup/signin:", session ? "exists" : "missing");

      if (!session) {
        setError(
          "Account created! However, you may need to confirm your email. Please check your email inbox or try signing in."
        );
        setLoading(false);
        return;
      }

      // Small delay to ensure cookies are written
      await new Promise(resolve => setTimeout(resolve, 100));

      // Force full page reload
      console.log("Redirecting to /dashboard");
      window.location.href = "/dashboard";
    } catch (error: any) {
      console.error("Signup error details:", error);
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
    <div className="min-h-screen flex items-center justify-center bg-gray-50">
      <div className="max-w-md w-full space-y-8 p-8 bg-white rounded-lg shadow-md">
        <div>
          <h2 className="mt-6 text-center text-3xl font-extrabold text-gray-900">
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
              className="group relative w-full flex justify-center py-3 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
            >
              Sign up
            </button>
            <button
              type="button"
              onClick={() => handleModeSelect("signin")}
              className="group relative w-full flex justify-center py-3 px-4 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
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
                  className="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
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
                  className="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
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
                className="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 disabled:opacity-50 disabled:cursor-not-allowed"
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
                className="group relative w-full flex justify-center py-2 px-4 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 disabled:opacity-50 disabled:cursor-not-allowed"
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

