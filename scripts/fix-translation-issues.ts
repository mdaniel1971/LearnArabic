/**
 * Fix script for translation issues identified by diagnose-translation-issues.ts
 * 
 * Usage: npx tsx scripts/fix-translation-issues.ts [csv-file-path] [--dry-run]
 * 
 * If no CSV path is provided, it will look for the most recent report in reports/
 * 
 * This script:
 * 1. Reads the CSV report from Part 1
 * 2. Categorizes fixes (AUTO-FIX, MANUAL REVIEW, EXCLUDE)
 * 3. Shows manual review items one-by-one
 * 4. Generates SQL update statements
 * 5. Asks for final confirmation before executing
 */

// @ts-nocheck
import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
import { resolve } from 'path';
import * as fs from 'fs';
import * as path from 'path';
import * as readline from 'readline';

// Load environment variables
dotenv.config({ path: resolve(process.cwd(), '.env.local') });
dotenv.config({ path: resolve(process.cwd(), '.env') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SERVICE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
  console.error('❌ Missing required environment variables:');
  console.error('   NEXT_PUBLIC_SUPABASE_URL:', supabaseUrl ? '✓' : '✗');
  console.error('   SUPABASE_SERVICE_ROLE_KEY or SUPABASE_SERVICE_KEY:', supabaseServiceKey ? '✓' : '✗');
  console.error('\nPlease set these in your .env.local file');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseServiceKey);

interface TranslationIssue {
  word_id: number;
  surah_name: string;
  verse_number: number;
  word_position: number;
  text_arabic: string;
  current_translation: string;
  previous_word_arabic: string | null;
  previous_word_translation: string | null;
  previous_word_id: number | null;
  next_word_arabic: string | null;
  next_word_translation: string | null;
  suggested_fix: string;
  confidence: 'HIGH' | 'MEDIUM' | 'LOW';
  reason: string;
}

interface ApprovedFix {
  word_id: number;
  current_translation: string;
  new_translation: string;
  surah_name: string;
  verse_number: number;
  reason: string;
}

// AUTO-APPROVE list (specific word_ids that should be fixed automatically)
const AUTO_APPROVE_WORD_IDS = new Set([
  19,   // الصِّرَاطَ: "to the path" → "the path"
  2819, // "the rain clouds" → "rain clouds"
]);

// EXCLUDE patterns (translations that are correct and should not be changed)
const EXCLUDE_PATTERNS = [
  /^that day$/i,
  /^That day$/,
  /^that Day$/,
];

// Known correct prepositional phrases
const CORRECT_PREPOSITIONAL_PHRASES = [
  'in the name of',
  'in the name',
];

function shouldExclude(issue: TranslationIssue): boolean {
  // Exclude LOW confidence
  if (issue.confidence === 'LOW') {
    return true;
  }

  // Exclude "That Day" / "that Day" entries
  if (EXCLUDE_PATTERNS.some(pattern => pattern.test(issue.current_translation))) {
    return true;
  }

  // Exclude if previous word is a known preposition and translation makes sense
  if (issue.previous_word_arabic &&
    ['بِ', 'بِسۡمِ', 'فِي', 'مِن', 'إِلَى', 'لِ', 'عَلَى', 'عَنْ'].includes(issue.previous_word_arabic.trim())) {
    const lowerTranslation = issue.current_translation.toLowerCase();
    if (CORRECT_PREPOSITIONAL_PHRASES.some(phrase => lowerTranslation.includes(phrase))) {
      return true;
    }
  }

  return false;
}

function parseCSV(csvPath: string): TranslationIssue[] {
  const content = fs.readFileSync(csvPath, 'utf-8');
  const lines = content.split('\n').filter(line => line.trim());

  if (lines.length < 2) {
    throw new Error('CSV file is empty or has no data rows');
  }

  const headers = lines[0].split(',').map(h => h.trim().replace(/^"|"$/g, ''));
  const issues: TranslationIssue[] = [];

  for (let i = 1; i < lines.length; i++) {
    const line = lines[i];
    const values: string[] = [];
    let current = '';
    let inQuotes = false;

    // Parse CSV line handling quoted values
    for (let j = 0; j < line.length; j++) {
      const char = line[j];
      if (char === '"') {
        if (inQuotes && line[j + 1] === '"') {
          current += '"';
          j++; // Skip next quote
        } else {
          inQuotes = !inQuotes;
        }
      } else if (char === ',' && !inQuotes) {
        values.push(current);
        current = '';
      } else {
        current += char;
      }
    }
    values.push(current); // Add last value

    if (values.length !== headers.length) {
      console.warn(`Skipping malformed line ${i + 1}: expected ${headers.length} columns, got ${values.length}`);
      continue;
    }

    const row: any = {};
    headers.forEach((header, idx) => {
      row[header] = values[idx]?.replace(/^"|"$/g, '') || '';
    });

    issues.push({
      word_id: parseInt(row.word_id, 10),
      surah_name: row.surah_name || '',
      verse_number: parseInt(row.verse_number, 10),
      word_position: parseInt(row.word_position, 10),
      text_arabic: row.text_arabic || '',
      current_translation: row.current_translation || '',
      previous_word_arabic: row.previous_word_arabic || null,
      previous_word_translation: row.previous_word_translation || null,
      previous_word_id: row.previous_word_id ? parseInt(row.previous_word_id, 10) : null,
      next_word_arabic: row.next_word_arabic || null,
      next_word_translation: row.next_word_translation || null,
      suggested_fix: row.suggested_fix || '',
      confidence: row.confidence as 'HIGH' | 'MEDIUM' | 'LOW',
      reason: row.reason || ''
    });
  }

  return issues;
}

function findLatestReport(): string | null {
  const reportsDir = path.join(process.cwd(), 'reports');
  if (!fs.existsSync(reportsDir)) {
    return null;
  }

  const files = fs.readdirSync(reportsDir)
    .filter(f => f.startsWith('translation-issues-') && f.endsWith('.csv'))
    .map(f => ({
      name: f,
      path: path.join(reportsDir, f),
      mtime: fs.statSync(path.join(reportsDir, f)).mtime
    }))
    .sort((a, b) => b.mtime.getTime() - a.mtime.getTime());

  return files.length > 0 ? files[0].path : null;
}

function createReadlineInterface() {
  return readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });
}

