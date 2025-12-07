# Security & Sandboxing Guide
## Quranic Arabic Learning Platform

## 🔒 CURSOR SANDBOXING - CRITICAL SETUP

### Files Created
1. ✅ `.cursorignore` - Prevents Cursor from accessing files outside project
2. ✅ `.vscode/settings.json` - Workspace-level restrictions
3. ✅ `.gitignore` - Prevents committing sensitive data

### Immediate Actions Required

#### 1. Verify Project Location
```bash
# Make sure you're in the correct directory
pwd
# Should show: D:\Projects\quranic-arabic-platform (or your chosen path)
```

#### 2. Initialize Git (if not already done)
```bash
git init
git add .
git commit -m "Initial commit with security configuration"
```

#### 3. Create Environment File Template
```bash
# Create .env.example (safe to commit)
cp .env .env.example
# Then manually remove actual API keys from .env.example
```

#### 4. Cursor Settings to Verify

Open Cursor Settings (Ctrl+,) and ensure:
- [ ] **Auto-execute** is DISABLED
- [ ] **Terminal command confirmation** is ENABLED
- [ ] **Workspace trust** is configured
- [ ] Never run Cursor as Administrator

## 🛡️ SECURITY LAYERS

### Layer 1: File System Isolation
- `.cursorignore` blocks parent directory access
- Only allows project-specific directories
- Protects system directories (C:\, D:\ root)

### Layer 2: Workspace Restrictions
- VSCode settings prevent file watching outside project
- Terminal requires confirmation for commands
- Git operations require confirmation

### Layer 3: Environment Protection
```env
# .env file (NEVER COMMIT THIS)
NEXT_PUBLIC_SUPABASE_URL=your_url_here
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_key_here
SUPABASE_SERVICE_ROLE_KEY=your_service_key_here
MISTRAL_API_KEY=your_mistral_key_here

# Database
DATABASE_URL=your_database_url_here
```

```env
# .env.example (SAFE TO COMMIT)
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_service_role_key
MISTRAL_API_KEY=your_mistral_api_key
DATABASE_URL=postgresql://...
```

### Layer 4: Code Review Protocol

**ALWAYS review before accepting Cursor suggestions for:**
- Database schema changes
- API route modifications
- Authentication logic
- Environment variable usage
- External API calls
- File system operations

## 🚨 RED FLAGS TO WATCH FOR

### Cursor/AI Agent Warning Signs:
1. **Requests to access parent directories** (`../`, `../../`)
2. **Requests to modify system files** (`/etc/`, `C:\Windows\`)
3. **Requests for API keys** in plain text
4. **Auto-execution without review**
5. **Database migrations** without your explicit approval
6. **npm install** of suspicious packages

### What To Do If You See These:
1. ❌ **REJECT** the suggestion immediately
2. 📝 Review what it was trying to do
3. 🔍 Check if your security files are in place
4. 💬 Ask Cursor to explain its reasoning

## 📁 PROJECT STRUCTURE (Secured)

```
quranic-arabic-platform/
├── .cursorignore          ← SECURITY: Blocks external access
├── .gitignore            ← SECURITY: Protects secrets
├── .vscode/
│   └── settings.json     ← SECURITY: Workspace restrictions
├── .env                  ← NEVER COMMIT (in .gitignore)
├── .env.example          ← Safe template
├── app/                  ← Next.js app directory
├── components/           ← React components
├── lib/                  ← Utilities (Supabase client, etc.)
├── public/              ← Static assets
├── supabase/            ← Database migrations
│   └── migrations/
├── styles/              ← CSS files
└── package.json
```

## 🔐 API KEY MANAGEMENT

### Supabase Keys
- **Anon Key**: Safe for client-side (public)
- **Service Role Key**: NEVER expose to client (server-only)

### Mistral AI Key
- Store in `.env` file
- Access only from API routes (server-side)
- Never send to client

### Environment Variables in Next.js
```javascript
// Client-side (safe): NEXT_PUBLIC_ prefix
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;

// Server-side only (secure): No prefix
const mistralKey = process.env.MISTRAL_API_KEY; // Only in API routes!
```

## 🧪 TESTING SECURITY

### Test 1: Parent Directory Access
```bash
# This should be BLOCKED by .cursorignore
cat ../.env  # Should fail or show nothing
```

### Test 2: Git Status
```bash
git status
# Should NOT show .env or any sensitive files
```

### Test 3: Environment Variables
```bash
# Verify .env is not in git
git ls-files | grep .env
# Should only show .env.example (if you created it)
```

## 📊 SUPABASE ROW LEVEL SECURITY (RLS)

### Critical Tables to Protect:
```sql
-- Users can only see their own progress
CREATE POLICY "Users can view own progress" ON user_progress
  FOR SELECT USING (auth.uid() = user_id);

-- Users can only update their own progress
CREATE POLICY "Users can update own progress" ON user_progress
  FOR UPDATE USING (auth.uid() = user_id);

-- Quiz results - users can only see their own
CREATE POLICY "Users can view own quiz results" ON quiz_results
  FOR SELECT USING (auth.uid() = user_id);
```

## 🔄 REGULAR SECURITY CHECKS

### Weekly:
- [ ] Review git commits for accidentally committed secrets
- [ ] Check `.env` is still in `.gitignore`
- [ ] Verify RLS policies in Supabase

### Before Each Cursor Session:
- [ ] Confirm you're in the correct project directory
- [ ] Verify `.cursorignore` exists
- [ ] Check Cursor isn't running as Administrator

### Before Deploying:
- [ ] Rotate any API keys that might have been exposed
- [ ] Review all environment variables
- [ ] Test authentication flows
- [ ] Verify RLS policies are active

## 🆘 EMERGENCY PROCEDURES

### If API Key Exposed:
1. **Immediately** rotate the key in the provider dashboard
2. Update `.env` with new key
3. Deploy updated environment variables
4. Review git history: `git log --all --full-history -- .env`
5. If committed, consider key compromised forever

### If Unauthorized Access Detected:
1. Change all API keys immediately
2. Review Supabase auth logs
3. Check for suspicious user accounts
4. Review all recent database changes

## 📚 RESOURCES

- [Supabase Row Level Security](https://supabase.com/docs/guides/auth/row-level-security)
- [Next.js Environment Variables](https://nextjs.org/docs/app/building-your-application/configuring/environment-variables)
- [Git Security Best Practices](https://docs.github.com/en/code-security/getting-started/best-practices-for-preventing-data-leaks-in-your-organization)

## ✅ SECURITY CHECKLIST (Before Starting Development)

- [ ] `.cursorignore` file created and configured
- [ ] `.vscode/settings.json` configured with restrictions
- [ ] `.gitignore` includes `.env` and sensitive files
- [ ] Git repository initialized
- [ ] `.env.example` created (sanitized template)
- [ ] Actual `.env` file created with real keys (NOT committed)
- [ ] Cursor auto-execute disabled
- [ ] Supabase RLS policies planned
- [ ] Regular security review schedule set
- [ ] Emergency procedures documented and understood

---

**Remember**: Security is not a one-time setup. It's an ongoing practice. Review and update these procedures as your project evolves.

*"The best time to implement security was at project start. The second best time is now."*
