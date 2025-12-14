# Import Scripts for Surahs 78-96

This directory contains scripts to import surahs 78-96 into the Quranic Arabic Learning Platform database.

## Scripts Created

### 1. `import-surahs-78-96.ts` - Complete Import Script

This is the main script that performs all three steps:
- **Step 1: Verification** - Checks corpus coverage
- **Step 2: Extraction** - Extracts data from morphology file and @kmaslesa package
- **Step 3: Import** - Imports to Supabase with idempotent upserts

### 2. `01-verify-corpus-78-96.ts` - Verification Only

Standalone verification script to check corpus coverage.

## Usage

### Verification Only
```bash
npx tsx scripts/import-surahs-78-96.ts --verify-only
```

### Full Import (with verification)
```bash
npx tsx scripts/import-surahs-78-96.ts
```

### Import Without Verification
```bash
npx tsx scripts/import-surahs-78-96.ts --skip-verify
```

## Requirements

1. **Environment Variables** (in `.env.local` or `.env`):
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `SUPABASE_SERVICE_KEY` or `SUPABASE_SERVICE_ROLE_KEY`

2. **Data Files**:
   - `docs/corpus-files/quran-morphology.txt` - Quranic Arabic Corpus morphology data

3. **NPM Packages**:
   - `@kmaslesa/holy-quran-word-by-word-full-data` - For translations and transliterations

## What the Script Does

1. **Verification**: Checks that the morphology file has complete coverage for all verses in surahs 78-96
2. **Extraction**: 
   - Parses morphology file for grammar data
   - Fetches translations from @kmaslesa package
   - Fetches Arabic verse text from quran-json CDN
3. **Import**:
   - Inserts surah metadata (idempotent upsert)
   - Inserts verses (idempotent upsert)
   - Inserts words with grammar_info from morphology file (idempotent upsert)

## Data Sources

- **Surah Metadata**: Hardcoded in script (Arabic names, English names, verse counts)
- **Arabic Verse Text**: quran-json CDN (`https://cdn.jsdelivr.net/npm/quran-json@3.1.2/dist/chapters/{surah}.json`)
- **Translations/Transliterations**: `@kmaslesa/holy-quran-word-by-word-full-data` package
- **Grammar Data**: `docs/corpus-files/quran-morphology.txt` (Quranic Arabic Corpus)

## Safety Features

- All database operations use `ON CONFLICT DO UPDATE` (idempotent upserts)
- Existing data for surahs 1, 97-114 is preserved
- Script can be run multiple times safely
- Verification step ensures data quality before import

## Testing After Import

After running the import, verify:

1. **Existing surahs unchanged**:
   ```sql
   SELECT COUNT(*) FROM surahs WHERE surah_number IN (1, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114);
   ```

2. **New surahs present**:
   ```sql
   SELECT surah_number, name_english, total_verses FROM surahs WHERE surah_number BETWEEN 78 AND 96 ORDER BY surah_number;
   ```

3. **Test interactive word clicking** on new surahs in the UI

4. **Test quiz generation** for new surahs

5. **Test AI tutorial generation** for words in new surahs

## Fixing Existing Data

If surahs 97-114 (or any other surahs) are displaying with broken Arabic characters, run the fix script:

```bash
npx tsx scripts/fix-arabic-encoding-existing-surahs.ts
```

This script:
- Re-fetches Arabic text from quran-json CDN (standard encoding)
- Updates verse text in the database
- Updates word text in the database
- Preserves translations, transliterations, and grammar_info

## Troubleshooting

If the script doesn't output anything:
- Check that `tsx` is installed: `npm install -D tsx`
- Try running with explicit output: `npx tsx scripts/import-surahs-78-96.ts --verify-only 2>&1 | tee output.log`
- Check for syntax errors: `npx tsc --noEmit scripts/import-surahs-78-96.ts`

If verification fails:
- Check that `docs/corpus-files/quran-morphology.txt` exists and has data for surahs 78-96
- Verify the file format matches the expected format (surah:verse:word:segment TAB arabic TAB pos TAB features)

If import fails:
- Check Supabase connection and service key
- Verify database schema matches expected structure
- Check that existing surahs (1, 97-114) are not affected

