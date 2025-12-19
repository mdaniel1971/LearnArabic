import { createClient } from '@/utils/supabase/server';
import { NextRequest, NextResponse } from 'next/server';
import { generateQuizFromDatabase } from '@/utils/quiz-generation-on-the-fly';

export async function POST(request: NextRequest) {
  try {
    const { surahId } = await request.json();

    const supabase = await createClient();

    // Verify user is authenticated
    const { data: { user }, error: userError } = await supabase.auth.getUser();
    if (userError || !user) {
      return NextResponse.json({
        error: 'Authentication required to generate quiz'
      }, { status: 401 });
    }

    // Generate quiz from database (no API calls needed)
    const result = await generateQuizFromDatabase(supabase, surahId);

    if (!result.success) {
      return NextResponse.json({
        error: result.error || 'Failed to generate quiz'
      }, { status: 500 });
    }

    return NextResponse.json({
      success: true,
      questions: result.questions || []
    });

  } catch (error: any) {
    console.error('Error generating quiz:', error);
    return NextResponse.json({
      error: error.message || 'Failed to generate quiz'
    }, { status: 500 });
  }
}

