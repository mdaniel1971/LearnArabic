import dotenv from 'dotenv';

// Load environment variables
dotenv.config({ path: '.env.local' });

const API_KEY = process.env.GOOGLE_GEMINI_API_KEY;

async function testDirectAPI() {
  if (!API_KEY) {
    console.error('❌ GOOGLE_GEMINI_API_KEY is not set in .env.local');
    return;
  }

  try {
    console.log('Testing direct Gemini API v1 endpoint...\n');
    
    const response = await fetch(
      `https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash:generateContent?key=${API_KEY}`,
      {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          contents: [{
            parts: [{ text: 'Say hello in Arabic' }]
          }]
        })
      }
    );

    if (!response.ok) {
      const errorData = await response.json();
      console.error('❌ API Error:', JSON.stringify(errorData, null, 2));
      return;
    }

    const data = await response.json();
    console.log('✅ Success!');
    console.log('Response:', data.candidates[0].content.parts[0].text);
  } catch (error) {
    console.error('❌ Error:', error.message);
  }
}

testDirectAPI();

