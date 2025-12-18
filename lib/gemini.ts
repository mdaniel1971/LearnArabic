/**
 * Generate text content using Gemini via REST API
 */
export async function generateWithGemini(prompt: string, options: {
  temperature?: number;
  maxTokens?: number;
} = {}) {
  const apiKey = process.env.GOOGLE_GEMINI_API_KEY;

  if (!apiKey) {
    throw new Error('GOOGLE_GEMINI_API_KEY is not set');
  }

  try {
    const response = await fetch(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent',
      {
        method: 'POST',
        headers: {
          'x-goog-api-key': apiKey,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          contents: [{
            parts: [{
              text: prompt
            }]
          }],
          generationConfig: {
            temperature: options.temperature ?? 0.7,
            maxOutputTokens: options.maxTokens ?? 8000,
          }
        })
      }
    );

    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Gemini API error: ${JSON.stringify(errorData)}`);
    }

    const data = await response.json();
    return data.candidates[0].content.parts[0].text;
  } catch (error: any) {
    console.error('Gemini API Error:', error);
    throw new Error(`Gemini generation failed: ${error.message}`);
  }
}

/**
 * Parse JSON from Gemini with multiple fallback strategies
 */
function parseGeminiJSON(text: string): any {
  // Helper to extract JSON array from text
  const extractJSONArray = (input: string): string => {
    let cleaned = input.trim();

    // Remove markdown code blocks
    if (cleaned.includes('```json')) {
      const match = cleaned.match(/```json\s*([\s\S]*?)\s*```/);
      if (match) cleaned = match[1].trim();
    } else if (cleaned.includes('```')) {
      const match = cleaned.match(/```\s*([\s\S]*?)\s*```/);
      if (match) cleaned = match[1].trim();
    }

    // Extract JSON array boundaries
    const firstBracket = cleaned.indexOf('[');
    const lastBracket = cleaned.lastIndexOf(']');
    if (firstBracket !== -1 && lastBracket !== -1 && lastBracket > firstBracket) {
      cleaned = cleaned.substring(firstBracket, lastBracket + 1);
    }

    return cleaned;
  };

  // Helper to apply common fixes
  const applyCommonFixes = (input: string): string => {
    return input
      .replace(/,(\s*[}\]])/g, '$1') // Remove trailing commas
      .replace(/,(\s*\n\s*[}\]])/g, '$1') // Remove trailing commas with newlines
      .replace(/[\u201C\u201D]/g, '"') // Fix smart quotes
      .replace(/[\u2018\u2019]/g, "'") // Fix smart single quotes
      .replace(/\/\/.*$/gm, '') // Remove comments
      .replace(/\/\*[\s\S]*?\*\//g, '') // Remove block comments
      .replace(/,{2,}/g, ',') // Fix multiple commas
      .replace(/,\s*([}\]])/g, '$1') // Remove comma before closing brackets
      .replace(/[\x00-\x1F\x7F]/g, ''); // Remove control characters
  };

  // Strategy 1: Direct parse after basic cleaning
  try {
    const cleaned = extractJSONArray(text);
    return JSON.parse(cleaned);
  } catch (error: any) {
    // Continue to next strategy
  }

  // Strategy 2: Fix trailing commas
  try {
    let cleaned = extractJSONArray(text);
    cleaned = cleaned.replace(/,(\s*[}\]])/g, '$1');
    return JSON.parse(cleaned);
  } catch (error: any) {
    // Continue to next strategy
  }

  // Strategy 3: Fix quotes and trailing commas
  try {
    let cleaned = extractJSONArray(text);
    cleaned = applyCommonFixes(cleaned);
    return JSON.parse(cleaned);
  } catch (error: any) {
    // Continue to next strategy
  }

  // Strategy 4: Fix string escaping issues
  try {
    let cleaned = extractJSONArray(text);
    cleaned = applyCommonFixes(cleaned);
    // Fix unescaped single quotes in double-quoted strings
    cleaned = cleaned.replace(/"([^"]*)'([^"]*?)"/g, (match, before, after) => {
      return `"${before}\\'${after}"`;
    });
    return JSON.parse(cleaned);
  } catch (error: any) {
    // Continue to next strategy
  }

  // Strategy 5: Aggressive fixes
  try {
    let cleaned = extractJSONArray(text);
    cleaned = applyCommonFixes(cleaned);
    // Fix unclosed strings
    cleaned = cleaned.replace(/"([^"]*)$/gm, (match) => {
      return match.endsWith('"') ? match : match + '"';
    });
    // Fix string formatting
    cleaned = cleaned.replace(/([{,]\s*)"([^"]*)"\s*:/g, '$1"$2":');
    cleaned = cleaned.replace(/:\s*"([^"]*)"([,}])/g, ': "$1"$2');
    // Fix unescaped newlines in strings
    cleaned = cleaned.replace(/"([^"]*)\n([^"]*)"/g, '"$1\\n$2"');
    return JSON.parse(cleaned);
  } catch (error: any) {
    // Continue to next strategy
  }

  // Strategy 6: Try to extract valid JSON from matches
  const jsonMatches = text.match(/\[[\s\S]{50,}\]/g);
  if (jsonMatches && jsonMatches.length > 0) {
    for (const match of jsonMatches.slice(0, 3)) {
      try {
        let cleaned = applyCommonFixes(match);
        return JSON.parse(cleaned);
      } catch (e) {
        // Try next match
      }
    }
  }

  // All strategies failed - log error details
  console.error('Failed to parse JSON response from Gemini');
  console.error('Response length:', text.length);
  console.error('First 500 chars:', text.substring(0, 500));
  console.error('Last 500 chars:', text.substring(Math.max(0, text.length - 500)));

  throw new Error('Failed to parse JSON response from Gemini after trying all strategies');
}

