/**
 * Test the pronoun classification fix
 */

import { determineMainPOS } from '../docs/corpus-files/parse-morphology';

// Test case: هُمْ in 78:3:2:1
// Corpus data: 78:3:2:1	هُمْ	N	PRON|3MP
const testSegments = [
  { arabic: 'هُمْ', pos: 'N', features: 'PRON|3MP' }
];

console.log('Testing pronoun classification fix...');
console.log('Input segments:', testSegments);
console.log();

const result = determineMainPOS(testSegments);
console.log('Result:', JSON.stringify(result, null, 2));
console.log();

if (result?.part_of_speech === 'Pronoun') {
  console.log('✅ SUCCESS: Correctly classified as Pronoun');
  console.log(`   Person: ${result.person || 'N/A'}`);
  console.log(`   Number: ${result.number || 'N/A'}`);
  console.log(`   Gender: ${result.gender || 'N/A'}`);
} else {
  console.log('❌ FAILED: Still classified as', result?.part_of_speech);
}

