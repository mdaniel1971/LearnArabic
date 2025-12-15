"use client";

import { useState } from "react";
import ArabicText from "./ArabicText";
import WordModal from "./WordModal";
import { Word } from "@/types/quran";

interface BismillahDisplayProps {
    words: Word[];
}

function WordButton({ word }: { word: Word }) {
    const [isHovered, setIsHovered] = useState(false);

    return (
        <WordModal word={word}>
            <button
                className="cursor-pointer px-3 py-2 rounded-lg transition-colors duration-150"
                style={{
                    backgroundColor: isHovered ? '#dcfce7' : 'transparent'
                }}
                onMouseEnter={() => setIsHovered(true)}
                onMouseLeave={() => setIsHovered(false)}
            >
                <ArabicText
                    variant="word"
                    className="transition-colors duration-150"
                    style={{ color: isHovered ? '#22c55e' : '#1e293b' }}
                >
                    {word.text_arabic}
                </ArabicText>
            </button>
        </WordModal>
    );
}

export default function BismillahDisplay({ words }: BismillahDisplayProps) {
    if (words.length === 0) {
        return null;
    }

    return (
        <div className="bg-white border border-gray-200 rounded-xl p-6 hover:border-primary-300 transition-colors mb-6">
            <div dir="rtl" className="text-right">
                <div dir="rtl" className="flex flex-wrap gap-2">
                    {words.map((word) => (
                        <WordButton key={word.id} word={word} />
                    ))}
                </div>
            </div>
        </div>
    );
}
