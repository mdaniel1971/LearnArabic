# LearnQuranicArabic - Development Workflow

## Quick Reference

```bash
# Daily Development
npm run dev          # Start development server (localhost:3000)

# Before Pushing (Recommended)
npm run build        # Test production build
npm run start        # Test production locally

# Deploy
git add .
git commit -m "description"
git push            # Auto-deploys to Vercel
```

---

## Complete Development Workflow

### 1. Starting Development

```bash
cd ~/LearnQuranicArabic
npm run dev
```

- Opens at: http://localhost:3000
- Hot reload enabled (changes appear instantly)
- Use this for all development work

### 2. Making Changes

**Edit files in:**
- `app/` - Pages and API routes
- `components/` - React components
- `utils/` - Utility functions
- `types/` - TypeScript types

**Save files** → Changes appear immediately in browser

### 3. Testing Changes

**In Development:**
```bash
npm run dev          # Running already
# Test in browser at localhost:3000
```

**Before Committing (Recommended):**
```bash
npm run build        # Verify production build works
npm run start        # Test at localhost:3000
# If successful, proceed to git commit
```

---

## Git Workflow

### Basic Commit & Push

```bash
# Check what changed
git status

# Add all changes
git add .

# Commit with descriptive message
git commit -m "feat: Add new quiz feature"

# Push to GitHub (triggers Vercel deploy)
git push
```

### Commit Message Convention

Use prefixes for clarity:
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` UI/CSS changes
- `refactor:` Code restructuring
- `test:` Adding tests
- `chore:` Maintenance tasks

**Examples:**
```bash
git commit -m "feat: Add grammar tutorial modal"
git commit -m "fix: Resolve quiz submission error"
git commit -m "docs: Update architecture documentation"
git commit -m "style: Improve dashboard layout"
```

---

## Vercel Deployment

### Automatic Deployment

```bash
git push
# Vercel automatically:
# 1. Detects push to GitHub
# 2. Runs npm install
# 3. Runs npm run build
# 4. Deploys globally (~2-3 minutes)
# 5. Site updates at your-app.vercel.app
```

### Monitoring Deployment

1. Go to https://vercel.com/dashboard
2. Click your project
3. See deployment status in real-time
4. Click deployment to view logs

### If Deployment Fails

**Check build logs in Vercel:**
- Click failed deployment
- Review error messages
- Usually: TypeScript errors or missing env vars

**Fix and redeploy:**
```bash
# Fix the error locally
npm run build        # Verify fix works
git add .
git commit -m "fix: Resolve build error"
git push            # Redeploy
```

**Quick rollback:**
1. Go to Vercel dashboard
2. Find last working deployment
3. Click "⋮" → "Promote to Production"
4. Instant rollback (no git needed)

---

## Branch-Based Workflow (Recommended for Features)

### Creating a Feature Branch

```bash
# Create and switch to new branch
git checkout -b feature/new-quiz-types

# Make changes
npm run dev

# Commit changes
git add .
git commit -m "feat: Add fill-in-the-blank quiz type"

# Push branch to GitHub
git push origin feature/new-quiz-types
```

**Vercel automatically creates a preview deployment** for this branch!

### Testing Preview Deployment

1. Go to Vercel dashboard
2. Find preview deployment for your branch
3. Get unique URL: `learn-arabic-git-feature-xyz.vercel.app`
4. Test thoroughly on preview URL
5. If good, merge to main

### Merging to Production

```bash
# Switch back to main
git checkout main

# Merge your feature
git merge feature/new-quiz-types

# Push to production
git push

