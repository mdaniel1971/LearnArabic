/**
 * Add type field to Particle grammar_info
 * 
 * This script generates SQL UPDATE statements to add the `type` field
 * to particles in the grammar_info JSONB column, so they display as
 * "Particle: preposition" instead of just "Particle".
 */

import { writeFileSync, mkdirSync } from 'fs';
import { join } from 'path';

// Map of Arabic text patterns to particle types
const PARTICLE_TYPE_MAP: Array<{
  pattern: RegExp;
  type: string;
  description: string;
}> = [
  // Prepositions
  { pattern: /^م[ِنّ]|^مِن|^مِّن/, type: 'preposition', description: 'min (from)' },
  { pattern: /^فِي|^فِيهَا|^فِيهِ|^فِيهُن/, type: 'preposition', description: 'fi (in)' },
  { pattern: /^بِ|^بِهِ|^بِهَا|^بِهِم/, type: 'preposition', description: 'bi (with/by)' },
  { pattern: /^لِ|^لَهُ|^لَهَا|^لَهُم/, type: 'preposition', description: 'li (to/for)' },
  { pattern: /^عَلَى|^عَلَيْهِ|^عَلَيْهَا/, type: 'preposition', description: 'ala (on)' },
  { pattern: /^إِلَى|^إِلَيْهِ|^إِلَيْهَا/, type: 'preposition', description: 'ila (to)' },
  { pattern: /^عَنْ|^عَنْهُ|^عَنْهَا/, type: 'preposition', description: 'an (from/about)' },
  { pattern: /^حَتَّى|^حَتَّىٰ/, type: 'preposition', description: 'hatta (until)' },
  { pattern: /^مَعَ|^مَعَهُ|^مَعَهَا/, type: 'preposition', description: 'ma\'a (with)' },
  { pattern: /^مِن دُونِ|^مِن دُون/, type: 'preposition', description: 'min dun (without)' },
  
  // Negative particles
  { pattern: /^لَا|^لَا/, type: 'negative', description: 'la (no/not)' },
  { pattern: /^لَمْ|^لَم/, type: 'negative', description: 'lam (did not)' },
  { pattern: /^لَنْ|^لَن/, type: 'negative', description: 'lan (will not)' },
  { pattern: /^مَا/, type: 'negative', description: 'ma (not)' },
  
  // Interrogative particles
  { pattern: /^أَ|^أ/, type: 'interrogative', description: 'a (question particle)' },
  { pattern: /^هَل/, type: 'interrogative', description: 'hal (is it?)' },
  
  // Conditional particles
  { pattern: /^إِن|^إِنَّ/, type: 'conditional', description: 'in (if)' },
  { pattern: /^إِذَا/, type: 'conditional', description: 'idha (when/if)' },
  
  // Emphatic particles
  { pattern: /^إِنَّ/, type: 'emphatic', description: 'inna (indeed)' },
  { pattern: /^أَنَّ/, type: 'emphatic', description: 'anna (that)' },
  
  // Future particles
  { pattern: /^سَ|^س/, type: 'future', description: 'sa (will)' },
  { pattern: /^سَوْفَ/, type: 'future', description: 'sawfa (will)' },
];

/**
 * Determine particle type from Arabic text
 */
function getParticleType(arabicText: string): string | null {
  const arabic = arabicText.trim();
  
  for (const { pattern, type } of PARTICLE_TYPE_MAP) {
    if (pattern.test(arabic)) {
      return type;
    }
  }
  
  return null;
}

/**
 * Generate SQL UPDATE statements to add type field to particles
 */
function generateSQL(): string {
  let sql = `-- Add type field to Particle grammar_info
-- This adds the 'type' field (e.g., 'preposition', 'negative') to particles
-- so they display as "Particle: preposition" instead of just "Particle"
-- 
-- Generated: ${new Date().toISOString()}
-- 
-- IMPORTANT: This only updates surahs 97-114. Surah 1 (Al-Fatiha) is NOT modified.

`;

  // Generate UPDATE statements for each particle type pattern
  // We'll use a CASE statement to match Arabic text patterns
  sql += `-- Update particles with type based on Arabic text patterns
UPDATE words
SET grammar_info = jsonb_set(
  COALESCE(grammar_info, '{}'::jsonb),
  '{type}',
  CASE
`;

  // Add CASE conditions for each particle type
  for (const { pattern, type, description } of PARTICLE_TYPE_MAP) {
    // Convert regex pattern to SQL LIKE pattern (simplified)
    // For exact matches, use the pattern directly
    const patternStr = pattern.source.replace(/^\^|\$$/g, '').replace(/\\/g, '');
    
    sql += `    -- ${description}
    WHEN text_arabic ~ '${pattern.source.replace(/'/g, "''")}' THEN '"${type}"'::jsonb
`;
  }

  sql += `    ELSE grammar_info->'type'
  END
)
FROM verses v
JOIN surahs s ON v.surah_id = s.id
WHERE words.verse_id = v.id 
  AND s.surah_number BETWEEN 97 AND 114
  AND grammar_info->>'part_of_speech' = 'Particle'
  AND (grammar_info->'type' IS NULL OR grammar_info->>'type' = 'null');

`;

  // Also add a comment showing what was updated
  sql += `-- Verification: Check how many particles now have types
SELECT 
  grammar_info->>'type' as particle_type,
  COUNT(*) as count
FROM words
WHERE verse_id IN (
  SELECT id FROM verses 
  WHERE surah_id IN (
    SELECT id FROM surahs 
    WHERE surah_number BETWEEN 97 AND 114
  )
)
AND grammar_info->>'part_of_speech' = 'Particle'
GROUP BY particle_type
ORDER BY count DESC;

`;

  return sql;
}

/**
 * Main function
 */
function main() {
  console.log('🔧 Generating SQL to add type field to particles...');
  
  const sql = generateSQL();
  
  // Create directory if it doesn't exist
  const migrationsDir = join(process.cwd(), 'supabase', 'migrations');
  mkdirSync(migrationsDir, { recursive: true });
  
  // Generate filename with current date
  const date = new Date().toISOString().split('T')[0].replace(/-/g, '');
  const filename = `${date}000001_add_particle_types.sql`;
  const filepath = join(migrationsDir, filename);
  
  writeFileSync(filepath, sql, 'utf-8');
  console.log(`✅ SQL file generated: ${filepath}`);
  console.log(`   This will add 'type' field to particles in surahs 97-114`);
  console.log(`   Run this SQL in Supabase to update particle types`);
}

// Run the script
main();

