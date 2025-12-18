/**
 * Generate JSON content using Groq API
 * Includes robust JSON parsing to handle various response formats
 */

import Groq from 'groq-sdk';

function parseGroqJSON(text: string): any {
  // Strategy 1: Direct parse after cleaning
  let cleaned = text.trim();
  
  // Remove markdown code blocks if present
  cleaned = cleaned.replace(/```json\s*/g, '').replace(/```\s*/g, '');
  
  // Try to extract JSON array if there's text before/after
  const jsonMatch = cleaned.match(/\[[\s\S]*\]/);
  if (jsonMatch) {
    cleaned = jsonMatch[0];
  }

  const strategies = [
    // Strategy 1: Direct parse
    () => {
      try {
        return JSON.parse(cleaned);
      } catch (e) {
        throw new Error(`Direct parse: ${e instanceof Error ? e.message : String(e)}`);
      }
    },
    // Strategy 2: Fix trailing commas
    () => {
      try {
        let fixed = cleaned.replace(/,(\s*[}\]])/g, '$1');
        return JSON.parse(fixed);
      } catch (e) {
        throw new Error(`After fixing trailing commas: ${e instanceof Error ? e.message : String(e)}`);
      }
    },
    // Strategy 3: Fix smart quotes
    () => {
      try {
        let fixed = cleaned
          .replace(/[""]/g, '"')
          .replace(/['']/g, "'");
        return JSON.parse(fixed);
      } catch (e) {
        throw new Error(`After fixing smart quotes: ${e instanceof Error ? e.message : String(e)}`);
      }
    },
    // Strategy 4: Fix unescaped quotes in strings
    () => {
      try {
        // This is a simplified fix - may not handle all cases
        let fixed = cleaned.replace(/([^\\])"/g, '$1\\"');
        return JSON.parse(fixed);
      } catch (e) {
        throw new Error(`After fixing unescaped quotes: ${e instanceof Error ? e.message : String(e)}`);
      }
    },
    // Strategy 5: Aggressive cleanup
    () => {
      try {
        let fixed = cleaned
          .replace(/\/\/.*$/gm, '') // Remove comments
          .replace(/,\s*,/g, ',') // Remove multiple commas
          .replace(/,(\s*[}\]])/g, '$1'); // Remove trailing commas
        return JSON.parse(fixed);
      } catch (e) {
        throw new Error(`After aggressive cleanup: ${e instanceof Error ? e.message : String(e)}`);
      }
    },
    // Strategy 6: More aggressive fixes
    () => {
      try {
        let fixed = cleaned
          .replace(/[\x00-\x1F\x7F]/g, '') // Remove control characters
          .replace(/,(\s*[}\]])/g, '$1') // Remove trailing commas
          .replace(/([{,]\s*)(\w+):/g, '$1"$2":') // Quote unquoted keys
          .replace(/'/g, '"'); // Replace single quotes with double quotes
        return JSON.parse(fixed);
      } catch (e) {
        throw new Error(`After more aggressive fixes: ${e instanceof Error ? e.message : String(e)}`);
      }
    }
  ];

  const errors: string[] = [];
  for (const strategy of strategies) {
    try {
      return strategy();
    } catch (error: any) {
      errors.push(error.message);
    }
  }

  console.error('Failed to parse JSON after all strategies');
  console.error('Original text length:', text.length);
  console.error('Cleaned text length:', cleaned.length);
  console.error('All parse errors:', errors);
  throw new Error(`Failed to parse JSON response from Groq. Parse errors: ${errors.join('; ')}`);
}

/**
 * Generate JSON content using Groq API
 */
export async function generateJSONWithGroq(prompt: string, options: {
  temperature?: number;
  maxTokens?: number;
} = {}) {
  const apiKey = process.env.GROQ_API_KEY;

  if (!apiKey) {
    throw new Error('GROQ_API_KEY is not set');
  }

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
    const groq = new Groq({
      apiKey: apiKey,
    });

    const completion = await groq.chat.completions.create({
      messages: [
        {
          role: 'user',
          content: jsonPrompt
        }
      ],
      model: 'llama-3.3-70b-versatile',
      temperature: options.temperature ?? 0.3,
      max_tokens: options.maxTokens ?? 4000,
    });

    if (!completion.choices || !completion.choices[0] || !completion.choices[0].message || !completion.choices[0].message.content) {
      console.error('Unexpected API response structure:', JSON.stringify(completion, null, 2));
      throw new Error('Invalid response structure from Groq API');
    }

    const text = completion.choices[0].message.content;
    return parseGroqJSON(text);
  } catch (error: any) {
    console.error('Groq JSON API Error:', error);
    throw new Error(`Groq JSON generation failed: ${error.message}`);
  }
}

/**
 * Generate text content using Groq API
 */
export async function generateWithGroq(prompt: string, options: {
  temperature?: number;
  maxTokens?: number;
} = {}) {
  const apiKey = process.env.GROQ_API_KEY;

  if (!apiKey) {
    throw new Error('GROQ_API_KEY is not set');
  }

  try {
    const groq = new Groq({
      apiKey: apiKey,
    });

    const completion = await groq.chat.completions.create({
      messages: [
        {
          role: 'user',
          content: prompt
        }
      ],
      model: 'llama-3.3-70b-versatile',
      temperature: options.temperature ?? 0.7,
      max_tokens: options.maxTokens ?? 2000,
    });

    if (!completion.choices || !completion.choices[0] || !completion.choices[0].message || !completion.choices[0].message.content) {
      throw new Error('Invalid response structure from Groq API');
    }

    return completion.choices[0].message.content;
  } catch (error: any) {
    console.error('Groq API Error:', error);
    throw new Error(`Groq generation failed: ${error.message}`);
  }
}