# Delete feature branch (optional)
git branch -d feature/new-quiz-types
git push origin --delete feature/new-quiz-types
```

---

## Environment Variables

### Local Development

**File:** `.env.local` (never commit this!)

```bash
NEXT_PUBLIC_SUPABASE_URL=your_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_key
MISTRAL_API_KEY=your_key
```

### Production (Vercel)

**Set in Vercel Dashboard:**
1. Project Settings → Environment Variables
2. Add same variables as `.env.local`
3. Check: Production, Preview, Development

**If you change env vars in Vercel:**
- Go to Deployments
- Click "Redeploy" on latest deployment
- Variables update without code changes

---

## Testing Workflow

### Testing Locally

**Development mode:**
```bash
npm run dev
# Test at localhost:3000
```

**Production mode (before deploying):**
```bash
npm run build        # Must succeed
npm run start        # Test at localhost:3000
```

### Testing on Vercel

**Preview deployments:**
- Push any branch → get preview URL
- Test features before merging to main

**Production testing:**
- After deployment completes
- Visit your live URL
- Test critical paths:
  - [ ] Login works
  - [ ] Dashboard loads
  - [ ] Surah pages display
  - [ ] Quizzes generate
  - [ ] Quiz submission works
  - [ ] History shows results

---

## Troubleshooting

### Build Fails Locally

```bash
# Clean and rebuild
rm -rf .next node_modules
npm install
npm run build
```

### Build Fails on Vercel

**Common causes:**
1. TypeScript errors → Check build logs
2. Missing env variables → Check Vercel settings
3. Dependency issues → Check package.json

**Fix:**
```bash
# Test locally first
npm run build

# If it works locally but fails on Vercel:
# - Check environment variables in Vercel
# - Check Node.js version (should match locally)
```

### Production Works But Features Don't

**Check:**
1. Browser console (F12) for errors
2. Environment variables set correctly in Vercel
3. Supabase URL accessible from Vercel
4. API rate limits (Mistral AI)

### Git Issues

**Forgot to commit before making new changes:**
```bash
git stash           # Save current changes
git commit -m "..."  # Commit previous work
git stash pop       # Restore saved changes
```

**Want to undo last commit (not pushed):**
```bash
git reset --soft HEAD~1    # Undo commit, keep changes
git reset --hard HEAD~1    # Undo commit, discard changes
```

**Already pushed but want to undo:**
```bash
git revert HEAD            # Creates new commit that undoes last commit
git push
```

---

## Daily Workflow Examples

### Small Fix

```bash
npm run dev
# Make small change (typo, CSS tweak)
git add .
git commit -m "fix: Correct typo in dashboard"
git push
# Done - auto-deploys
```

### New Feature

```bash
npm run dev
# Develop feature
# Test thoroughly

npm run build              # Verify it builds
npm run start              # Test production version

git add .
git commit -m "feat: Add word pronunciation feature"
git push
# Vercel deploys
```

### Complex Feature (Use Branch)

```bash
git checkout -b feature/advanced-quiz
npm run dev
# Develop feature over multiple days

git add .
git commit -m "feat: Add advanced quiz logic"
git push origin feature/advanced-quiz
# Test preview deployment

# When ready:
git checkout main
git merge feature/advanced-quiz
git push
```

---

## File Organization Reminders

### When Creating New Files

**Pages:**
- `app/new-page/page.tsx` - New route

**Components:**
- `components/NewComponent.tsx` - Reusable components

**API Routes:**
- `app/api/new-endpoint/route.ts` - New API endpoint

**Types:**
- `types/new-types.ts` - TypeScript interfaces

**Utilities:**
- `utils/new-util.ts` - Helper functions

### Files to NEVER Commit

Add to `.gitignore`:
```
.env.local
.env*.local
node_modules/
.next/
.DS_Store
*.log
```

---

## Performance Monitoring

### Check Bundle Sizes

```bash
npm run build
# Look at output:
# Route (app)                              Size
# ƒ /dashboard                           154 kB  ← Watch these
```

**If pages > 300 kB:**
- Consider code splitting
- Lazy load components
- Optimize images

### Monitor Vercel Analytics

1. Go to Vercel dashboard
2. Click your project
3. Analytics tab shows:
   - Page views
   - Performance scores
   - Error rates

### Monitor Costs

**Supabase:**
- Dashboard → Project Settings → Usage
- Free tier: Check database size and API requests

**Mistral AI:**
- Dashboard → Usage
- Monitor API calls and costs

**Vercel:**
- Dashboard → Usage
- Free tier: 100GB bandwidth/month

---

## Backup Strategy

### Database Backups (Supabase)

Automatic daily backups on paid tier.

Free tier: Export manually:
```sql
-- In Supabase SQL Editor
-- Export specific tables as needed
```

### Code Backups

**Already covered by Git + GitHub:**
- Every commit is a backup
- GitHub stores entire history
- Vercel deployments are versioned

**Additional protection:**
```bash
# Tag important releases
git tag -a v1.0.0 -m "First stable release"
git push origin v1.0.0
```

---

## Quick Commands Reference

```bash
# Development
npm run dev              # Start dev server
npm run build            # Test production build
npm run start            # Run production locally
npm run lint             # Check code quality

