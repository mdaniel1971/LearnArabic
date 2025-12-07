# Supabase Migrations

This directory contains SQL migration files for the Supabase database.

## Running Migrations

### Using Supabase CLI

If you have the Supabase CLI installed:

```bash
# Link to your Supabase project
supabase link --project-ref your-project-ref

# Run migrations
supabase db push
```

### Using Supabase Dashboard

1. Go to your Supabase project dashboard
2. Navigate to **SQL Editor**
3. Copy and paste the contents of the migration file
4. Run the SQL

## Migration Files

- `20240101000000_create_quran_schema.sql` - Creates the Quran content schema with surahs, verses, and words tables

## Schema Overview

### Tables

1. **surahs** - Stores information about each Surah (chapter) of the Quran
2. **verses** - Stores individual verses (ayahs) from each Surah
3. **words** - Stores word-by-word breakdown of each verse with translations

### Features

- Foreign key relationships with CASCADE delete
- Indexes on foreign keys and common lookup patterns
- Row Level Security (RLS) enabled with public read access
- Automatic `updated_at` timestamp updates via triggers
- Unique constraints to prevent duplicate data

