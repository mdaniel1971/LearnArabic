-- Fix surah name translations to ensure accuracy
-- This migration corrects plural/singular mismatches and standardizes translations

-- Fix Surah 100: الْعَادِيَاتِ (Al-Adiyat)
-- The Arabic name is plural (ات ending), so the English should be plural
-- Change from "The Courser" (singular) to "The Chargers" (plural)
UPDATE surahs
SET name_english = 'The Chargers'
WHERE surah_number = 100
  AND name_arabic = 'الْعَادِيَاتِ';

