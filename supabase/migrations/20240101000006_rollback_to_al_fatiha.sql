-- Rollback Database to Al-Fatiha Only
-- This script deletes all surahs except Al-Fatiha (Surah 1) to restore the original working state

-- Delete words from surahs other than Fatiha
DELETE FROM words 
WHERE verse_id IN (
  SELECT v.id FROM verses v
  JOIN surahs s ON v.surah_id = s.id
  WHERE s.surah_number != 1
);

-- Delete verses from surahs other than Fatiha
DELETE FROM verses 
WHERE surah_id IN (
  SELECT id FROM surahs WHERE surah_number != 1
);

-- Delete all surahs except Fatiha
DELETE FROM surahs WHERE surah_number != 1;

-- Verification queries (run these separately to verify rollback worked):
-- SELECT * FROM surahs; -- Should return only 1 row (Al-Fatiha)
-- SELECT COUNT(*) FROM verses; -- Should return 7 (Al-Fatiha's verses)
-- SELECT COUNT(*) FROM words; -- Should return 29 (Al-Fatiha's words)

