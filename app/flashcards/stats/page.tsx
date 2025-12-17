'use client';

import { useState, useEffect } from 'react';
import Link from 'next/link';
import { ReviewHistory } from '@/types/flashcards';

export default function FlashcardStatsPage() {
  const [stats, setStats] = useState<any>(null);
  const [history, setHistory] = useState<ReviewHistory[]>([]);
  const [loading, setLoading] = useState(true);
  const [timeRange, setTimeRange] = useState<'7' | '30' | '90' | 'all'>('30');

  useEffect(() => {
    loadStats();
    loadHistory();
  }, [timeRange]);

  const loadStats = async () => {
    try {
      const response = await fetch('/api/flashcards/stats');
      if (response.ok) {
        const data = await response.json();
        setStats(data.stats);
      }
    } catch (error) {
      console.error('Error loading stats:', error);
    }
  };

  const loadHistory = async () => {
    try {
      // We'll need to create an API endpoint for this, but for now use review_history
      // For now, just show stats
      setLoading(false);
    } catch (error) {
      console.error('Error loading history:', error);
      setLoading(false);
    }
  };

  const calculateRetentionRate = () => {
    if (!stats) return 0;
    const total = stats.total_cards;
    const mastered = stats.mastered_cards;
    return total > 0 ? Math.round((mastered / total) * 100) : 0;
  };

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="max-w-6xl mx-auto py-8 px-4 sm:px-6 lg:px-8">
        {/* Header */}
        <div className="flex justify-between items-center mb-8">
          <div>
            <h1 className="text-4xl font-bold text-gray-900 mb-2">Statistics</h1>
            <p className="text-gray-600">Track your flashcard learning progress</p>
          </div>
          <Link
            href="/flashcards"
            className="px-4 py-2 bg-gray-200 text-gray-800 rounded-lg hover:bg-gray-300 transition-colors"
          >
            Back to Flashcards
          </Link>
        </div>

        {stats && (
          <div className="space-y-6">
            {/* Overview Stats */}
            <div className="bg-white rounded-lg shadow-md p-6">
              <h2 className="text-2xl font-bold mb-4">Overview</h2>
              <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                <div className="bg-blue-50 rounded-lg p-4">
                  <div className="text-sm text-gray-600 mb-1">Total Cards</div>
                  <div className="text-3xl font-bold text-blue-600">{stats.total_cards}</div>
                </div>
                <div className="bg-green-50 rounded-lg p-4">
                  <div className="text-sm text-gray-600 mb-1">Reviewed Today</div>
                  <div className="text-3xl font-bold text-green-600">{stats.reviewed_today}</div>
                </div>
                <div className="bg-purple-50 rounded-lg p-4">
                  <div className="text-sm text-gray-600 mb-1">Mastered</div>
                  <div className="text-3xl font-bold text-purple-600">{stats.mastered_cards}</div>
                </div>
                <div className="bg-orange-50 rounded-lg p-4">
                  <div className="text-sm text-gray-600 mb-1">Retention Rate</div>
                  <div className="text-3xl font-bold text-orange-600">{calculateRetentionRate()}%</div>
                </div>
              </div>
            </div>

            {/* Performance Metrics */}
            <div className="bg-white rounded-lg shadow-md p-6">
              <h2 className="text-2xl font-bold mb-4">Performance Metrics</h2>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                  <div className="text-sm text-gray-600 mb-2">Average Ease Factor</div>
                  <div className="text-4xl font-bold text-indigo-600">{stats.average_ease_factor.toFixed(2)}</div>
                  <div className="text-xs text-gray-500 mt-1">
                    Higher is better (range: 1.3 - 3.0)
                  </div>
                </div>
                <div>
                  <div className="text-sm text-gray-600 mb-2">New Cards</div>
                  <div className="text-4xl font-bold text-yellow-600">{stats.new_cards}</div>
                  <div className="text-xs text-gray-500 mt-1">
                    Cards not yet reviewed
                  </div>
                </div>
              </div>
            </div>

            {/* Study Streak (placeholder for future) */}
            <div className="bg-white rounded-lg shadow-md p-6">
              <h2 className="text-2xl font-bold mb-4">Study Activity</h2>
              <div className="text-center py-8 text-gray-500">
                <p>Review history and detailed analytics coming soon!</p>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

