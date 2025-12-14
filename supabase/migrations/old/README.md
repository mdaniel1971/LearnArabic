# Old Migrations

This folder contains SQL migration files that have already been applied to the database. They are kept here for reference and historical purposes.

## Migration Files

### Schema & Initial Setup (20240101*)
- `20240101000000_create_quran_schema.sql` - Creates the Quran content schema with surahs, verses, and words tables
- `20240101000001_insert_al_fatiha.sql` - Inserts Al-Fatiha (Surah 1) surah data
- `20240101000002_insert_al_fatiha_words.sql` - Inserts word-by-word data for Al-Fatiha
- `20240101000003_add_grammar_info.sql` - Adds grammar_info JSONB column to words table
- `20240101000004_update_al_fatiha_grammar.sql` - Updates Al-Fatiha words with detailed grammar information
- `20240101000005_create_quiz_tables.sql` - Creates quiz_attempts, quiz_questions, and quiz_bank tables

### Juz Amma Population (20240101*)
- `20240101000007_insert_juz_amma_surahs.sql` - Inserts surahs 97-114 (Juz Amma)
- `20240101000008_insert_juz_amma_verses.sql` - Inserts verses for surahs 97-114
- `20240101000009_insert_juz_amma_words.sql` - Inserts word-by-word data for surahs 97-114
- `20240101000010_update_juz_amma_grammar.sql` - Initial grammar data for surahs 97-114 (heuristic-based, later replaced by corpus data)

### Grammar Fixes (20241207*)
- `20241207000001_add_particle_types.sql` - Adds type field to particles (preposition, negative, etc.)
- `20241207000002_fix_remaining_particle_types.sql` - Fixes remaining particles with null types
- `20241207000004_add_voice_to_verbs.sql` - Adds voice field (active/passive) to verbs in surahs 97-114 from morphology file
- `20241207000005_add_verb_form.sql` - Adds form field (Form I-X) to verbs in surahs 97-114 from morphology file
- `20241207000006_add_verb_aspect.sql` - Adds aspect field (perfect/imperfect/imperative) to verbs in surahs 97-114 from morphology file

## Why These Are Here

These migrations have been successfully applied to the database. They are moved to this folder to:
- Keep the main migrations folder clean and focused on new migrations
- Preserve historical record of database changes
- Allow reference if needed for troubleshooting or understanding the schema evolution

## Important Notes

- **Do NOT run these migrations again** - they have already been applied
- If you need to reference the schema or data structure, these files are available here
- New migrations should be placed in the parent `migrations/` folder
- After running new migrations, move them here to keep things organized

