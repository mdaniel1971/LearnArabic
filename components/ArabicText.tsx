import { ReactNode } from 'react';

interface ArabicTextProps {
  children: ReactNode;
  className?: string;
  variant?: 'default' | 'verse' | 'word';
}

/**
 * Reusable component for displaying Arabic text with proper styling
 * Ensures all Arabic text uses Amiri font at 24px with proper RTL direction
 */
export default function ArabicText({ 
  children, 
  className = '', 
  variant = 'default' 
}: ArabicTextProps) {
  const baseClasses = 'arabic';
  const variantClasses = {
    default: '',
    verse: 'arabic-verse',
    word: 'arabic-word',
  };

  return (
    <span 
      className={`${baseClasses} ${variantClasses[variant]} ${className}`}
      lang="ar"
      dir="rtl"
    >
      {children}
    </span>
  );
}

