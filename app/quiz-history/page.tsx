'use client';

import { useState, useEffect } from 'react';
import { createClient } from '@/utils/supabase/client';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import GrammarTutorialModal from '@/components/GrammarTutorialModal';

interface QuizAttempt {
  id: string;
  surah_id: number;
  score: number;
  total_questions: number;
  completed_at: string;
  surah_name?: string;
}

interface QuizQuestion {
  id: string;
  question_text: string;
  correct_answer: string;
  user_answer: string | null;
  is_correct: boolean;
  word_id: number | null;
  grammar_point: string | null;
  options: string[] | null;
  explanation?: string | null;
}

interface AttemptWithQuestions extends QuizAttempt {
  questions: QuizQuestion[];
  allAttempts?: QuizAttempt[]; // All attempts for progress tracking
}

export default function QuizHistoryPage() {
  const router = useRouter();
  const [loading, setLoading] = useState(true);
  const [attempts, setAttempts] = useState<AttemptWithQuestions[]>([]);
  const [expandedAttempts, setExpandedAttempts] = useState<Set<string>>(new Set());
  const [grammarTutorialOpen, setGrammarTutorialOpen] = useState(false);
  const [grammarTutorialData, setGrammarTutorialData] = useState<{ arabicWord: string; grammarInfo: any; wordId?: number } | null>(null);
  const [wordsData, setWordsData] = useState<Map<number, any>>(new Map());

  useEffect(() => {
    loadQuizHistory();
  }, []);

  async function loadQuizHistory() {
    try {
      const supabase = createClient();

      // Get all quiz attempts for the user
      const { data: attemptsData, error: attemptsError } = await supabase
        .from('quiz_attempts')
        .select(`
          id,
          surah_id,
          score,
          total_questions,
          completed_at,
          surahs (
            name_english,
            name_arabic,
            surah_number
          )
        `)
        .order('completed_at', { ascending: false });

      if (attemptsError) throw attemptsError;

      // Get all questions for these attempts
      const attemptIds = attemptsData?.map(a => a.id) || [];
      const { data: questionsData, error: questionsError } = await supabase
        .from('quiz_questions')
        .select('*')
        .in('attempt_id', attemptIds)
        .order('created_at', { ascending: true });

      if (questionsError) throw questionsError;

      // Group questions by attempt_id
      const questionsByAttempt = new Map<string, QuizQuestion[]>();
      questionsData?.forEach((q: any) => {
        if (!questionsByAttempt.has(q.attempt_id)) {
          questionsByAttempt.set(q.attempt_id, []);
        }
        questionsByAttempt.get(q.attempt_id)!.push(q);
      });

      // Fetch explanations from quiz_bank for all questions
      const surahIds = [...new Set((attemptsData || []).map((a: any) => a.surah_id))];
      const { data: quizBankData, error: quizBankError } = await supabase
        .from('quiz_bank')
        .select('question_text, explanation, surah_id')
        .in('surah_id', surahIds);

      // Create a map of explanations by question text and surah_id
      const explanationMap = new Map<string, string>();
      if (!quizBankError && quizBankData) {
        quizBankData.forEach((item: any) => {
          const key = `${item.surah_id}:${item.question_text}`;
          explanationMap.set(key, item.explanation);
        });
      }

      // Group attempts by surah_id and keep only the most recent one per surah
      const attemptsBySurah = new Map<number, any>();
      (attemptsData || []).forEach((attempt: any) => {
        const existing = attemptsBySurah.get(attempt.surah_id);
        if (!existing || new Date(attempt.completed_at) > new Date(existing.completed_at)) {
          attemptsBySurah.set(attempt.surah_id, attempt);
        }
      });

      // Get all attempts for progress tracking (all attempts, not just latest)
      const allAttemptsBySurah = new Map<number, any[]>();
      (attemptsData || []).forEach((attempt: any) => {
        if (!allAttemptsBySurah.has(attempt.surah_id)) {
          allAttemptsBySurah.set(attempt.surah_id, []);
        }
        allAttemptsBySurah.get(attempt.surah_id)!.push(attempt);
      });

      // Combine attempts with their questions and add explanations (only latest per surah)
      const attemptsWithQuestions: AttemptWithQuestions[] = Array.from(attemptsBySurah.values()).map((attempt: any) => {
        const questions = (questionsByAttempt.get(attempt.id) || []).map((q: any) => {
          const explanationKey = `${attempt.surah_id}:${q.question_text}`;
          return {
            ...q,
            explanation: explanationMap.get(explanationKey) || null
          };
        });

        // Get all attempts for this surah for progress graph
        const allSurahAttempts = (allAttemptsBySurah.get(attempt.surah_id) || [])
          .sort((a: any, b: any) => new Date(a.completed_at).getTime() - new Date(b.completed_at).getTime());

        return {
          id: attempt.id,
          surah_id: attempt.surah_id,
          score: attempt.score,
          total_questions: attempt.total_questions,
          completed_at: attempt.completed_at,
          surah_name: attempt.surahs?.name_english || `Surah ${attempt.surahs?.surah_number || attempt.surah_id}`,
          questions,
          allAttempts: allSurahAttempts // For progress graph
        };
      });

      setAttempts(attemptsWithQuestions);

      // Fetch words data for grammar tutorials
      const wordIds = new Set<number>();
      questionsData?.forEach((q: any) => {
        if (q.word_id) wordIds.add(q.word_id);
      });

      if (wordIds.size > 0) {
        const { data: words, error: wordsError } = await supabase
          .from('words')
          .select('id, text_arabic, grammar_info')
          .in('id', Array.from(wordIds));

        if (!wordsError && words) {
          const wordsMap = new Map<number, any>();
          words.forEach(w => {
            wordsMap.set(w.id, w);
          });
          setWordsData(wordsMap);
        }
      }

      setLoading(false);
    } catch (error: any) {
      console.error('Error loading quiz history:', error);
      setLoading(false);
    }
  }

  function toggleAttempt(attemptId: string) {
    setExpandedAttempts(prev => {
      const newSet = new Set(prev);
      if (newSet.has(attemptId)) {
        newSet.delete(attemptId);
      } else {
        newSet.add(attemptId);
      }
      return newSet;
    });
  }

  async function openGrammarTutorial(wordId: number | null, questionText: string, grammarPoint?: string | null) {
    if (!wordId) {
      console.warn('Cannot open grammar tutorial - no word_id provided');
      return;
    }

    const word = wordsData.get(wordId);
    if (!word || !word.grammar_info) {
      // Try to fetch from database
      const supabase = createClient();
      const { data: wordData, error } = await supabase
        .from('words')
        .select('text_arabic, grammar_info')
        .eq('id', wordId)
        .single();

      if (!error && wordData && wordData.grammar_info) {
        // Extract Arabic word from question text if not available
        const arabicMatch = questionText.match(/'([^']+)'/);
        const arabicWord = arabicMatch ? arabicMatch[1] : wordData.text_arabic;

        setGrammarTutorialData({
          arabicWord,
          grammarInfo: wordData.grammar_info,
          wordId: wordId
        });
        setGrammarTutorialOpen(true);
      } else {
        console.warn('Could not fetch word data or grammar_info for word_id:', wordId);
      }
      return;
    }

    // Extract Arabic word from question text if not available
    const arabicMatch = questionText.match(/'([^']+)'/);
    const arabicWord = arabicMatch ? arabicMatch[1] : word.text_arabic;

    setGrammarTutorialData({
      arabicWord,
      grammarInfo: word.grammar_info,
      wordId: wordId
    });
    setGrammarTutorialOpen(true);
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto mb-4"></div>
          <p className="text-gray-600">Loading quiz history...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-6">
          <button
            onClick={() => router.push('/dashboard')}
            className="text-primary-600 hover:text-primary-700 mb-4 font-medium"
          >
            ← Back to Dashboard
          </button>
          <h1 className="text-3xl font-bold text-gray-900">Quiz History</h1>
          <p className="text-gray-600 mt-2">Review your quiz attempts and answers</p>
        </div>

        {attempts.length === 0 ? (
          <div className="bg-white rounded-lg shadow-md p-8 text-center">
            <p className="text-gray-600">No quiz attempts yet. Take a quiz to see your history here!</p>
            <Link
              href="/surah/1"
              className="mt-4 inline-block text-primary-600 hover:text-primary-700 font-medium"
            >
              Take Al-Fatiha Quiz →
            </Link>
          </div>
        ) : (
          <div className="space-y-4">
            {attempts.map((attempt) => {
              const isExpanded = expandedAttempts.has(attempt.id);
              const percentage = Math.round((attempt.score / attempt.total_questions) * 100);
              const date = new Date(attempt.completed_at).toLocaleDateString('en-US', {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit'
              });

              // Prepare data for progress graph
              const progressData = attempt.allAttempts || [];
              const maxScore = attempt.total_questions;
              const graphWidth = 600;
              const graphHeight = 200;
              const padding = 50;
              const graphInnerWidth = graphWidth - padding * 2;
              const graphInnerHeight = graphHeight - padding * 2;

              return (
                <div key={attempt.id} className="bg-white rounded-lg shadow-md overflow-hidden">
                  {/* Attempt Header */}
                  <button
                    onClick={() => toggleAttempt(attempt.id)}
                    className="w-full p-6 text-left hover:bg-gray-50 transition-colors"
                  >
                    <div className="flex items-center justify-between">
                      <div className="flex-1">
                        <h3 className="text-xl font-semibold text-gray-900">{attempt.surah_name}</h3>
                        <p className="text-sm text-gray-600 mt-1">{date}</p>
                        {progressData.length > 1 && (
                          <div className="mt-4">
                            <p className="text-sm text-gray-600 mb-2 font-medium">Progress over {progressData.length} attempts:</p>
                            <svg width={graphWidth} height={graphHeight} className="border border-gray-300 rounded-lg bg-gray-50">
                              {/* Grid lines */}
                              {[0, 25, 50, 75, 100].map((percent) => {
                                const y = graphHeight - padding - ((graphInnerHeight) * percent / 100);
                                return (
                                  <g key={percent}>
                                    <line
                                      x1={padding}
                                      y1={y}
                                      x2={graphWidth - padding}
                                      y2={y}
                                      stroke={percent === 0 || percent === 100 ? "#d1d5db" : "#e5e7eb"}
                                      strokeWidth={percent === 0 || percent === 100 ? "1.5" : "1"}
                                      strokeDasharray={percent === 0 || percent === 100 ? "0" : "4,4"}
                                    />
                                    {/* Y-axis labels for grid lines */}
                                    <text
                                      x={padding - 8}
                                      y={y + 4}
                                      fontSize="12"
                                      fill="#6b7280"
                                      textAnchor="end"
                                      className="font-medium"
                                    >
                                      {Math.round((maxScore * percent) / 100)}
                                    </text>
                                  </g>
                                );
                              })}
                              {/* Progress line */}
                              {progressData.length > 1 && (
                                <polyline
                                  points={progressData.map((a: any, idx: number) => {
                                    const x = padding + (idx / (progressData.length - 1)) * graphInnerWidth;
                                    const y = graphHeight - padding - ((a.score / maxScore) * graphInnerHeight);
                                    return `${x},${y}`;
                                  }).join(' ')}
                                  fill="none"
                                  stroke="#4f46e5"
                                  strokeWidth="3"
                                />
                              )}
                              {/* Data points with values */}
                              {progressData.map((a: any, idx: number) => {
                                const x = padding + (idx / (progressData.length - 1)) * graphInnerWidth;
                                const y = graphHeight - padding - ((a.score / maxScore) * graphInnerHeight);
                                return (
                                  <g key={idx}>
                                    {/* Circle */}
                                    <circle
                                      cx={x}
                                      cy={y}
                                      r="5"
                                      fill="#4f46e5"
                                      stroke="white"
                                      strokeWidth="2"
                                    />
                                    {/* Value label above point */}
                                    <text
                                      x={x}
                                      y={y - 12}
                                      fontSize="12"
                                      fill="#1f2937"
                                      textAnchor="middle"
                                      className="font-semibold"
                                    >
                                      {a.score}/{maxScore}
                                    </text>
                                    {/* Attempt number below point */}
                                    <text
                                      x={x}
                                      y={graphHeight - padding + 25}
                                      fontSize="12"
                                      fill="#6b7280"
                                      textAnchor="middle"
                                      className="font-medium"
                                    >
                                      #{idx + 1}
                                    </text>
                                  </g>
                                );
                              })}
                              {/* X-axis label */}
                              <text
                                x={graphWidth / 2}
                                y={graphHeight - 8}
                                fontSize="12"
                                fill="#6b7280"
                                textAnchor="middle"
                                className="font-medium"
                              >
                                Attempt Number
                              </text>
                              {/* Y-axis label */}
                              <text
                                x={20}
                                y={graphHeight / 2}
                                fontSize="12"
                                fill="#6b7280"
                                textAnchor="middle"
                                transform={`rotate(-90, 20, ${graphHeight / 2})`}
                                className="font-medium"
                              >
                                Score
                              </text>
                            </svg>
                          </div>
                        )}
                      </div>
                      <div className="text-right">
                        <div className="text-2xl font-bold text-primary-600">
                          {attempt.score}/{attempt.total_questions}
                        </div>
                        <div className="text-sm text-gray-600">{percentage}%</div>
                      </div>
                      <div className="ml-4">
                        <svg
                          className={`w-6 h-6 text-gray-400 transition-transform ${isExpanded ? 'transform rotate-180' : ''}`}
                          fill="none"
                          stroke="currentColor"
                          viewBox="0 0 24 24"
                        >
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                        </svg>
                      </div>
                    </div>
                  </button>

                  {/* Expanded Questions */}
                  {isExpanded && (
                    <div className="border-t border-gray-200 p-6">
                      <div className="space-y-4">
                        {attempt.questions.map((question, index) => {
                          // Extract Arabic word from question text
                          const arabicMatch = question.question_text.match(/'([^']+)'/);
                          const arabicWord = arabicMatch ? arabicMatch[1] : '';

                          return (
                            <div
                              key={question.id}
                              className={`p-4 rounded-lg border-2 relative ${
                                question.is_correct
                                  ? 'bg-green-50 border-green-200'
                                  : 'bg-red-50 border-red-200'
                              }`}
                            >
                              {(question.word_id || question.grammar_point) && (
                                <button
                                  onClick={() => {
                                    if (question.word_id) {
                                      openGrammarTutorial(question.word_id, question.question_text, question.grammar_point);
                                    }
                                  }}
                                  disabled={!question.word_id}
                                  className="absolute top-2 right-2 text-2xl hover:scale-110 disabled:opacity-50 disabled:cursor-not-allowed transition-transform cursor-pointer"
                                  title="Learn about this grammar point"
                                >
                                  📖
                                </button>
                              )}
                              <div className="flex items-start gap-2 mb-2 pr-8">
                                <span className="font-semibold">Q{index + 1}:</span>
                                <div className="flex-1">
                                  <span className="mr-2">{question.question_text.split("'").map((part, i) => {
                                    if (i % 2 === 1) {
                                      return (
                                        <span key={i} dir="rtl" className="inline-block" style={{ fontFamily: 'Amiri, serif', fontSize: '33px', direction: 'rtl', textAlign: 'right' }}>
                                          {part}
                                        </span>
                                      );
                                    }
                                    return <span key={i}>{part}</span>;
                                  })}</span>
                                </div>
                              </div>

                              <div className="ml-6 space-y-2 text-sm">
                                <p>
                                  <span className="font-semibold">Your answer:</span>{' '}
                                  <span className={question.is_correct ? 'text-green-700' : 'text-red-700'}>
                                    {question.user_answer || '(No answer)'}
                                  </span>
                                </p>
                                {!question.is_correct && (
                                  <p>
                                    <span className="font-semibold">Correct answer:</span>{' '}
                                    <span className="text-green-700">{question.correct_answer}</span>
                                  </p>
                                )}
                                {question.explanation && (
                                  <p className="text-gray-700 mt-2">
                                    <span className="font-semibold">Explanation:</span> {question.explanation}
                                  </p>
                                )}
                              </div>
                            </div>
                          );
                        })}
                      </div>
                    </div>
                  )}
                </div>
              );
            })}
          </div>
        )}
      </div>

      {/* Grammar Tutorial Modal */}
      {grammarTutorialData && (
        <GrammarTutorialModal
          isOpen={grammarTutorialOpen}
          onClose={() => {
            setGrammarTutorialOpen(false);
            setGrammarTutorialData(null);
          }}
          arabicWord={grammarTutorialData.arabicWord}
          grammarInfo={grammarTutorialData.grammarInfo}
          wordId={grammarTutorialData.wordId}
        />
      )}
    </div>
  );
}

