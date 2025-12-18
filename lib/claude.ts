/**
 * Generate JSON content using Claude API (Anthropic)
 * Claude is excellent at generating clean JSON, so parsing is simpler
 */

import Anthropic from '@anthropic-ai/sdk';

function parseClaudeJSON(text: string): any {
  // Claude is generally very good at JSON, but we'll still handle edge cases
  let cleaned = text.trim();
  
  // Remove markdown code blocks if present
  cleaned = cleaned.replace(/```json\s*/g, '').replace(/```\s*/g, '');
  
  // Try to extract JSON array if there's text before/after
  const jsonMatch = cleaned.match(/\[[\s\S]*\]/);
  if (jsonMatch) {
    cleaned = jsonMatch[0];
  }

  const strategies = [
    // Strategy 1: Direct parse (Claude usually returns clean JSON)
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
  throw new Error(`Failed to parse JSON response from Claude. Parse errors: ${errors.join('; ')}`);
}

/**
 * Generate JSON content using Claude API
 */
export async function generateJSONWithClaude(prompt: string, options: {
  temperature?: number;
  maxTokens?: number;
} = {}) {
  const apiKey = process.env.ANTHROPIC_API_KEY;

  if (!apiKey) {
    throw new Error('ANTHROPIC_API_KEY is not set');
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
    const anthropic = new Anthropic({
      apiKey: apiKey,
    });

    const message = await anthropic.messages.create({
      model: 'claude-3-5-haiku-20241022',
      max_tokens: options.maxTokens ?? 4000,
      temperature: options.temperature ?? 0.3,
      messages: [
        {
          role: 'user',
          content: jsonPrompt
        }
      ],
    });

    if (!message.content || !Array.isArray(message.content) || message.content.length === 0) {
      console.error('Unexpected API response structure:', JSON.stringify(message, null, 2));
      throw new Error('Invalid response structure from Claude API');
    }

    const textBlock = message.content[0];
    if (textBlock.type !== 'text') {
      console.error('Unexpected content type:', textBlock);
      throw new Error('Claude API returned non-text content');
    }

    const text = textBlock.text;
    return parseClaudeJSON(text);
  } catch (error: any) {
    console.error('Claude JSON API Error:', error);
    throw new Error(`Claude JSON generation failed: ${error.message}`);
  }
}

/**
 * Generate text content using Claude API
 */
export async function generateWithClaude(prompt: string, options: {
  temperature?: number;
  maxTokens?: number;
} = {}) {
  const apiKey = process.env.ANTHROPIC_API_KEY;

  if (!apiKey) {
    throw new Error('ANTHROPIC_API_KEY is not set');
  }

  try {
    const anthropic = new Anthropic({
      apiKey: apiKey,
    });

    const message = await anthropic.messages.create({
      model: 'claude-3-5-haiku-20241022',
      max_tokens: options.maxTokens ?? 2000,
      temperature: options.temperature ?? 0.7,
      messages: [
        {
          role: 'user',
          content: prompt
        }
      ],
    });

    if (!message.content || !Array.isArray(message.content) || message.content.length === 0) {
      throw new Error('Invalid response structure from Claude API');
    }

    const textBlock = message.content[0];
    if (textBlock.type !== 'text') {
      throw new Error('Claude API returned non-text content');
    }

    return textBlock.text;
  } catch (error: any) {
    console.error('Claude API Error:', error);
    throw new Error(`Claude generation failed: ${error.message}`);
  }
}

