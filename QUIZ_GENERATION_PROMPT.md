# Quiz Generation Prompt

This is the complete prompt sent to Mistral AI for generating quiz questions.

## Prompt Structure

The prompt is dynamically constructed with:
- Surah name (English and Arabic)
- All words with their IDs, Arabic text, transliteration, translation, and grammar info
- All verses with Arabic text and English translation
- Detailed instructions for question generation

## Complete Prompt Template

```
You are creating a 10-question quiz for Surah [SURAH_NAME_ENGLISH] ([SURAH_NAME_ARABIC]) to test Quranic Arabic comprehension.

Available words and their data (use the word_id number for word meaning questions):
[LIST OF ALL WORDS WITH: word_id, Arabic text, transliteration, translation, grammar_info]

Verse context (Arabic text with English translation):
[LIST OF ALL VERSES WITH: verse_number, Arabic text, English translation]

CRITICAL: SINGLE VERSE PRECISION RULE
When asking about a specific verse, the correct answer MUST come ONLY from that verse's content, NOT from adjacent verses or broader context.

WORKFLOW FOR EACH QUESTION:
1. VERSE ANALYSIS: For the verse you're asking about:
   - What does THIS verse specifically say? (Not its neighbors, not implications - just this verse)
   - What is the verse's role? (Stating a problem? Providing a solution? Giving a command? Describing a consequence?)
   - How does it differ from adjacent verses?

2. QUESTION GENERATION:
   - Explicitly reference the verse number in the question (e.g., "In verse 16, what...")
   - The correct answer must be derivable SOLELY from the verse being asked about
   - Use adjacent verses' messages as distractors when appropriate
   - Ensure the question cannot be correctly answered using only information from other verses

3. EXPLANATION GENERATION:
   - State what THIS specific verse says
   - If mentioning context, clearly separate "what this verse says" from "how it relates to neighbors"
   - Example: "Verse 16 specifically criticizes humans for preferring worldly life. The next verse (17) then contrasts this by stating the Hereafter is better, but verse 16 itself focuses on identifying the problematic human tendency."

EXAMPLE OF CORRECT vs INCORRECT:

INCORRECT (conflating verses):
Verse 16: "Rather, you prefer the worldly life"
Question: "What is the main message of Verse 16?"
Correct Answer: "The Hereafter is better than worldly life" ❌ (This is verse 17's message!)

CORRECT (verse-specific):
Verse 16: "Rather, you prefer the worldly life"
Question: "What human tendency is criticized in Verse 16?"
Options:
A) Neglecting prayer
B) Prioritizing temporary worldly pleasures ✓ (from verse 16)
C) Believing the Hereafter is better (from verse 17 - good distractor)
D) Following misguided leaders
Correct Answer: B) Prioritizing temporary worldly pleasures
Explanation: "Verse 16 specifically criticizes humans for preferring worldly life. The next verse (17) then contrasts this by stating the Hereafter is better, but verse 16 itself focuses on identifying the problematic human tendency."

QUALITY CHECK BEFORE GENERATING:
- [ ] The correct answer can be derived SOLELY from the verse being asked about
- [ ] The correct answer does NOT require knowledge of adjacent verses
- [ ] Adjacent verses' messages appear as distractors (if appropriate)
- [ ] The question explicitly references the verse number
- [ ] The explanation clarifies why the correct answer matches THIS specific verse

Create EXACTLY 10 questions with this distribution:
- 4 word meaning questions (multiple choice) - test Arabic word → English meaning
- 3 grammar questions (multiple choice) - test understanding of word types, cases, grammatical roles
- 2 comprehension questions (multiple choice) - test understanding of a SPECIFIC verse's message (MUST follow single verse precision rule above)
- 1 phrase translation question (multiple choice) - test translation of 2-3 word phrases

FOR COMPREHENSION QUESTIONS:
- MUST explicitly reference the verse number (e.g., "In verse 16, what...")
- Correct answer MUST come ONLY from that specific verse
- Use adjacent verses' messages as distractors when appropriate
- Explanation must clarify what THIS verse says vs. how it relates to context

CRITICAL: GENITIVE CASE EXPLANATIONS - CHECK IDAFA FIRST:
When asking about why a word is in genitive case, you MUST check in this priority order:
1. **FIRST: Is it mudaf ilayhi (second term in idafa/possessive construction)?**
   - If the previous word is an indefinite noun (mudaf) and the target word is genitive, it's likely idafa
   - Example: In 'يَوۡمَ ٱلۡفَصۡلِ', ٱلۡفَصۡلِ is genitive because it's mudaf ilayhi in the idafa 'يَوۡمَ ٱلۡفَصۡلِ' (day of judgment)
   - DO NOT say it's genitive because of إِنَّ or other particles - those affect the mudaf, not the mudaf ilayhi
2. **SECOND: Does it follow a preposition?**
   - Prepositions like فِي، مِن، إِلَى، بِ، etc. make the following word genitive
   - Example: In 'فِي ٱلسَّمَاءِ', ٱلسَّمَاءِ is genitive because it follows فِي
3. **THIRD: Other grammatical reasons**

When explaining genitive case in quiz explanations:
- If idafa: "This word is genitive (majrur) because it is the mudaf ilayhi (second term) in the possessive construction '[mudaf] [mudaf ilayhi]'"
- If preposition: "This word is genitive (majrur) because it follows the preposition '[preposition]'"

CRITICAL: For grammar questions, you MUST use this NEW LEARNER-FRIENDLY FORMAT:

NEW FORMAT (MUST USE - ENGLISH TRANSLATION IS REQUIRED):
✅ "In the phrase 'وَإِذَا ٱلۡكَوَٰكِبُ ٱنتَثَرَتۡ' (when the stars fall scattered), the word ٱلۡكَوَاكِبُ is:"
   Options: Singular, Dual, Plural

✅ "In the phrase 'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ' (In the name of Allah, the Most Gracious, the Most Merciful), the word ٱلرَّحِیمِ is:"
   Options: Singular, Dual, Plural

MANDATORY: Every grammar question MUST include the English translation in parentheses after the Arabic phrase.

REQUIREMENTS FOR GRAMMAR QUESTIONS:
1. ALWAYS start with "In the phrase '[Arabic text]' ([English translation]), the word [target word] is:"
2. Include the full verse phrase (2-5 words) where the target word appears
3. Include the English translation of that phrase in parentheses
4. Use PLAIN LANGUAGE for options - NO technical terms:
   - Instead of "Grammatical number" → ask "singular, dual, or plural"
   - Instead of "Grammatical case" → ask "nominative, genitive, or accusative" (or use plain descriptions)
   - Instead of "Definiteness" → ask "definite or indefinite"
   - Instead of "Gender" → ask "masculine or feminine"
   - Instead of "Tense" → ask "past tense, present tense, or imperative"
5. Options should be simple and accessible (e.g., "Singular", "Dual", "Plural" - NOT "Singular (مفرد)")
6. For case questions, you can use plain descriptions like:
   - "subject form (nominative)"
   - "object form (accusative)" 
   - "after preposition form (genitive)"
   - "second term in possessive construction (genitive)" - for mudaf ilayhi
7. NEVER mention word_id in the question text
8. Include the word_id as a NUMBER in the JSON (for database reference only)

CRITICAL FORMATTING REQUIREMENTS:
1. Return ONLY valid JSON, no markdown, no code blocks, no backticks
2. Each question must have EXACTLY 4 options
3. One option must exactly match correct_answer
4. For word meaning questions: 
   - ALWAYS write the question like this: "What does the word 'الرَّحْمَـٰنِ' mean?"
   - NEVER include transliteration in parentheses - just the Arabic word
   - NEVER mention word_id anywhere in the question text
   - Include the word_id as a NUMBER in the JSON (for database reference only, not in question text)
5. For grammar questions:
   - ALWAYS use the NEW FORMAT: "In the phrase '[Arabic phrase]' ([English translation]), the word [target word] is:"
   - Include the verse phrase (2-5 words) where the target word appears
   - MANDATORY: Include English translation of the phrase in parentheses - this is REQUIRED, not optional
   - Use the verse context provided above to get the correct English translation
   - Use PLAIN LANGUAGE options (e.g., "Singular", "Dual", "Plural" - NOT "Singular (مفرد)")
   - NEVER include transliteration in parentheses - just the Arabic word
   - NEVER mention word_id anywhere in the question text
   - NEVER omit the English translation - every grammar question must have "(English translation)" after the Arabic phrase
   - Specify the grammar_point being tested as a string
   - Include the word_id as a NUMBER in the JSON (for database reference only, not in question text)
6. word_id must be a number or null, never a string or Arabic text
7. Question text should be natural and educational - always show the Arabic word directly, NEVER mention word_id
8. NEVER include transliteration in question text - only show the Arabic word

CRITICAL: You MUST return ONLY a valid JSON array. Do NOT include any markdown code blocks (like ```json or ```), backticks, explanations, or text before or after the JSON. Your response must start with '[' and end with ']'. Return ONLY the array.

Return as a JSON array with this EXACT structure:
[
  {
    "type": "multiple_choice",
    "question": "What does the word 'الرَّحْمَـٰنِ' mean?",
    "options": ["The Most Merciful", "The King", "The Guide", "The Creator"],
    "correct_answer": "The Most Merciful",
    "word_id": 123,
    "grammar_point": null,
    "explanation": "الرَّحْمَـٰنِ (ar-raḥmāni) is one of the names of Allah meaning 'The Most Merciful', emphasizing His infinite mercy."
  },
  {
    "type": "multiple_choice",
    "question": "In the phrase 'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ' (In the name of Allah, the Most Gracious, the Most Merciful), the word ٱلرَّحِیمِ is:",
    "options": ["Singular", "Dual", "Plural", "Not applicable"],
    "correct_answer": "Singular",
    "word_id": 456,
    "grammar_point": "number",
    "explanation": "The word ٱلرَّحِیمِ is singular, referring to one entity (Allah)."
  },
  {
    "type": "multiple_choice",
    "question": "In verse 16, what human tendency is being criticized?",
    "options": ["Neglecting prayer", "Prioritizing temporary worldly pleasures", "Believing the Hereafter is better", "Following misguided leaders"],
    "correct_answer": "Prioritizing temporary worldly pleasures",
    "word_id": null,
    "grammar_point": null,
    "explanation": "Verse 16 specifically criticizes humans for preferring worldly life (ٱلۡحَيَوٰةَ ٱلدُّنۡيَا). The next verse (17) then contrasts this by stating the Hereafter is better, but verse 16 itself focuses on identifying the problematic human tendency."
  }
]

Make questions educational and varied. Include clear explanations. Remember: return ONLY the JSON array, nothing else.

IMPORTANT FOR EXPLANATIONS:
- When referring to Arabic diacritics (vowel marks) in explanations, use transliterated forms like "-i" (for kasra/kasrah), "-a" (for fatha), "-u" (for damma) instead of isolated Arabic diacritic characters.
- Do NOT use isolated diacritics like "(ِ)" or "(َ)" or "(ُ)" in explanations as they may not display correctly.
- Instead, write: "ends with a kasrah (pronounced '-i')" or "has a fatha (pronounced '-a')" or "ends with '-i' (kasrah)".
- Always use readable transliterations in parentheses when explaining diacritics.
- **TERMINOLOGY**: Always use "tense" terminology instead of "aspect" when discussing Arabic verbs in explanations. Use "perfect tense" or "past tense" instead of "perfect aspect", and "imperfect tense" or "present/future tense" instead of "imperfect aspect". This terminology is more accessible for English-speaking learners who aren't linguistics students.
```

## Key Features

1. **Single Verse Precision Rule**: Ensures questions about a specific verse only use content from that verse
2. **Idafa Detection**: Prioritizes idafa (mudaf-mudaf ilayhi) relationships when explaining genitive case
3. **Learner-Friendly Format**: Uses plain language instead of technical grammar terms
4. **Strict JSON Format**: Requires valid JSON array with no markdown or extra text
5. **Comprehensive Examples**: Shows correct vs incorrect question generation patterns

## Dynamic Data Included

- All words with their IDs, Arabic text, transliteration, translation, and grammar info
- All verses with Arabic text and English translation
- Surah name in both English and Arabic

