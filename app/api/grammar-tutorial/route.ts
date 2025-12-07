import { NextRequest, NextResponse } from "next/server";

// Initialize Mistral client dynamically to avoid issues with serverless functions
async function getMistralClient() {
  const { Mistral } = await import("@mistralai/mistralai");
  return new Mistral({
    apiKey: process.env.MISTRAL_API_KEY || "",
  });
}

export async function POST(request: NextRequest) {
  try {
    const { grammar_info, arabic_word } = await request.json();

    if (!grammar_info || !arabic_word) {
      return NextResponse.json(
        { error: "grammar_info and arabic_word are required" },
        { status: 400 }
      );
    }

    if (!process.env.MISTRAL_API_KEY) {
      return NextResponse.json(
        { error: "MISTRAL_API_KEY is not configured" },
        { status: 500 }
      );
    }

    // Build a focused prompt for the grammar explanation
    const grammarSummary = [
      grammar_info.part_of_speech && `Part of speech: ${grammar_info.part_of_speech}`,
      grammar_info.case && `Case: ${grammar_info.case}`,
      grammar_info.definiteness && `Definiteness: ${grammar_info.definiteness}`,
      grammar_info.number && `Number: ${grammar_info.number}`,
      grammar_info.gender && `Gender: ${grammar_info.gender}`,
      grammar_info.tense && `Tense: ${grammar_info.tense}`,
      grammar_info.person && `Person: ${grammar_info.person}`,
      grammar_info.mood && `Mood: ${grammar_info.mood}`,
      grammar_info.form && `Verb form: ${grammar_info.form}`,
      grammar_info.notes && `Notes: ${grammar_info.notes}`,
    ]
      .filter(Boolean)
      .join(", ");

    const prompt = `Explain this Arabic grammar concept to a beginner learning Quranic Arabic. 

Grammar details: ${grammarSummary}
Example word: ${arabic_word}

Provide a concise, beginner-friendly explanation (under 3 paragraphs) that:
1. Explains what this grammar concept means in simple terms
2. Shows how it applies to the example word "${arabic_word}"
3. Gives a practical tip for recognizing or using this grammar point

IMPORTANT: Start directly with the explanation. Do NOT include any introductory phrases like "Certainly!", "Here's a simple breakdown:", "Let me explain:", etc. Begin immediately with the explanation of the grammar concept.

Make it practical and easy to understand for someone just starting to learn Quranic Arabic grammar.`;

    const mistral = await getMistralClient();
    const response = await mistral.chat.complete({
      model: "mistral-small-latest",
      messages: [
        {
          role: "user",
          content: prompt,
        },
      ],
      maxTokens: 500,
      temperature: 0.7,
    });

    let explanation = response.choices[0]?.message?.content || "Unable to generate explanation.";
    
    // Remove common introductory phrases
    explanation = explanation
      .replace(/^(Certainly!|Here's|Let me|I'll|I can|I'd like to|Allow me to)[^:]*:\s*/i, '')
      .replace(/^(Here's a simple breakdown|Let me explain|I'll explain|I can explain)[^:]*:\s*/i, '')
      .trim();

    return NextResponse.json({ explanation });
  } catch (error: any) {
    console.error("Error generating grammar tutorial:", error);
    return NextResponse.json(
      { error: error.message || "Failed to generate grammar explanation" },
      { status: 500 }
    );
  }
}