function question(rl: readline.Interface, query: string): Promise<string> {
  return new Promise(resolve => {
    rl.question(query, resolve);
  });
}

async function reviewMediumConfidenceIssues(issues: TranslationIssue[]): Promise<ApprovedFix[]> {
  const mediumIssues = issues.filter(i => i.confidence === 'MEDIUM' && !shouldExclude(i));

  if (mediumIssues.length === 0) {
    console.log('✅ No MEDIUM confidence issues to review\n');
    return [];
  }

  console.log(`\n📋 Manual Review: ${mediumIssues.length} MEDIUM confidence issues\n`);
  console.log('Instructions:');
  console.log('  F = Fix (approve the suggested change)');
  console.log('  K = Keep (keep current translation)');
  console.log('  S = Skip (skip this item)');
  console.log('  A = Keep All (keep all remaining items, skip review)\n');

  const approved: ApprovedFix[] = [];
  const rl = createReadlineInterface();
  let keepAll = false;

  for (let i = 0; i < mediumIssues.length; i++) {
    const issue = mediumIssues[i];

    if (keepAll) {
      console.log(`\n⏭️  Keeping all remaining items (${mediumIssues.length - i} remaining)`);
      break;
    }

    console.log(`\n${'='.repeat(70)}`);
    console.log(`Item ${i + 1} of ${mediumIssues.length}`);
    console.log(`${'='.repeat(70)}`);
    console.log(`Word ID: ${issue.word_id}`);
    console.log(`Location: ${issue.surah_name}, Verse ${issue.verse_number}, Position ${issue.word_position}`);
    console.log(`Arabic: ${issue.text_arabic}`);
    console.log(`\nCurrent Translation: "${issue.current_translation}"`);
    console.log(`Suggested Fix: "${issue.suggested_fix}"`);

    if (issue.previous_word_arabic) {
      console.log(`\nPrevious Word: ${issue.previous_word_arabic} (${issue.previous_word_translation || 'N/A'})`);
    }
    if (issue.next_word_arabic) {
      console.log(`Next Word: ${issue.next_word_arabic} (${issue.next_word_translation || 'N/A'})`);
    }

    console.log(`\nReason: ${issue.reason}`);
    console.log(`${'='.repeat(70)}\n`);

    let answer = '';
    while (!['F', 'K', 'S', 'A', 'f', 'k', 's', 'a'].includes(answer)) {
      answer = await question(rl, 'Fix (F), Keep (K), Skip (S), or Keep All (A)? ');
    }

    if (answer.toLowerCase() === 'f') {
      approved.push({
        word_id: issue.word_id,
        current_translation: issue.current_translation,
        new_translation: issue.suggested_fix,
        surah_name: issue.surah_name,
        verse_number: issue.verse_number,
        reason: `Manual review approved: ${issue.reason}`
      });
      console.log('✅ Approved for fix\n');
    } else if (answer.toLowerCase() === 'k') {
      console.log('⏭️  Keeping current translation\n');
    } else if (answer.toLowerCase() === 'a') {
      keepAll = true;
      console.log('⏭️  Keeping all remaining items\n');
    } else {
      console.log('⏭️  Skipped\n');
    }
  }

  rl.close();
  return approved;
}

