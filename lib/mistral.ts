/**
 * Generate JSON content using Mistral AI API
 * Includes robust JSON parsing to handle various response formats
 */

function parseMistralJSON(text: string): any {
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
    throw new Error(`Failed to parse JSON response from Mistral. Parse errors: ${errors.join('; ')}`);
}

/**
 * Generate JSON content using Mistral AI API
 * Uses free-tier models: open-mistral-7b (primary), open-mixtral-8x7b (fallback)
 */
export async function generateJSONWithMistral(prompt: string, options: {
    temperature?: number;
    maxTokens?: number;
} = {}) {
    const apiKey = process.env.MISTRAL_API_KEY;

    if (!apiKey) {
        throw new Error('MISTRAL_API_KEY is not set');
    }

    // Free-tier models (try in order)
    const models = ['open-mistral-7b', 'open-mixtral-8x7b'];

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

    // Try each model until one works
    let lastError: Error | null = null;

    for (const model of models) {
        try {
            const response = await fetch(
                'https://api.mistral.ai/v1/chat/completions',
                {
                    method: 'POST',
                    headers: {
                        'Authorization': `Bearer ${apiKey}`,
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        model: model,
                        messages: [
                            {
                                role: 'user',
                                content: jsonPrompt
                            }
                        ],
                        temperature: options.temperature ?? 0.3,
                        max_tokens: options.maxTokens ?? 4000
                    })
                }
            );

            if (!response.ok) {
                const errorData = await response.json().catch(() => ({ error: 'Unknown error' }));

                // If it's a capacity/rate limit error, try next model
                if (errorData.code === '3505' || errorData.type === 'service_tier_capacity_exceeded') {
                    console.warn(`Model ${model} capacity exceeded, trying next model...`);
                    lastError = new Error(`Mistral API error: ${JSON.stringify(errorData)}`);
                    continue; // Try next model
                }

                console.error('Mistral API Error Response:', errorData);
                throw new Error(`Mistral API error: ${JSON.stringify(errorData)}`);
            }

            const data = await response.json();

            if (!data.choices || !data.choices[0] || !data.choices[0].message || !data.choices[0].message.content) {
                console.error('Unexpected API response structure:', JSON.stringify(data, null, 2));
                throw new Error('Invalid response structure from Mistral API');
            }

            const text = data.choices[0].message.content;
            return parseMistralJSON(text);
        } catch (error: any) {
            // If it's not a capacity error, throw immediately
            if (error.message && !error.message.includes('3505') && !error.message.includes('service_tier_capacity_exceeded')) {
                console.error(`Mistral JSON API Error with ${model}:`, error);
                throw new Error(`Mistral JSON generation failed: ${error.message}`);
            }
            lastError = error;
        }
    }

    // If all models failed, throw the last error
    if (lastError) {
        console.error('All Mistral models failed:', lastError);
        throw new Error(`Mistral JSON generation failed after trying all models: ${lastError.message}`);
    }

    throw new Error('Mistral JSON generation failed: No models available');
}

/**
 * Generate text content using Mistral AI API
 * Uses free-tier models: open-mistral-7b (primary), open-mixtral-8x7b (fallback)
 */
export async function generateWithMistral(prompt: string, options: {
    temperature?: number;
    maxTokens?: number;
} = {}) {
    const apiKey = process.env.MISTRAL_API_KEY;

    if (!apiKey) {
        throw new Error('MISTRAL_API_KEY is not set');
    }

    // Free-tier models (try in order)
    const models = ['open-mistral-7b', 'open-mixtral-8x7b'];
    let lastError: Error | null = null;

    for (const model of models) {
        try {
            const response = await fetch(
                'https://api.mistral.ai/v1/chat/completions',
                {
                    method: 'POST',
                    headers: {
                        'Authorization': `Bearer ${apiKey}`,
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        model: model,
                        messages: [
                            {
                                role: 'user',
                                content: prompt
                            }
                        ],
                        temperature: options.temperature ?? 0.7,
                        max_tokens: options.maxTokens ?? 2000,
                    })
                }
            );

            if (!response.ok) {
                const errorData = await response.json().catch(() => ({ error: 'Unknown error' }));

                // If it's a capacity/rate limit error, try next model
                if (errorData.code === '3505' || errorData.type === 'service_tier_capacity_exceeded') {
                    console.warn(`Model ${model} capacity exceeded, trying next model...`);
                    lastError = new Error(`Mistral API error: ${JSON.stringify(errorData)}`);
                    continue; // Try next model
                }

                throw new Error(`Mistral API error: ${JSON.stringify(errorData)}`);
            }

            const data = await response.json();
            return data.choices[0].message.content;
        } catch (error: any) {
            // If it's not a capacity error, throw immediately
            if (error.message && !error.message.includes('3505') && !error.message.includes('service_tier_capacity_exceeded')) {
                console.error(`Mistral API Error with ${model}:`, error);
                throw new Error(`Mistral generation failed: ${error.message}`);
            }
            lastError = error;
        }
    }

    // If all models failed, throw the last error
    if (lastError) {
        console.error('All Mistral models failed:', lastError);
        throw new Error(`Mistral generation failed after trying all models: ${lastError.message}`);
    }

    throw new Error('Mistral generation failed: No models available');
}

