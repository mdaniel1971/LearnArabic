'use client';

import { useState, useEffect } from 'react';
import { useParams, useRouter } from 'next/navigation';
import { createClient } from '@/utils/supabase/client';
import { QuizBank } from '@/types/quran';
import ArabicText from '@/components/ArabicText';
import GrammarTutorialModal from '@/components/GrammarTutorialModal';

interface QuestionFeedback {
  isCorrect: boolean;
  correctAnswer: string;
  explanation?: string;
  grammarPoint?: string;
  wordId?: number;
  arabicWord?: string;
}

export default function QuizPage() {
  const params = useParams();
  const router = useRouter();
  const surahNumber = parseInt(params.id as string);

  const [loading, setLoading] = useState(true);
  const [generating, setGenerating] = useState(false);
  const [questions, setQuestions] = useState<QuizBank[]>([]);
  const [currentQuestion, setCurrentQuestion] = useState(0);
  const [answers, setAnswers] = useState<Record<string, string>>({});
  const [feedback, setFeedback] = useState<Record<string, QuestionFeedback>>({});
  const [showResults, setShowResults] = useState(false);
  const [results, setResults] = useState<any>(null);
  const [surahName, setSurahName] = useState('');
  const [surahNameArabic, setSurahNameArabic] = useState('');
  const [surahId, setSurahId] = useState<number | null>(null);
  const [grammarTutorialOpen, setGrammarTutorialOpen] = useState(false);
  const [grammarTutorialData, setGrammarTutorialData] = useState<{ arabicWord: string; grammarInfo: any; wordId?: number } | null>(null);
  const [wordsData, setWordsData] = useState<any[]>([]);

  useEffect(() => {
    loadQuiz();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [surahNumber]);

  async function loadQuiz() {
    try {
      const supabase = createClient();

      // Get surah by surah_number (route param) to get the actual id
      const { data: surah } = await supabase
        .from('surahs')
        .select('id, name_english, name_arabic')
        .eq('surah_number', surahNumber)
        .single();

      if (!surah) {
        throw new Error('Surah not found');
      }

      setSurahName(surah.name_english);
      setSurahNameArabic(surah.name_arabic);
      setSurahId(surah.id);

      // Fetch words data for grammar tutorials
      const { data: verses } = await supabase
        .from('verses')
        .select('id, words(id, text_arabic, grammar_info)')
        .eq('surah_id', surah.id);

      const allWords = verses?.flatMap(v => v.words || []) || [];
      setWordsData(allWords);

      // Generate quiz on-the-fly (don't store in quiz_bank)
      setGenerating(true);
      const generateResponse = await fetch('/api/quiz/generate-on-the-fly', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ surahId: surah.id })
      });

      if (!generateResponse.ok) {
        const errorData = await generateResponse.json();
        throw new Error(errorData.error || 'Failed to generate quiz');
      }

      const generateData = await generateResponse.json();
      setGenerating(false);

      if (!generateData.questions || generateData.questions.length === 0) {
        throw new Error('No questions generated for this quiz');
      }

      // Shuffle questions and their options for variety
      const shuffled = generateData.questions
        .sort(() => Math.random() - 0.5)
        .map((q: any) => {
          // Ensure options is an array
          const optionsArray = Array.isArray(q.options) && q.options.length > 0 ? q.options : [];

          return {
            id: q.id || `temp-${Math.random()}`,
            surah_id: surah.id,
            question_text: q.question || q.question_text || '',
            question_type: (q.type || q.question_type || 'multiple_choice') as 'multiple_choice' | 'fill_blank',
            correct_answer: q.correct_answer || q.correctAnswer || '',
            word_id: q.word_id || null,
            grammar_point: q.grammar_point || null,
            explanation: q.explanation || null,
            created_at: new Date().toISOString(),
            options: optionsArray.length > 0 ? [...optionsArray].sort(() => Math.random() - 0.5) : null
          };
        });

      setQuestions(shuffled);
      setLoading(false);

    } catch (error: any) {
      console.error('Error loading quiz:', error);
      console.error('Error details:', error.message, error.stack);
      alert(`Error loading quiz: ${error.message || 'Unknown error'}. Please check the console for details.`);
      setLoading(false);
    }
  }

  // Helper function to check if two answers are synonyms
  function areAnswersSynonyms(answer1: string, answer2: string): boolean {
    const normalized1 = answer1.trim().toLowerCase();
    const normalized2 = answer2.trim().toLowerCase();

    // Exact match
    if (normalized1 === normalized2) return true;

    // Check for common synonyms
    const synonymGroups: Record<string, string[]> = {
      'master of': ['owner of', 'possessor of', 'ruler of'],
      'owner of': ['master of', 'possessor of', 'ruler of'],
      'possessor of': ['master of', 'owner of', 'ruler of'],
      'ruler of': ['master of', 'owner of', 'possessor of'],
      'the most merciful': ['the merciful', 'most merciful'],
      'the merciful': ['the most merciful', 'most merciful'],
    };

    // Check if answers are in the same synonym group
    for (const [key, synonyms] of Object.entries(synonymGroups)) {
      const answer1Matches = normalized1.includes(key) || synonyms.some(syn => normalized1.includes(syn));
      const answer2Matches = normalized2.includes(key) || synonyms.some(syn => normalized2.includes(syn));

      if (answer1Matches && answer2Matches) {
        return true;
      }
    }

    return false;
  }

  // Improved answer matching - handles synonyms
  function isAnswerCorrect(userAnswer: string, correctAnswer: string, options: string[]): { isCorrect: boolean; matchedAnswer?: string } {
    const normalizedUser = userAnswer.trim().toLowerCase();
    const normalizedCorrect = correctAnswer.trim().toLowerCase();

    // Exact match
    if (normalizedUser === normalizedCorrect) {
      return { isCorrect: true, matchedAnswer: correctAnswer };
    }

    // Check if answers are synonyms
    if (areAnswersSynonyms(userAnswer, correctAnswer)) {
      return { isCorrect: true, matchedAnswer: correctAnswer };
    }

    return { isCorrect: false };
  }

  function handleAnswer(answer: string) {
    const questionId = questions[currentQuestion].id;
    setAnswers(prev => ({
      ...prev,
      [questionId]: answer
    }));

    // Check answer immediately
    const currentQ = questions[currentQuestion];
    const result = isAnswerCorrect(answer, currentQ.correct_answer, (currentQ.options as string[]) || []);

    // Extract Arabic word from question text
    const arabicMatch = currentQ.question_text.match(/'([^']+)'/);
    const arabicWord = arabicMatch ? arabicMatch[1] : '';

    setFeedback(prev => ({
      ...prev,
      [questionId]: {
        isCorrect: result.isCorrect,
        correctAnswer: currentQ.correct_answer,
        explanation: currentQ.explanation || undefined,
        grammarPoint: currentQ.grammar_point || undefined,
        wordId: currentQ.word_id ? Number(currentQ.word_id) : undefined,
        arabicWord: arabicWord || undefined
      }
    }));
  }

  function nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      setCurrentQuestion(prev => prev + 1);
    }
  }

  function previousQuestion() {
    if (currentQuestion > 0) {
      setCurrentQuestion(prev => prev - 1);
    }
  }

  async function openGrammarTutorial(wordId: number | string | null | undefined, arabicWord?: string) {
    // Convert to number if needed
    const numericWordId = typeof wordId === 'string' ? parseInt(wordId, 10) : wordId;

    if (!numericWordId || isNaN(numericWordId)) {
      return;
    }

    // If arabicWord is not provided, try to extract from results or fetch
    let finalArabicWord = arabicWord;

    // Try to find word in wordsData first
    const word = wordsData.find(w => w.id === numericWordId);

    if (word && word.grammar_info) {
      setGrammarTutorialData({
        arabicWord: finalArabicWord || word.text_arabic,
        grammarInfo: word.grammar_info,
        wordId: numericWordId
      });
      setGrammarTutorialOpen(true);
      return;
    }

    // Fetch the word from database if not in wordsData
    const supabase = createClient();
    const { data: wordData, error } = await supabase
      .from('words')
      .select('text_arabic, grammar_info')
      .eq('id', numericWordId)
      .single();

    if (!error && wordData && wordData.grammar_info) {
      setGrammarTutorialData({
        arabicWord: finalArabicWord || wordData.text_arabic,
        grammarInfo: wordData.grammar_info,
        wordId: numericWordId
      });
      setGrammarTutorialOpen(true);
    } else {
      console.warn('Could not fetch word data or grammar_info for word_id:', numericWordId, error);
    }
  }

  async function submitQuiz() {
    if (!surahId) return;

    try {
      const answersArray = questions.map(q => ({
        questionId: q.id,
        userAnswer: answers[q.id] || ''
      }));

      const response = await fetch('/api/quiz/submit', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          surahId,
          answers: answersArray
        })
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || `Failed to submit quiz: ${response.statusText}`);
      }

      const data = await response.json();

      if (data.success) {
        setResults(data);
        setShowResults(true);
      } else {
        throw new Error(data.error || 'Unknown error submitting quiz');
      }

    } catch (error: any) {
      console.error('Error submitting quiz:', error);
      console.error('Error details:', error.message, error.details);
      alert(`Error submitting quiz: ${error.message || 'Unknown error'}. Please check the console for details.`);
    }
  }

  function retakeQuiz() {
    setAnswers({});
    setFeedback({});
    setCurrentQuestion(0);
    setShowResults(false);
    setResults(null);
    loadQuiz(); // Reshuffle questions
  }

  if (loading || generating || !surahId) {
    return (
      <div className="min-h-screen bg-gray-50 p-4">
        <div className="max-w-3xl mx-auto">
          <div className="mb-4">
            <button
              onClick={() => router.push('/dashboard')}
              className="text-primary-600 hover:text-primary-700 font-medium"
            >
              ← Back to Dashboard
            </button>
          </div>
          <div className="flex items-center justify-center min-h-[60vh]">
            <div className="text-center">
              <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600 mx-auto mb-4"></div>
              <p className="text-gray-600">
                {generating ? 'Generating your quiz...' : 'Loading quiz...'}
              </p>
            </div>
          </div>
        </div>
      </div>
    );
  }

  if (showResults && results) {
    return (
      <div className="min-h-screen bg-gray-50 p-4">
        <div className="max-w-3xl mx-auto">
          <div className="mb-4">
            <button
              onClick={() => router.push('/dashboard')}
              className="text-primary-600 hover:text-primary-700 font-medium"
            >
              ← Back to Dashboard
            </button>
          </div>
          <div className="bg-white rounded-lg shadow-md p-6 mb-6">
            <h1 className="text-2xl font-bold mb-2">Quiz Results</h1>
            <div className="mb-4">
              <div dir="rtl" className="text-3xl font-amiri mb-1" style={{ fontFamily: 'Amiri, serif', direction: 'rtl', textAlign: 'right' }}>
                {surahNameArabic}
              </div>
              <div className="text-lg text-gray-600">{surahName}</div>
            </div>
            <div className="text-center mb-6">
              <div className="text-5xl font-bold text-primary-600 mb-2">
                {results.score}/{results.totalQuestions}
              </div>
              <p className="text-gray-600">
                {Math.round((results.score / results.totalQuestions) * 100)}% Correct
              </p>
            </div>

            <div className="space-y-4">
              {results.results.map((result: any, index: number) => {
                // Extract Arabic word from question text
                const arabicMatch = result.question_text.match(/'([^']+)'/);
                const arabicWord = arabicMatch ? arabicMatch[1] : '';

                return (
                  <div
                    key={index}
                    className={`p-4 rounded-lg border-2 relative ${result.is_correct
                      ? 'bg-green-50 border-green-200'
                      : 'bg-red-50 border-red-200'
                      }`}
                  >
                    {(result.word_id || result.grammar_point) && (
                      <button
                        onClick={() => {
                          if (result.word_id) {
                            // Ensure word_id is a number
                            const wordId = typeof result.word_id === 'string'
                              ? parseInt(result.word_id, 10)
                              : result.word_id;
                            if (!isNaN(wordId)) {
                              openGrammarTutorial(wordId, arabicWord || undefined);
                            } else {
                              console.warn('Invalid word_id:', result.word_id);
                            }
                          }
                        }}
                        disabled={!result.word_id}
                        className="absolute top-2 right-2 text-2xl hover:scale-110 disabled:opacity-50 disabled:cursor-not-allowed transition-transform cursor-pointer"
                        title="Learn about this grammar point"
                      >
                        📖
                      </button>
                    )}
                    <div className="flex items-start gap-2 mb-2 pr-8">
                      <span className="font-semibold">Q{index + 1}:</span>
                      <div className="flex-1">
                        <span>{result.question_text.split("'").map((part: string, i: number) => {
                          if (i % 2 === 1) {
                            return (
                              <span key={i} dir="rtl" className="inline-block" style={{ fontFamily: 'Amiri, serif', fontSize: '28px', direction: 'rtl', textAlign: 'right' }}>
                                {part}
                              </span>
                            );
                          }
                          return <span key={i}>{part}</span>;
                        })}</span>
                      </div>
                    </div>

                    <div className="ml-6 space-y-1 text-sm">
                      <p>
                        <span className="font-semibold">Your answer:</span>{' '}
                        <span className={result.is_correct ? 'text-green-700' : 'text-red-700'}>
                          {result.user_answer || '(No answer)'}
                        </span>
                      </p>
                      {!result.is_correct && (
                        <p>
                          <span className="font-semibold">Correct answer:</span>{' '}
                          <span className="text-green-700">{result.correct_answer}</span>
                        </p>
                      )}
                      {result.explanation && (
                        <p className="text-gray-700 mt-2">
                          <span className="font-semibold">Explanation:</span> {result.explanation}
                        </p>
                      )}
                    </div>
                  </div>
                );
              })}
            </div>

            <div className="flex gap-4 mt-6">
              <button
                onClick={retakeQuiz}
                className="flex-1 bg-primary-600 text-white py-3 rounded-lg hover:bg-primary-700 transition-colors font-semibold"
              >
                Retake Quiz
              </button>
              <button
                onClick={() => router.push(`/surah/${surahNumber}`)}
                className="flex-1 bg-gray-200 text-gray-800 py-3 rounded-lg hover:bg-gray-300 transition-colors"
              >
                Back to Surah
              </button>
            </div>
          </div>
        </div>
      </div>
    );
  }

  const currentQ = questions[currentQuestion];
  const currentAnswer = currentQ ? answers[currentQ.id] : '';
  const currentFeedback = currentQ ? feedback[currentQ.id] : undefined;
  const hasAnswered = !!currentAnswer;

  if (!currentQ) {
    return (
      <div className="min-h-screen bg-gray-50 p-4">
        <div className="max-w-3xl mx-auto">
          <div className="mb-4">
            <button
              onClick={() => router.push('/dashboard')}
              className="text-primary-600 hover:text-primary-700 font-medium"
            >
              ← Back to Dashboard
            </button>
          </div>
          <div className="flex items-center justify-center min-h-[60vh]">
            <div className="text-center">
              <p className="text-gray-600">No questions available</p>
            </div>
          </div>
        </div>
      </div>
    );
  }

  // Extract Arabic word from question text (remove transliteration)
  const questionText = currentQ.question_text.replace(/\s*\([^)]+\)/g, ''); // Remove transliteration in parentheses
  const arabicMatch = questionText.match(/'([^']+)'/);
  const arabicWord = arabicMatch ? arabicMatch[1] : '';


  return (
    <div className="min-h-screen bg-gray-50 p-4">
      <div className="max-w-3xl mx-auto">
        <div className="mb-4">
          <button
            onClick={() => router.push('/dashboard')}
            className="text-indigo-600 hover:text-indigo-800"
          >
            ← Back to Dashboard
          </button>
        </div>
        <div className="bg-white rounded-lg shadow-md p-6">
          <div className="mb-6">
            <h1 className="text-2xl font-bold mb-2">Quiz</h1>
            <div className="mb-4">
              <div dir="rtl" className="text-3xl font-amiri mb-1" style={{ fontFamily: 'Amiri, serif', direction: 'rtl', textAlign: 'right' }}>
                {surahNameArabic}
              </div>
              <div className="text-lg text-gray-600">{surahName}</div>
            </div>
            <div className="flex items-center justify-between text-sm text-gray-600">
              <span>Question {currentQuestion + 1} of {questions.length}</span>
              <span>
                {Object.values(feedback).filter(f => f.isCorrect).length} correct / {Object.keys(answers).length} answered
              </span>
            </div>
            <div className="w-full bg-gray-200 rounded-full h-2 mt-2">
              <div
                className="bg-primary-600 h-2 rounded-full transition-all"
                style={{ width: `${((currentQuestion + 1) / questions.length) * 100}%` }}
              ></div>
            </div>
          </div>

          <div className="mb-8">
            <h2 className="text-xl mb-4 font-semibold leading-relaxed" style={{ lineHeight: '1.8' }}>
              {questionText.split("'").map((part, i) => {
                if (i % 2 === 1) {
                  // This is the Arabic word
                  return (
                    <span key={i} dir="rtl" className="inline-block" style={{ fontFamily: 'Amiri, serif', fontSize: '28px', direction: 'rtl', textAlign: 'right', lineHeight: '1.8' }}>
                      {part}
                    </span>
                  );
                }
                return <span key={i} style={{ lineHeight: '1.8' }}>{part}</span>;
              })}
            </h2>

            {currentQ.question_type === 'multiple_choice' && Array.isArray(currentQ.options) && currentQ.options.length > 0 && (
              <div className="space-y-3">
                {currentQ.options.map((option, index) => {
                  // Check if this option is correct (exact match or synonym)
                  const isThisOptionCorrect = hasAnswered && currentFeedback
                    ? areAnswersSynonyms(option, currentFeedback.correctAnswer)
                    : false;
                  const isUserSelected = currentAnswer === option;
                  const userAnswerIsCorrect = hasAnswered && currentFeedback ? currentFeedback.isCorrect : false;

                  return (
                    <button
                      key={index}
                      onClick={() => handleAnswer(option)}
                      disabled={hasAnswered}
                      className={`w-full text-left p-4 rounded-lg border-2 transition-colors ${hasAnswered && currentFeedback
                        ? isThisOptionCorrect
                          ? 'border-green-600 bg-green-50'
                          : isUserSelected && !userAnswerIsCorrect
                            ? 'border-red-600 bg-red-50'
                            : 'border-gray-200 opacity-50'
                        : isUserSelected
                          ? 'border-primary-600 bg-primary-50'
                          : 'border-gray-200 hover:border-blue-300'
                        } ${hasAnswered ? 'cursor-not-allowed' : 'cursor-pointer'}`}
                    >
                      {option}
                      {hasAnswered && currentFeedback && isThisOptionCorrect && (
                        <span className="ml-2 text-green-600 font-semibold">✓</span>
                      )}
                      {hasAnswered && currentFeedback && isUserSelected && !userAnswerIsCorrect && (
                        <span className="ml-2 text-red-600 font-semibold">✗</span>
                      )}
                    </button>
                  );
                })}
              </div>
            )}

            {currentQ.question_type === 'fill_blank' && (
              <input
                type="text"
                value={currentAnswer || ''}
                onChange={(e) => handleAnswer(e.target.value)}
                disabled={hasAnswered}
                className={`w-full p-4 border-2 rounded-lg focus:outline-none ${hasAnswered && currentFeedback
                  ? currentFeedback.isCorrect
                    ? 'border-green-600 bg-green-50'
                    : 'border-red-600 bg-red-50'
                  : 'border-gray-200 focus:border-blue-600'
                  }`}
                placeholder="Type your answer..."
              />
            )}

            {/* Immediate Feedback */}
            {hasAnswered && currentFeedback && (
              <div className={`mt-4 p-4 rounded-lg border-2 relative ${currentFeedback.isCorrect
                ? 'bg-green-50 border-green-200'
                : 'bg-red-50 border-red-200'
                }`}>
                {currentFeedback.wordId && currentFeedback.arabicWord && (
                  <button
                    onClick={() => {
                      if (currentFeedback.wordId) {
                        openGrammarTutorial(currentFeedback.wordId, currentFeedback.arabicWord);
                      }
                    }}
                    className="absolute top-2 right-2 text-4xl hover:scale-110 transition-transform cursor-pointer"
                    title="Learn about this grammar point"
                  >
                    📖
                  </button>
                )}
                <div className="flex items-start gap-2 mb-2 pr-8">
                  {currentFeedback.isCorrect ? (
                    <span className="text-green-600 font-bold">Correct!</span>
                  ) : (
                    <span className="text-red-600 font-bold">Incorrect</span>
                  )}
                </div>

                {!currentFeedback.isCorrect && (
                  <p className="mb-2">
                    <span className="font-semibold">Correct answer:</span>{' '}
                    <span className="text-green-700">{currentFeedback.correctAnswer}</span>
                  </p>
                )}

                {currentFeedback.explanation && (
                  <p className="text-gray-700 mb-2">
                    <span className="font-semibold">Explanation:</span> {currentFeedback.explanation}
                  </p>
                )}
              </div>
            )}
          </div>

          <div className="flex gap-4">
            <button
              onClick={previousQuestion}
              disabled={currentQuestion === 0}
              className="px-[15px] py-3 bg-gray-200 text-gray-800 rounded-lg hover:bg-gray-300 disabled:opacity-50 disabled:cursor-not-allowed transition-colors w-[120px]"
            >
              Previous
            </button>

            {currentQuestion < questions.length - 1 ? (
              <button
                onClick={nextQuestion}
                disabled={!hasAnswered}
                className={`px-[15px] py-3 rounded-lg transition-colors disabled:cursor-not-allowed w-[120px] ${hasAnswered
                  ? 'bg-green-600 text-white hover:bg-green-700'
                  : 'bg-gray-200 text-gray-800 hover:bg-gray-300'
                  }`}
              >
                Next
              </button>
            ) : (
              <button
                onClick={submitQuiz}
                disabled={Object.keys(answers).length < questions.length}
                className="flex-1 px-6 py-3 bg-green-600 text-white rounded-lg hover:bg-green-700 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
              >
                Submit Quiz
              </button>
            )}
          </div>

          {currentQuestion === questions.length - 1 &&
            Object.keys(answers).length < questions.length && (
              <p className="text-sm text-orange-600 mt-4 text-center">
                Please answer all questions before submitting
              </p>
            )}
        </div>
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
          level="advanced"
        />
      )}
    </div>
  );
}
