// SM-2 Spaced Repetition Algorithm Implementation
// Based on SuperMemo 2 algorithm

export interface SM2Params {
  easeFactor: number; // Current ease factor (1.3 to 3.0)
  interval: number; // Current interval in days
  repetitions: number; // Number of successful consecutive reviews
}

export interface SM2Result {
  easeFactor: number;
  interval: number;
  repetitions: number;
  nextReviewDate: Date;
}

const MIN_EASE_FACTOR = 1.3;
const MAX_EASE_FACTOR = 3.0;
const INITIAL_EASE_FACTOR = 2.5;

/**
 * Calculate new SM-2 parameters based on difficulty rating
 * @param params Current SM-2 parameters
 * @param difficulty User's difficulty rating (1-5, where 1=hard, 3=medium, 5=easy)
 * @returns Updated SM-2 parameters
 */
export function calculateSM2(
  params: SM2Params,
  difficulty: 'hard' | 'medium' | 'easy'
): SM2Result {
  let { easeFactor, interval, repetitions } = params;
  
  // Map difficulty to quality (SM-2 uses 0-5, we use hard/medium/easy)
  let quality: number;
  switch (difficulty) {
    case 'hard':
      quality = 2; // Below threshold, reset progress
      break;
    case 'medium':
      quality = 3; // Threshold, moderate progress
      break;
    case 'easy':
      quality = 5; // Above threshold, good progress
      break;
  }

  // Calculate new ease factor
  // EF' = EF + (0.1 - (5 - q) * (0.08 + (5 - q) * 0.02))
  const easeFactorChange = 0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02);
  let newEaseFactor = easeFactor + easeFactorChange;
  
  // Clamp ease factor between MIN and MAX
  newEaseFactor = Math.max(MIN_EASE_FACTOR, Math.min(MAX_EASE_FACTOR, newEaseFactor));

  // Calculate new interval and repetitions
  let newInterval: number;
  let newRepetitions: number;

  if (quality < 3) {
    // Hard: Reset progress, review tomorrow
    newRepetitions = 0;
    newInterval = 1;
  } else {
    // Medium or Easy: Progress normally
    if (repetitions === 0) {
      // First review
      newInterval = 1;
      newRepetitions = 1;
    } else if (repetitions === 1) {
      // Second review
      newInterval = 6;
      newRepetitions = 2;
    } else {
      // Subsequent reviews: interval = previous interval * ease factor
      newInterval = Math.round(interval * newEaseFactor);
      newRepetitions = repetitions + 1;
    }
  }

  // Calculate next review date
  const nextReviewDate = new Date();
  nextReviewDate.setDate(nextReviewDate.getDate() + newInterval);

  return {
    easeFactor: Math.round(newEaseFactor * 100) / 100, // Round to 2 decimal places
    interval: newInterval,
    repetitions: newRepetitions,
    nextReviewDate,
  };
}

/**
 * Get initial SM-2 parameters for a new flashcard
 */
export function getInitialSM2Params(): SM2Params {
  return {
    easeFactor: INITIAL_EASE_FACTOR,
    interval: 1,
    repetitions: 0,
  };
}