async function fixTranslationIssues(csvPath: string, dryRun: boolean) {
  console.log('🔧 Starting translation fix process...\n');
  console.log(`Mode: ${dryRun ? 'DRY RUN (no changes will be made)' : 'LIVE'}\n`);
  console.log(`Reading report: ${csvPath}\n`);

  try {
    // Parse CSV
    const allIssues = parseCSV(csvPath);
    console.log(`📊 Loaded ${allIssues.length} issues from CSV\n`);

    // Categorize issues
    const autoFix: ApprovedFix[] = [];
    const toReview: TranslationIssue[] = [];
    const excluded: TranslationIssue[] = [];

    for (const issue of allIssues) {
      if (shouldExclude(issue)) {
        excluded.push(issue);
        continue;
      }

      // AUTO-APPROVE specific word_ids
      if (AUTO_APPROVE_WORD_IDS.has(issue.word_id)) {
        autoFix.push({
          word_id: issue.word_id,
          current_translation: issue.current_translation,
          new_translation: issue.suggested_fix,
          surah_name: issue.surah_name,
          verse_number: issue.verse_number,
          reason: `Auto-approved: word_id in auto-approve list`
        });
        continue;
      }

      // HIGH confidence with valid suggested fix
      if (issue.confidence === 'HIGH' && issue.suggested_fix && issue.suggested_fix !== issue.current_translation) {
        autoFix.push({
          word_id: issue.word_id,
          current_translation: issue.current_translation,
          new_translation: issue.suggested_fix,
          surah_name: issue.surah_name,
          verse_number: issue.verse_number,
          reason: `Auto-approved: HIGH confidence - ${issue.reason}`
        });
        continue;
      }

      // MEDIUM confidence needs review
      if (issue.confidence === 'MEDIUM') {
        toReview.push(issue);
      }
    }

    console.log('📊 CATEGORIZATION:');
    console.log(`   AUTO-FIX: ${autoFix.length} issues`);
    console.log(`   MANUAL REVIEW: ${toReview.length} issues`);
    console.log(`   EXCLUDED: ${excluded.length} issues\n`);

    // Manual review for MEDIUM confidence
    const manualApproved = await reviewMediumConfidenceIssues(toReview);

    // Combine all approved fixes
    const allApproved = [...autoFix, ...manualApproved];

    if (allApproved.length === 0) {
      console.log('✅ No fixes to apply!\n');
      return;
    }

    console.log(`\n📋 SUMMARY OF APPROVED FIXES: ${allApproved.length} total\n`);

    // Show sample of fixes
    const sampleSize = Math.min(10, allApproved.length);
    console.log(`Sample of ${sampleSize} fixes:`);
    allApproved.slice(0, sampleSize).forEach((fix, idx) => {
      console.log(`\n${idx + 1}. Word ID ${fix.word_id} (${fix.surah_name}, Verse ${fix.verse_number})`);
      console.log(`   "${fix.current_translation}" → "${fix.new_translation}"`);
    });

    if (allApproved.length > sampleSize) {
      console.log(`\n... and ${allApproved.length - sampleSize} more`);
    }

    // Generate SQL file
    const timestamp = new Date().toISOString().replace(/[:.]/g, '-').slice(0, -5);
    const reportsDir = path.join(process.cwd(), 'reports');
    if (!fs.existsSync(reportsDir)) {
      fs.mkdirSync(reportsDir, { recursive: true });
    }

    const sqlPath = path.join(reportsDir, `approved-fixes-${timestamp}.sql`);
    const sqlStatements: string[] = [];

    sqlStatements.push('-- Translation Fixes');
    sqlStatements.push(`-- Generated: ${new Date().toISOString()}`);
    sqlStatements.push(`-- Total fixes: ${allApproved.length}`);
    sqlStatements.push('');
    sqlStatements.push('BEGIN;');
    sqlStatements.push('');

    // Generate UPDATE statements
    for (const fix of allApproved) {
      const escapedTranslation = fix.new_translation.replace(/'/g, "''");
      sqlStatements.push(`-- Word ID ${fix.word_id}: ${fix.surah_name}, Verse ${fix.verse_number}`);
      sqlStatements.push(`-- "${fix.current_translation}" → "${fix.new_translation}"`);
      sqlStatements.push(`UPDATE words SET translation_english = '${escapedTranslation}' WHERE id = ${fix.word_id};`);
      sqlStatements.push('');
    }

    sqlStatements.push('COMMIT;');
    sqlStatements.push('');
    sqlStatements.push('-- ROLLBACK (if needed):');
    sqlStatements.push('-- BEGIN;');
    allApproved.forEach(fix => {
      const escapedTranslation = fix.current_translation.replace(/'/g, "''");
      sqlStatements.push(`-- UPDATE words SET translation_english = '${escapedTranslation}' WHERE id = ${fix.word_id};`);
    });
    sqlStatements.push('-- COMMIT;');

    fs.writeFileSync(sqlPath, sqlStatements.join('\n'), 'utf-8');
    console.log(`\n📄 SQL file saved to: ${sqlPath}\n`);

    // Final confirmation
    if (dryRun) {
      console.log('🔍 DRY RUN MODE: No changes will be made to the database');
      console.log(`   Would update ${allApproved.length} words`);
      console.log(`   SQL file generated for review\n`);
      return;
    }

    const rl = createReadlineInterface();
    const answer = await question(rl, `\n⚠️  Ready to update ${allApproved.length} words in the database. Proceed? (Y/n): `);
    rl.close();

    if (answer.toLowerCase() !== 'y' && answer.toLowerCase() !== 'yes' && answer !== '') {
      console.log('\n❌ Update cancelled by user\n');
      return;
    }

    // Execute updates
    console.log('\n🔄 Applying fixes...\n');
    let successCount = 0;
    let errorCount = 0;
    const errors: Array<{ word_id: number; error: string }> = [];

    for (const fix of allApproved) {
      try {
        const { error } = await supabase
          .from('words')
          .update({ translation_english: fix.new_translation })
          .eq('id', fix.word_id);

        if (error) {
          errorCount++;
          errors.push({ word_id: fix.word_id, error: error.message });
          console.error(`❌ Failed to update word ${fix.word_id}: ${error.message}`);
        } else {
          successCount++;
          if (successCount % 10 === 0) {
            console.log(`   Updated ${successCount}/${allApproved.length}...`);
          }
        }
      } catch (err: any) {
        errorCount++;
        errors.push({ word_id: fix.word_id, error: err.message });
        console.error(`❌ Error updating word ${fix.word_id}: ${err.message}`);
      }
    }

    console.log(`\n✅ Update complete!`);
    console.log(`   Success: ${successCount}`);
    console.log(`   Errors: ${errorCount}`);

    if (errors.length > 0) {
      console.log('\n❌ Errors encountered:');
      errors.forEach(e => {
        console.log(`   Word ${e.word_id}: ${e.error}`);
      });
    }

    // Save fix log
    const logPath = path.join(reportsDir, `translation-fixes-${timestamp}.json`);
    const logData = {
      timestamp: new Date().toISOString(),
      total_approved: allApproved.length,
      success_count: successCount,
      error_count: errorCount,
      fixes: allApproved,
      errors: errors
    };
    fs.writeFileSync(logPath, JSON.stringify(logData, null, 2), 'utf-8');
    console.log(`\n📄 Fix log saved to: ${logPath}\n`);

  } catch (error: any) {
    console.error('❌ Error during fix process:', error.message);
    console.error(error);
    process.exit(1);
  }
}

// Main execution
const args = process.argv.slice(2);
const dryRun = args.includes('--dry-run');
const csvPathArg = args.find(arg => !arg.startsWith('--'));

let csvPath = csvPathArg;

if (!csvPath) {
  const latestReport = findLatestReport();
  if (!latestReport) {
    console.error('❌ No CSV report found. Please:');
    console.error('   1. Run: npm run diagnose:translations');
    console.error('   2. Or provide CSV path as argument: npx tsx scripts/fix-translation-issues.ts [path-to-csv]');
    process.exit(1);
  }
  csvPath = latestReport;
  console.log(`📄 Using latest report: ${csvPath}\n`);
}

fixTranslationIssues(csvPath, dryRun);

