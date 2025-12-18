/**
 * Generate text content using Gemini via REST API
 * Uses official Google API format with x-goog-api-key header
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
  console.log('Raw response length:', text.length);
  console.log('First 200 chars:', text.substring(0, 200));
  console.log('Last 200 chars:', text.substring(text.length - 200));

  // Strategy 1: Clean and parse directly
  try {
    let cleaned = text.trim();

    // Remove markdown code blocks
    if (cleaned.includes('```json')) {
      const match = cleaned.match(/```json\s*([\s\S]*?)\s*```/);
      if (match) cleaned = match[1].trim();
    } else if (cleaned.includes('```')) {
      const match = cleaned.match(/```\s*([\s\S]*?)\s*```/);
      if (match) cleaned = match[1].trim();
    }

    // Extract just the JSON array
    const firstBracket = cleaned.indexOf('[');
    const lastBracket = cleaned.lastIndexOf(']');
    if (firstBracket !== -1 && lastBracket !== -1) {
      cleaned = cleaned.substring(firstBracket, lastBracket + 1);
    }

    const parsed = JSON.parse(cleaned);
    console.log('✅ Strategy 1: Direct parse successful');
    return parsed;
  } catch (error: any) {
    console.log('❌ Strategy 1 failed:', error.message);
  }

  // Strategy 2: Fix trailing commas
  try {
    let cleaned = text.trim();
    const firstBracket = cleaned.indexOf('[');
    const lastBracket = cleaned.lastIndexOf(']');
    if (firstBracket !== -1 && lastBracket !== -1) {
      cleaned = cleaned.substring(firstBracket, lastBracket + 1);
    }

    // Remove trailing commas before } or ]
    cleaned = cleaned.replace(/,(\s*[}\]])/g, '$1');

    const parsed = JSON.parse(cleaned);
    console.log('✅ Strategy 2: Fixed trailing commas');
    return parsed;
  } catch (error: any) {
    console.log('❌ Strategy 2 failed:', error.message);
  }

  // Strategy 3: Fix common quote issues
  try {
    let cleaned = text.trim();
    const firstBracket = cleaned.indexOf('[');
    const lastBracket = cleaned.lastIndexOf(']');
    if (firstBracket !== -1 && lastBracket !== -1) {
      cleaned = cleaned.substring(firstBracket, lastBracket + 1);
    }

    // Remove trailing commas
    cleaned = cleaned.replace(/,(\s*[}\]])/g, '$1');

    // Fix smart quotes (sometimes Gemini uses these)
    cleaned = cleaned.replace(/[\u201C\u201D]/g, '"'); // " and "
    cleaned = cleaned.replace(/[\u2018\u2019]/g, "'"); // ' and '

    const parsed = JSON.parse(cleaned);
    console.log('✅ Strategy 3: Fixed quotes');
    return parsed;
  } catch (error: any) {
    console.log('❌ Strategy 3 failed:', error.message);

    // Log the error location
    const match = error.message.match(/position (\d+)/);
    if (match) {
      const position = parseInt(match[1]);
      const start = Math.max(0, position - 100);
      const end = Math.min(text.length, position + 100);
      console.error('Error near position', position);
      console.error('Context:', text.substring(start, end));
      console.error('Character at position:', text.charAt(position), '(code:', text.charCodeAt(position), ')');
    }
  }

  // Strategy 4: Try to manually fix the JSON at the error position
  try {
    let cleaned = text.trim();
    const firstBracket = cleaned.indexOf('[');
    const lastBracket = cleaned.lastIndexOf(']');
    if (firstBracket !== -1 && lastBracket !== -1) {
      cleaned = cleaned.substring(firstBracket, lastBracket + 1);
    }

    // Remove trailing commas
    cleaned = cleaned.replace(/,(\s*[}\]])/g, '$1');
    // Fix smart quotes
    cleaned = cleaned.replace(/[\u201C\u201D]/g, '"');
    cleaned = cleaned.replace(/[\u2018\u2019]/g, "'");

    // Try to find and fix the specific error
    // Common issues: unescaped quotes in strings, missing commas, extra commas

    // Fix unescaped single quotes in double-quoted strings
    cleaned = cleaned.replace(/"([^"]*)'([^"]*?)"/g, (match, before, after) => {
      // Only if the single quote is inside a string
      return `"${before}\\'${after}"`;
    });

    const parsed = JSON.parse(cleaned);
    console.log('✅ Strategy 4: Fixed string escaping');
    return parsed;
  } catch (error: any) {
    console.log('❌ Strategy 4 failed:', error.message);
  }

  // All strategies failed
  console.error('All parsing strategies failed');
  console.error('Full text:', text);
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

  // Enhance prompt with VERY strict JSON instructions
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
            temperature: options.temperature ?? 0.3, // Even lower for consistency
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

    // Check if response has candidates
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
