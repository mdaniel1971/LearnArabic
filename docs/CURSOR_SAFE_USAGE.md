# 🚀 CURSOR SAFE USAGE - QUICK REFERENCE

## ✅ DO's

### Before Each Session
```bash
# 1. Verify you're in the right directory
pwd  # Should be: D:\Projects\quranic-arabic-platform

# 2. Check security files exist
ls -la .cursorignore .gitignore

# 3. Confirm .env is NOT tracked
git status | grep .env  # Should only show .env.example
```

### During Development
- ✅ Review ALL code before accepting
- ✅ Read terminal commands before running
- ✅ Use Cursor's "Preview" feature
- ✅ Make small, incremental changes
- ✅ Commit frequently with meaningful messages
- ✅ Test locally before deploying

### Using Cursor Composer/Agent Mode
- ✅ Start with specific, bounded tasks
- ✅ Review the plan before execution
- ✅ Stop if it suggests anything unexpected
- ✅ Keep conversations focused on one feature

## ❌ DON'Ts

### NEVER Accept These Suggestions:
- ❌ Access to parent directories (`../`, `../../`)
- ❌ Modifying system files (`C:\Windows`, `/etc/`)
- ❌ Installing unknown npm packages without review
- ❌ Exposing API keys in client-side code
- ❌ Disabling security features "to make it work"
- ❌ Running commands with `sudo` or as Administrator
- ❌ Automatic database migrations without review

### Red Flag Patterns:
```javascript
❌ const apiKey = "actual-key-here"  // Hard-coded secrets
❌ fs.readFile('../../config')       // Parent directory access
❌ process.env.SECRET_KEY            // Client-side secret access
❌ eval(userInput)                   // Code execution
❌ dangerouslySetInnerHTML          // XSS risk
```

## 🎯 PROJECT-SPECIFIC SAFE PATTERNS

### Environment Variables
```javascript
✅ Good (Server-side API route):
export async function POST(request: Request) {
  const mistralKey = process.env.MISTRAL_API_KEY;
  // Use mistralKey only on server
}

✅ Good (Client-side):
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;

❌ Bad (Exposing secret on client):
const mistralKey = process.env.MISTRAL_API_KEY; // In a component!
```

### Database Access
```javascript
✅ Good (Using Supabase client):
const { data } = await supabase
  .from('user_progress')
  .select('*')
  .eq('user_id', user.id);  // RLS protects this

❌ Bad (Raw SQL without RLS):
const query = `SELECT * FROM user_progress WHERE user_id = '${userId}'`;
```

### AI API Calls
```javascript
✅ Good (Server-side API route):
// /app/api/generate-tutorial/route.ts
export async function POST(request: Request) {
  const response = await fetch('https://api.mistral.ai/...', {
    headers: { 
      'Authorization': `Bearer ${process.env.MISTRAL_API_KEY}` 
    }
  });
}

❌ Bad (Client-side component):
// Making AI API call directly from browser
fetch('https://api.mistral.ai/...', {
  headers: { 'Authorization': `Bearer ${mistralKey}` }
});
```

## 🔍 QUICK SECURITY CHECKS

### Check 1: Git Safety
```bash
# What's being tracked?
git ls-files

# Should NOT include:
# - .env (only .env.example is okay)
# - node_modules/
# - .next/
# - Any files with "secret" or "key" in name
```

### Check 2: Environment Safety
```bash
# Check for exposed secrets in code
grep -r "MISTRAL_API_KEY" app/  # Should only be in API routes
grep -r "SERVICE_ROLE_KEY" app/ # Should only be in server code
```

### Check 3: Package Safety
```bash
# Before accepting package installations
npm audit                    # Check for vulnerabilities
cat package.json            # Review new dependencies
```

## 💡 WORKFLOW FOR NEW FEATURES

### Safe Development Flow:
1. **Plan** - Outline feature with Cursor chat
2. **Review** - Read the proposed changes
3. **Isolate** - Create a new branch
   ```bash
   git checkout -b feature/new-feature
   ```
4. **Implement** - Accept changes incrementally
5. **Test** - Verify locally
6. **Commit** - Save your work
   ```bash
   git add .
   git commit -m "feat: add new feature"
   ```
7. **Merge** - Only after testing
   ```bash
   git checkout main
   git merge feature/new-feature
   ```

## 🆘 IF SOMETHING GOES WRONG

### Cursor Tried to Access Parent Directory
```bash
# 1. Reject the change
# 2. Check .cursorignore is still in place
cat .cursorignore

# 3. If it was modified, restore it
git checkout .cursorignore
```

### Accidentally Committed .env
```bash
# 1. Remove from git (but keep local file)
git rm --cached .env

# 2. Commit the removal
git commit -m "Remove .env from git"

# 3. Verify .gitignore includes .env
cat .gitignore | grep .env

# 4. IMPORTANT: Rotate all API keys!
```

### Suspicious Package Installed
```bash
# 1. Remove it
npm uninstall suspicious-package

# 2. Check what it modified
git diff

# 3. Restore if needed
git checkout -- package.json package-lock.json
```

## 📋 DAILY CHECKLIST

Start of day:
- [ ] `pwd` to verify location
- [ ] `git status` to see what's changed
- [ ] Cursor NOT running as Administrator

End of day:
- [ ] `git status` - no sensitive files staged
- [ ] All API keys still in `.env` only
- [ ] Commit your work

## 🎓 TEACHING CURSOR SAFELY

### Good Prompts:
```
✅ "Create a server-side API route to generate grammar tutorials using Mistral AI"
✅ "Add a component to display word translations with proper RTL support"
✅ "Implement RLS policy for user_progress table"
```

### Risky Prompts:
```
❌ "Just make it work" (too vague, might bypass security)
❌ "Disable that error" (might disable important checks)
❌ "Install all the packages I need" (unknown dependencies)
```

## 🔗 QUICK LINKS

- 📁 [Full Security Guide](./SECURITY.md)
- 🔐 [Supabase Dashboard](https://app.supabase.com)
- 🤖 [Mistral Console](https://console.mistral.ai)
- 📦 [npm Security](https://docs.npmjs.com/auditing-package-dependencies-for-security-vulnerabilities)

---

**Remember**: If Cursor suggests something that makes you uncomfortable, STOP and review. It's better to be cautious than to fix a security breach later.

**Your responsibility**: Cursor is a tool. You're the developer. Always understand what's being changed.
