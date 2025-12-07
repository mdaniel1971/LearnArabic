# Learn Arabic

A Next.js 14 application with Supabase authentication.

## Setup

1. Install dependencies:
```bash
npm install
```

2. Set up your Supabase project:
   - Go to [supabase.com](https://supabase.com) and create a new project
   - In Authentication > Providers, ensure:
     - **Email** provider is enabled
     - **Anonymous** sign-ins are disabled (this app only uses email/password)
   - In Authentication > Email Templates, you can disable "Confirm signup" if you want users to sign in immediately after signup (optional)
   - Get your project URL and anon key from Project Settings > API
   - Create a `.env.local` file in the root directory with:
   ```
   NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
   MISTRAL_API_KEY=your_mistral_api_key
   SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key
   ```
   - Get your Mistral API key from [console.mistral.ai](https://console.mistral.ai)
   - Get your Supabase Service Role Key from Project Settings > API > service_role key (keep this secret!)

3. Run the development server:
```bash
npm run dev
```

4. Open [http://localhost:3000](http://localhost:3000) in your browser.

## Populating Juz Amma (Surahs 97-114)

To populate the database with surahs 97-114 (Juz Amma):

1. Ensure you have `SUPABASE_SERVICE_ROLE_KEY` in your `.env.local` file (get it from Supabase Dashboard > Project Settings > API)

2. Install dependencies (if you haven't already):
```bash
npm install
```

3. Run the population script:
```bash
npm run populate-juz-amma
```

The script will:
- Fetch data from the quran-json CDN for surahs 97-114
- Insert surah metadata, verses, and word-by-word breakdowns
- Generate basic grammar tags (full tutorials are generated on-demand via 📖 icon)
- Verify the data and show a summary

The script is idempotent and safe to re-run if it fails partway through.

## Features

- **Email/password authentication only** - No anonymous sign-ins (uses Supabase `signInWithPassword` and `signUp` methods)
- Login page with sign in and sign up functionality
- Protected dashboard page that displays the user's email
- Automatic redirects based on authentication state
- Logout functionality
- Middleware-based route protection

