-- Cleanup script to delete all quiz data
-- Run this BEFORE deploying the fixed grammar explanations

-- Delete all quiz attempts (this will cascade delete quiz_questions)
TRUNCATE TABLE quiz_attempts CASCADE;

-- Delete all pre-generated quiz questions
TRUNCATE TABLE quiz_bank CASCADE;

-- Verify deletion
SELECT 
  (SELECT COUNT(*) FROM quiz_attempts) as remaining_attempts,
  (SELECT COUNT(*) FROM quiz_questions) as remaining_questions,
  (SELECT COUNT(*) FROM quiz_bank) as remaining_quiz_bank;

-- Should all return 0

