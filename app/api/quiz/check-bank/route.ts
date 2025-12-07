import { createClient } from '@/utils/supabase/server';
import { NextRequest, NextResponse } from 'next/server';

export async function POST(request: NextRequest) {
  try {
    const { surahId } = await request.json();
    const supabase = await createClient();

    // Check if quiz questions exist for this surah
    const { data, error } = await supabase
      .from('quiz_bank')
      .select('id')
      .eq('surah_id', surahId)
      .limit(1);

    if (error) throw error;

    return NextResponse.json({ 
      exists: data && data.length > 0,
      needsGeneration: !data || data.length === 0
    });
  } catch (error: any) {
    console.error('Error checking quiz bank:', error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}

