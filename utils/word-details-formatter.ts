import { GrammarInfo } from '@/types/quran';

/**
 * Formats grammar information into a readable string like:
 * "Verb: form 1, perfect, active, first-person singular, past tense"
 */
export function formatWordDetails(grammarInfo: GrammarInfo | null | undefined): string {
    if (!grammarInfo) {
        return '';
    }

    const info = grammarInfo;
    const partOfSpeech = info.part_of_speech || 'Grammar point';
    const posLower = partOfSpeech.toLowerCase();

    // Helper functions to extract values from features array or direct properties
    const getPerson = (): string | null => {
        if (info.person) return info.person;
        if (Array.isArray(info.features)) {
            const personFeature = info.features.find((f: string) =>
                f.toLowerCase().includes('first') || f.toLowerCase().includes('second') || f.toLowerCase().includes('third')
            );
            if (personFeature) {
                if (personFeature.toLowerCase().includes('first')) return 'first';
                if (personFeature.toLowerCase().includes('second')) return 'second';
                if (personFeature.toLowerCase().includes('third')) return 'third';
            }
        }
        return null;
    };

    const getNumber = (): string | null => {
        if (info.number) return info.number;
        if (Array.isArray(info.features)) {
            const numberFeature = info.features.find((f: string) =>
                f.toLowerCase().includes('singular') || f.toLowerCase().includes('dual') || f.toLowerCase().includes('plural')
            );
            if (numberFeature) {
                if (numberFeature.toLowerCase().includes('singular')) return 'singular';
                if (numberFeature.toLowerCase().includes('dual')) return 'dual';
                if (numberFeature.toLowerCase().includes('plural')) return 'plural';
            }
        }
        return null;
    };

    const getGender = (): string | null => {
        if (info.gender) return info.gender;
        if (Array.isArray(info.features)) {
            const genderFeature = info.features.find((f: string) =>
                f.toLowerCase().includes('masculine') || f.toLowerCase().includes('feminine')
            );
            if (genderFeature) {
                if (genderFeature.toLowerCase().includes('masculine')) return 'masculine';
                if (genderFeature.toLowerCase().includes('feminine')) return 'feminine';
            }
        }
        return null;
    };

    const getTense = (): string | null => {
        if (info.tense) return info.tense;
        if (Array.isArray(info.features)) {
            const tenseFeature = info.features.find((f: string) =>
                f.toLowerCase().includes('past') || f.toLowerCase().includes('present') || f.toLowerCase().includes('future') || f.toLowerCase().includes('imperative')
            );
            if (tenseFeature) {
                if (tenseFeature.toLowerCase().includes('past')) return 'past';
                if (tenseFeature.toLowerCase().includes('present')) return 'present';
                if (tenseFeature.toLowerCase().includes('future')) return 'future';
                if (tenseFeature.toLowerCase().includes('imperative')) return 'imperative';
            }
        }
        return null;
    };

    const getMood = (): string | null => {
        if (info.mood) return info.mood;
        if (Array.isArray(info.features)) {
            const moodFeature = info.features.find((f: string) =>
                f.toLowerCase().includes('indicative') || f.toLowerCase().includes('subjunctive') || f.toLowerCase().includes('jussive') || f.toLowerCase().includes('imperative')
            );
            if (moodFeature) {
                if (moodFeature.toLowerCase().includes('indicative')) return 'indicative';
                if (moodFeature.toLowerCase().includes('subjunctive')) return 'subjunctive';
                if (moodFeature.toLowerCase().includes('jussive')) return 'jussive';
                if (moodFeature.toLowerCase().includes('imperative')) return 'imperative';
            }
        }
        return null;
    };

    // For verbs, show form + aspect + voice + person + number + tense + mood
    if (posLower === 'verb') {
        const parts: string[] = [];
        const form = info.form;
        const aspect = info.aspect; // perfect, imperfect, or imperative
        const voice = info.voice;
        const person = getPerson() || info.person;
        const number = getNumber() || info.number;
        const gender = getGender() || info.gender;
        const tense = getTense() || info.tense;
        const mood = getMood() || info.mood;

        // Add form first if available (important for understanding verb meaning)
        if (form) {
            const formStr = String(form).toLowerCase();
            if (formStr.match(/^\d+$/)) {
                parts.push(`form ${formStr}`);
            } else if (!formStr.includes('form')) {
                parts.push(`form ${formStr}`);
            } else {
                parts.push(formStr);
            }
        }

        // Add aspect if available (perfect/imperfect/imperative)
        if (aspect) {
            parts.push(aspect);
        }

        // Add voice if available
        if (voice) {
            parts.push(voice);
        }

        // Build descriptive string: "first-person plural" or "masculine plural"
        if (person && number) {
            parts.push(`${person}-person ${number}`);
        } else if (person) {
            parts.push(`${person}-person`);
        } else if (gender && number) {
            parts.push(`${gender} ${number}`);
        } else if (number) {
            parts.push(number);
        } else if (gender) {
            parts.push(gender);
        }

        // Add tense if available
        if (tense) {
            parts.push(`${tense} tense`);
        }

        // Add mood if available
        if (mood) {
            parts.push(mood);
        }

        if (parts.length > 0) {
            return `${partOfSpeech}: ${parts.join(', ')}`;
        }

        // Fallback: just show tense if available
        if (tense) {
            return `${partOfSpeech}: ${tense}`;
        }
    }

    // For other parts of speech, build a simpler format
    const parts: string[] = [];

    if (info.case) {
        parts.push(info.case);
    }
    if (info.definiteness) {
        parts.push(info.definiteness);
    }
    if (info.number) {
        parts.push(info.number);
    }
    if (info.gender) {
        parts.push(info.gender);
    }
    if (info.type) {
        parts.push(info.type);
    }

    if (parts.length > 0) {
        return `${partOfSpeech}: ${parts.join(', ')}`;
    }

    // Default: just show part of speech
    return partOfSpeech;
}
