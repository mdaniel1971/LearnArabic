# Troubleshooting Guide

## "Anonymous sign-ins are disabled" Error

If you're seeing this error when clicking "Sign up", it's likely a Supabase configuration issue. Here's how to fix it:

### Step 1: Verify Email Provider is Enabled

1. Go to your Supabase project dashboard
2. Navigate to **Authentication** > **Providers**
3. Find the **Email** provider
4. Make sure it's **enabled** (toggle should be ON)
5. Click **Save**

### Step 2: Verify Anonymous Sign-ins are Disabled

1. In the same **Authentication** > **Providers** page
2. Find the **Anonymous** provider
3. Make sure it's **disabled** (toggle should be OFF)
4. This is correct - we only want email/password authentication

### Step 3: Check Email Confirmation Settings

1. Go to **Authentication** > **Email Templates**
2. Or check **Authentication** > **Settings**
3. Look for "Enable email confirmations"
4. If you want users to sign in immediately after signup:
   - **Disable** email confirmations
5. If you want email confirmation:
   - **Enable** email confirmations
   - Users will need to check their email and click the confirmation link before signing in

### Step 4: Verify Environment Variables

Make sure your `.env.local` file has the correct values:

```env
NEXT_PUBLIC_SUPABASE_URL=https://your-project-ref.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
```

**Important:** 
- Get these values from **Project Settings** > **API** in your Supabase dashboard
- Make sure there are no extra spaces or quotes
- Restart your Next.js dev server after changing `.env.local`

### Step 5: Check Browser Console

1. Open your browser's developer tools (F12)
2. Go to the **Console** tab
3. Try signing up again
4. Look for any error messages that might give more details

### Step 6: Verify Supabase Project Status

1. In your Supabase dashboard, check that your project is **active**
2. Make sure you're using the correct project URL and keys

## Still Having Issues?

If the error persists after checking all the above:

1. Check the browser console for detailed error messages
2. Verify your Supabase project is not paused or suspended
3. Try creating a new Supabase project and updating your `.env.local` with the new credentials
4. Make sure you're using the latest version of `@supabase/supabase-js` and `@supabase/ssr`