/**
 * Generate JSON content using Gemini via REST API
 */
export async function generateJSONWithGemini(prompt: string, options: {
  temperature?: number;
  maxTokens?: number;
} = {}) {
  const apiKey = process.env.GOOGLE_GEMINI_API_KEY;

  if (!apiKey) {
    throw new Error('GOOGLE_GEMINI_API_KEY is not set');
  }

  // Enhance prompt with strict JSON instructions
  const jsonPrompt = `${prompt}

CRITICAL JSON FORMATTING RULES:
1. Return ONLY a valid JSON array - nothing else
2. Start with [ and end with ]
3. NO markdown, NO code blocks, NO backticks
4. NO trailing commas - the last item in an array or object must NOT have a comma
5. Use double quotes for ALL strings
6. Escape all special characters in strings (quotes, newlines, etc.)
7. Ensure every opening brace/bracket has a closing one
8. NO comments
9. Test your JSON mentally before returning it

Your response must be parseable by JSON.parse() immediately.`;

  try {
    const response = await fetch(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent',
      {
        method: 'POST',
        headers: {
          'x-goog-api-key': apiKey,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          contents: [{
            parts: [{
              text: jsonPrompt
            }]
          }],
          generationConfig: {
            temperature: options.temperature ?? 0.3,
            maxOutputTokens: options.maxTokens ?? 8000,
          }
        })
      }
    );

    if (!response.ok) {
      const errorData = await response.json();
      console.error('Gemini API Error Response:', errorData);
      throw new Error(`Gemini API error: ${JSON.stringify(errorData)}`);
    }

    const data = await response.json();

    if (!data.candidates || !data.candidates[0] || !data.candidates[0].content || !data.candidates[0].content.parts) {
      console.error('Unexpected API response structure:', JSON.stringify(data, null, 2));
      throw new Error('Invalid response structure from Gemini API');
    }

    const text = data.candidates[0].content.parts[0].text;
    return parseGeminiJSON(text);
  } catch (error: any) {
    console.error('Gemini JSON API Error:', error);
    throw new Error(`Gemini JSON generation failed: ${error.message}`);
  }
}
