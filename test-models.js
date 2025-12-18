import { GoogleGenerativeAI } from '@google/generative-ai';
import dotenv from 'dotenv';

// Load environment variables
dotenv.config({ path: '.env.local' });

const genAI = new GoogleGenerativeAI(process.env.GOOGLE_GEMINI_API_KEY);

const modelsToTry = [
  'models/gemini-1.5-flash-latest',
  'gemini-1.5-flash-latest', 
  'gemini-1.5-flash',
  'models/gemini-1.5-flash',
  'gemini-2.0-flash-exp',
];

async function testModels() {
  console.log('Testing Gemini models with your API key...\n');
  
  for (const modelName of modelsToTry) {
    try {
      console.log(`Trying model: ${modelName}`);
      const model = genAI.getGenerativeModel({ model: modelName });
      const result = await model.generateContent('Say "test successful" in Arabic');
      const response = result.response;
      console.log(`✅ SUCCESS with ${modelName}`);
      console.log(`Response: ${response.text()}\n`);
      break; // Stop after first success
    } catch (error) {
      console.log(`❌ FAILED with ${modelName}: ${error.message}\n`);
    }
  }
}

testModels().catch(console.error);

