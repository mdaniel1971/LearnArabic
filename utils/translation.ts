import { GrammarInfo } from "@/types/quran";

/**
 * Cleans up translations by removing unnecessary prepositions
 * for genitive case words (e.g., "of Allah" -> "Allah", "of the worlds" -> "the worlds")
 */
export function cleanTranslation(translation: string, grammarInfo: GrammarInfo | null): string {
    if (!translation) return translation;

    // Check if word is in genitive case
    const isGenitive = grammarInfo?.case === 'genitive' ||
        (Array.isArray(grammarInfo?.features) &&
            grammarInfo.features.some((f: string) =>
                f?.toLowerCase().includes('genitive')));

    if (isGenitive) {
        // Remove "of " prefix if present (e.g., "of Allah" -> "Allah", "of the worlds" -> "the worlds")
        let cleaned = translation.trim();
        const lowerCleaned = cleaned.toLowerCase();

        if (lowerCleaned.startsWith('of ')) {
            cleaned = cleaned.substring(3).trim();
            // Capitalize first letter if it was lowercase (but preserve "the" if present)
            if (cleaned.length > 0 && !cleaned.toLowerCase().startsWith('the ')) {
                cleaned = cleaned.charAt(0).toUpperCase() + cleaned.slice(1);
            }
        }

        return cleaned;
    }

    return translation;
}