# Git
git status               # What changed?
git add .                # Stage all changes
git commit -m "msg"      # Commit changes
git push                 # Deploy to production
git pull                 # Get latest from GitHub

# Branches
git checkout -b name     # Create new branch
git checkout main        # Switch to main
git merge branch-name    # Merge branch
git branch -d name       # Delete branch

# Cleanup
rm -rf .next             # Remove build cache
rm -rf node_modules      # Remove dependencies
npm install              # Reinstall dependencies

# Inspection
git log --oneline        # View commit history
git diff                 # See unstaged changes
git reflog               # See all git actions
```

---

## When Things Go Wrong

### "It works locally but not in production"

1. Check environment variables in Vercel
2. Check browser console on live site (F12)
3. Check Vercel function logs
4. Compare `.env.local` with Vercel env vars

### "Build suddenly started failing"

1. Check recent commits: `git log --oneline -5`
2. Try reverting last commit: `git revert HEAD`
3. Clean rebuild: `rm -rf .next node_modules && npm install && npm run build`

### "Lost uncommitted work"

```bash
# Check if anything is stashed
git stash list

# Recover from reflog (if committed)
git reflog
git checkout <commit-hash>
```

### "Need to work on old version"

```bash
# Create branch from old commit
git checkout -b fix-old-version <commit-hash>

# Make changes
git add .
git commit -m "fix: Backport fix to old version"
git push origin fix-old-version
```

---

## Best Practices

### ✅ Do This

- Commit frequently with clear messages
- Test `npm run build` before major changes
- Use branches for complex features
- Check Vercel deployment logs
- Monitor costs (Supabase, Mistral, Vercel)
- Keep `.env.local` in sync with Vercel
- Review preview deployments before merging

### ❌ Don't Do This

- Don't commit `.env.local` or API keys
- Don't push broken builds to main
- Don't work directly on main for big features
- Don't ignore build warnings (they become errors)
- Don't deploy Friday afternoon (debugging on weekends 😅)
- Don't skip testing after env var changes

---

## Getting Help

**Build errors:**
- Read error message carefully
- Google: "Next.js [error message]"
- Check Next.js docs: https://nextjs.org/docs

**Vercel issues:**
- Check deployment logs in dashboard
- Vercel docs: https://vercel.com/docs
- Vercel Discord: Community support

**Supabase issues:**
- Check RLS policies
- Supabase docs: https://supabase.com/docs
- Supabase Discord: Community support

**Git issues:**
- `git status` shows current state
- `git reflog` shows all actions (can recover anything)
- Git docs: https://git-scm.com/doc

---

## Continuous Learning

As you deploy more:
- You'll get faster at spotting build errors
- You'll know which changes need `npm run build`
- You'll develop your own workflow shortcuts
- You'll learn what works best for your style

**The workflow will become second nature. Start with the careful approach, then optimize based on experience.**

---

*Last updated: December 2025*