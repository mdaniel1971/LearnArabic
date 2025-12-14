# 🚀 QUICK START - Fix Your Grammar Data

## TL;DR - What You Need to Know

**Problem:** Your grammar data calls مِن (min) a "Noun" when it's actually a "Preposition"

**Solution:** Replace your heuristic-generated grammar with authentic data from Quranic Arabic Corpus

**Time:** 5-10 minutes with Cursor

---

## 📁 Files Included

1. **README.md** ← Read this for full context
2. **CURSOR_PROMPT.md** ⭐ **START HERE** - Copy this into Cursor
3. **fetch-corpus-data.ts** - The actual parsing script
4. **INSTRUCTIONS.md** - Detailed manual instructions

---

## ⚡ Fastest Path (Recommended)

### Step 1: Open Cursor
Open Cursor in your project directory

### Step 2: Copy the Prompt
Open `CURSOR_PROMPT.md` and copy **the entire file**

### Step 3: Paste into Cursor
Paste it into Cursor's chat and let it work

### Step 4: Review the SQL
Cursor will generate a file called something like:
- `supabase/migrations/YYYYMMDD_fix_grammar_from_corpus.sql`

Quick scan to make sure it looks right (should have lots of UPDATE statements)

### Step 5: Run the SQL
In Supabase Dashboard:
1. Go to SQL Editor
2. Paste the generated SQL
3. Click "Run"

### Step 6: Verify
Run this to check:
```sql
SELECT 
  grammar_info->>'part_of_speech' as pos,
  COUNT(*) 
FROM words 
GROUP BY pos 
ORDER BY COUNT(*) DESC;
```

You should now see **way more Prepositions** (like 180 instead of 38)!

---

## 🎯 What This Fixes

### Before:
```json
{
  "number": "singular",
  "part_of_speech": "Noun"  ❌
}
```

### After:
```json
{
  "part_of_speech": "Preposition"  ✅
}
```

---

## 🛡️ Safety Notes

- ✅ Only updates Surahs 97-114
- ✅ Keeps your manual Al-Fatiha data (Surah 1)
- ✅ Only changes the `grammar_info` column
- ✅ Backs up before running (recommended)

---

## ❓ Need Help?

1. **Cursor won't work?** → Try running `fetch-corpus-data.ts` manually
2. **SQL errors?** → Check `INSTRUCTIONS.md` for troubleshooting
3. **Want to understand more?** → Read `README.md` for full details

---

## ✅ Success Checklist

- [ ] Downloaded all 4 files
- [ ] Read CURSOR_PROMPT.md
- [ ] Pasted into Cursor
- [ ] Got SQL file generated
- [ ] Backed up database (optional but recommended)
- [ ] Ran SQL in Supabase
- [ ] Verified with query above
- [ ] Grammar tutorials now show correct POS!

---

**That's it! Your grammar data will be based on authentic Islamic scholarship instead of pattern matching.**

Good luck! 🎓
