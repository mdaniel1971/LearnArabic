/**
 * Add word-by-word translations to existing words in the database
 * 
 * This script uses a comprehensive dictionary of common Arabic words
 * to update the translation_english field for words that currently have null translations.
 * 
 * Currently targets surahs 97-114 (Juz Amma) that were populated without translations.
 */

// Load environment variables from .env.local
import { config } from 'dotenv';
import { resolve } from 'path';

// Load .env.local file
config({ path: resolve(process.cwd(), '.env.local') });

import { createClient } from '@supabase/supabase-js';

// ============================================================================
// Configuration
// ============================================================================

const START_SURAH = 97;
const END_SURAH = 114;

// Comprehensive dictionary of common Arabic words in Juz Amma
// This includes words from surahs 97-114 with their translations
const ARABIC_WORD_DICTIONARY: Record<string, string> = {
  // Common words from An-Nas (114) - with actual database characters
  'قُلۡ': 'Say',
  'قُلْ': 'Say',
  'أَعُوذُ': 'I seek refuge',
  'بِرَبِّ': 'with the Lord',
  'بِرَبِّ': 'with the Lord',
  'النَّاسِ': 'of mankind',
  'ٱلنَّاسِ': 'of mankind',
  'مَلِكِ': 'King',
  'إِلَٰهِ': 'God',
  'شَرِّ': 'evil',
  'الوَسْوَاسِ': 'the whisperer',
  'الخَنَّاسِ': 'the one who withdraws',
  'الَّذِي': 'who',
  'يُوَسْوِسُ': 'whispers',
  'فِي': 'in',
  'صُدُورِ': 'chests',
  'الْجِنَّةِ': 'of jinn',
  'وَالنَّاسِ': 'and mankind',
  
  // Common words from Al-Falaq (113) - with actual database characters
  'قُلْ': 'Say',
  'أَعُوذُ': 'I seek refuge',
  'بِرَبِّ': 'with the Lord',
  'بِرَبِّ': 'with the Lord',
  'الْفَلَقِ': 'the dawn',
  'ٱلۡفَلَقِ': 'the dawn',
  'مِن': 'from',
  'مِنْ': 'from',
  'شَرِّ': 'evil',
  'مَا': 'what',
  'خَلَقَ': 'He created',
  'وَمِن': 'and from',
  'وَمِنْ': 'and from',
  'غَاسِقٍ': 'darkness',
  'إِذَا': 'when',
  'وَقَبَ': 'it enters',
  'وَمِن': 'and from',
  'شَرِّ': 'evil',
  'النَّفَّاثَاتِ': 'the blowers',
  'فِي': 'in',
  'الْعُقَدِ': 'the knots',
  'وَمِن': 'and from',
  'شَرِّ': 'evil',
  'حَاسِدٍ': 'envious',
  'إِذَا': 'when',
  'حَسَدَ': 'he envies',
  
  // Common words from Al-Ikhlas (112) - with actual database characters
  'قُلۡ': 'Say',
  'قُلْ': 'Say',
  'هُوَ': 'He',
  'ٱللَّهُ': 'Allah',
  'اللَّهُ': 'Allah',
  'أَحَدٌ': 'One',
  'ٱلصَّمَدُ': 'the Eternal',
  'الصَّمَدُ': 'the Eternal',
  'لَم': 'not',
  'لَمْ': 'not',
  'يَلِد': 'He begets',
  'يَلِدْ': 'He begets',
  'وَلَم': 'and not',
  'وَلَمْ': 'and not',
  'يُولَد': 'He is begotten',
  'يُولَدْ': 'He is begotten',
  'وَلَم': 'and not',
  'يَكُن': 'there is',
  'لَّهُ': 'for Him',
  'لَهُ': 'for Him',
  'كُفُوًا': 'equal',
  'أَحَدٌ': 'anyone',
  
  // Common words from Al-Masad (111) - with actual database characters
  'تَبَّتۡ': 'Perish',
  'تَبَّتْ': 'Perish',
  'يَدَا': 'hands',
  'يَدَآ': 'hands',
  'أَبِي': 'father',
  'لَهَبٍ': 'flame',
  'وَّتَبَّ': 'and perish',
  'مَا': 'what',
  'أَغْنَىٰ': 'he gained',
  'عَنْهُ': 'from him',
  'مَالُهُ': 'his wealth',
  'وَمَا': 'and what',
  'كَسَبَ': 'he earned',
  'سَيَصْلَىٰ': 'he will burn',
  'نَارًا': 'fire',
  'ذَاتَ': 'of',
  'لَهَبٍ': 'flame',
  'وَامْرَأَتُهُ': 'and his wife',
  'حَمَّالَةَ': 'carrier',
  'الْحَطَبِ': 'of firewood',
  'فِي': 'in',
  'جِيدِهَا': 'her neck',
  'حَبْلٌ': 'a rope',
  'مِّن': 'of',
  'مِن': 'of',
  'مَسَدٍ': 'palm fiber',
  
  // Common particles and prepositions - with variations
  'وَ': 'and',
  'فَ': 'then/so',
  'بِ': 'with/in',
  'لِ': 'for/to',
  'إِلَىٰ': 'to',
  'عَلَىٰ': 'on',
  'عَنْ': 'from/about',
  'فِي': 'in',
  'مِنْ': 'from',
  'مِن': 'from',
  'إِنَّ': 'indeed',
  'أَنَّ': 'that',
  'لَا': 'no/not',
  'لَمْ': 'not (past)',
  'لَم': 'not (past)',
  'لَنْ': 'will not',
  'مَا': 'what/not',
  'هَلْ': 'is it',
  'أَ': 'is',
  'نَصۡرُ': 'help',
  'جَآءَ': 'came',
  
  // Common pronouns and demonstratives
  'هُوَ': 'he',
  'هِيَ': 'she',
  'هُمْ': 'they',
  'أَنَا': 'I',
  'نَحْنُ': 'we',
  'أَنْتَ': 'you (m)',
  'أَنْتِ': 'you (f)',
  'أَنْتُمَا': 'you two',
  'أَنْتُمْ': 'you (pl)',
  'هَٰذَا': 'this',
  'هَٰذِهِ': 'this (f)',
  'ذَٰلِكَ': 'that',
  'الَّذِي': 'who/which',
  'الَّتِي': 'who/which (f)',
  'الَّذِينَ': 'those who',
  
  // Common verbs
  'كَانَ': 'he was',
  'يَكُونُ': 'he is',
  'قَالَ': 'he said',
  'يَقُولُ': 'he says',
  'جَاءَ': 'he came',
  'يَأْتِي': 'he comes',
  'ذَهَبَ': 'he went',
  'يَذْهَبُ': 'he goes',
  'عَلِمَ': 'he knew',
  'يَعْلَمُ': 'he knows',
  'رَأَىٰ': 'he saw',
  'يَرَىٰ': 'he sees',
  
  // Common nouns
  'اللَّهُ': 'Allah',
  'رَبٌّ': 'Lord',
  'رَبِّ': 'Lord (genitive)',
  'رَبُّ': 'Lord (nominative)',
  'رَبَّ': 'Lord (accusative)',
  'نَبِيٌّ': 'prophet',
  'كِتَابٌ': 'book',
  'يَوْمٌ': 'day',
  'يَوْمِ': 'day (genitive)',
  'نَارٌ': 'fire',
  'جَنَّةٌ': 'paradise',
  'نَفْسٌ': 'soul',
  'قَلْبٌ': 'heart',
  'عَيْنٌ': 'eye',
  'يَدٌ': 'hand',
  'رِجْلٌ': 'foot',
  
  // More words from various surahs in Juz Amma
  'إِذَا': 'when',
  'جَاءَ': 'came',
  'جَآءَ': 'came',
  'نَصۡرُ': 'help',
  'نَصْرُ': 'help',
  'اللَّهِ': 'of Allah',
  'وَالْفَتْحِ': 'and the victory',
  'وَرَأَيْتَ': 'and you see',
  'النَّاسَ': 'the people',
  'يَدْخُلُونَ': 'entering',
  'فِي': 'in',
  'دِينِ': 'religion',
  'اللَّهِ': 'of Allah',
  'أَفْوَاجًا': 'in multitudes',
  'فَسَبِّحْ': 'then glorify',
  'بِحَمْدِ': 'with praise',
  'رَبِّكَ': 'of your Lord',
  'وَاسْتَغْفِرْهُ': 'and seek forgiveness from Him',
  'إِنَّهُ': 'indeed He',
  'كَانَ': 'was',
  'تَوَّابًا': 'Oft-Forgiving',
  
  // Add normalized versions of common words
  'قل': 'Say',
  'الله': 'Allah',
  'رب': 'Lord',
  'ناس': 'mankind',
  'شر': 'evil',
  'من': 'from',
  'في': 'in',
  'ما': 'what',
  'لا': 'no/not',
  'و': 'and',
  'ف': 'then',
  'ب': 'with/in',
  'ل': 'for/to',
  'هو': 'he',
  'هي': 'she',
  'هم': 'they',
  'انا': 'I',
  'نحن': 'we',
  
  // Words from Al-Qadr (97)
  'إِنَّا': 'indeed we',
  'إِنَّآ': 'indeed we',
  'أَنزَلۡنَٰهُ': 'We sent it down',
  'أَنزَلْنَاهُ': 'We sent it down',
  'لَيۡلَةِ': 'night',
  'لَيْلَةِ': 'night',
  'الْقَدْرِ': 'of Decree',
  'وَمَا': 'and what',
  'أَدْرَىٰكَ': 'will make you know',
  'هِيَ': 'it',
  'خَيْرٌ': 'better',
  'مِّن': 'than',
  'أَلْفِ': 'thousand',
  'شَهْرٍ': 'month',
  'تَنَزَّلُ': 'descend',
  'الْمَلَائِكَةُ': 'the angels',
  'وَالرُّوحُ': 'and the Spirit',
  'بِإِذْنِ': 'by permission',
  'رَبِّهِم': 'of their Lord',
  'مِّن': 'from',
  'كُلِّ': 'every',
  'أَمْرٍ': 'matter',
  'سَلَامٌ': 'peace',
  'هِيَ': 'it',
  'حَتَّىٰ': 'until',
  'مَطْلَعِ': 'rising',
  'الْفَجْرِ': 'of dawn',
  
  // Words from Al-Bayyinah (98)
  'لَمۡ': 'not',
  'يَكُنِ': 'were',
  'الَّذِينَ': 'those who',
  'ٱلَّذِينَ': 'those who',
  'كَفَرُوا': 'disbelieved',
  'مِن': 'from',
  'أَهْلِ': 'people',
  'الْكِتَابِ': 'of the Book',
  'وَالْمُشْرِكِينَ': 'and the polytheists',
  'مُنفَكِّينَ': 'to be free',
  'حَتَّىٰ': 'until',
  'تَأْتِيَهُمُ': 'comes to them',
  'الْبَيِّنَةُ': 'the clear evidence',
  'رَسُولٌ': 'a messenger',
  'مِّن': 'from',
  'اللَّهِ': 'Allah',
  'يَتْلُو': 'recites',
  'صُحُفًا': 'pages',
  'مُّطَهَّرَةً': 'purified',
  'فِيهَا': 'in which',
  'كُتُبٌ': 'books',
  'قَيِّمَةٌ': 'correct',
  'وَمَا': 'and not',
  'تَفَرَّقَ': 'became divided',
  'الَّذِينَ': 'those who',
  'أُوتُوا': 'were given',
  'الْكِتَابَ': 'the Book',
  'إِلَّا': 'except',
  'مِن': 'after',
  'بَعْدِ': 'after',
  'مَا': 'what',
  'جَاءَتْهُمُ': 'came to them',
  'الْبَيِّنَةُ': 'the clear evidence',
  'وَمَا': 'and not',
  'أُمِرُوا': 'they were commanded',
  'إِلَّا': 'except',
  'لِيَعْبُدُوا': 'to worship',
  'اللَّهَ': 'Allah',
  'مُخْلِصِينَ': 'sincere',
  'لَهُ': 'to Him',
  'الدِّينَ': 'the religion',
  'حُنَفَاءَ': 'upright',
  'وَيُقِيمُوا': 'and establish',
  'الصَّلَاةَ': 'prayer',
  'وَيُؤْتُوا': 'and give',
  'الزَّكَاةَ': 'zakah',
  'وَذَٰلِكَ': 'and that',
  'دِينُ': 'religion',
  'الْقَيِّمَةِ': 'the correct',
  
  // Words from Az-Zalzalah (99)
  'إِذَا': 'when',
  'زُلۡزِلَتِ': 'is shaken',
  'زُلْزِلَتِ': 'is shaken',
  'ٱلۡأَرۡضُ': 'the earth',
  'الْأَرْضُ': 'the earth',
  'زِلْزَالَهَا': 'its earthquake',
  'وَأَخْرَجَتِ': 'and brings forth',
  'الْأَرْضُ': 'the earth',
  'أَثْقَالَهَا': 'its burdens',
  'وَقَالَ': 'and says',
  'الْإِنسَانُ': 'man',
  'مَا': 'what',
  'لَهَا': 'with it',
  'يَوْمَئِذٍ': 'on that Day',
  'تُحَدِّثُ': 'will relate',
  'أَخْبَارَهَا': 'its news',
  'بِأَنَّ': 'that',
  'رَبَّكَ': 'your Lord',
  'أَوْحَىٰ': 'has inspired',
  'لَهَا': 'to it',
  'يَوْمَئِذٍ': 'on that Day',
  'يَصْدُرُ': 'will come forth',
  'النَّاسُ': 'people',
  'أَشْتَاتًا': 'in groups',
  'لِيُرَوْا': 'to be shown',
  'أَعْمَالَهُمْ': 'their deeds',
  'فَمَن': 'so whoever',
  'يَعْمَلْ': 'does',
  'مِثْقَالَ': 'weight',
  'ذَرَّةٍ': 'of an atom',
  'خَيْرًا': 'good',
  'يَرَهُ': 'will see it',
  'وَمَن': 'and whoever',
  'يَعْمَلْ': 'does',
  'مِثْقَالَ': 'weight',
  'ذَرَّةٍ': 'of an atom',
  'شَرًّا': 'evil',
  'يَرَهُ': 'will see it',
  
  // Words from Al-Aadiyaat (100)
  'وَٱلۡعَٰدِيَٰتِ': 'by the runners',
  'وَالْعَادِيَاتِ': 'by the runners',
  'ضَبۡحٗا': 'panting',
  'ضَبْحًا': 'panting',
  'فَٱلۡمُورِيَٰتِ': 'then the producers',
  'فَالْمُورِيَاتِ': 'then the producers',
  'قَدْحًا': 'sparks',
  'فَالْمُغِيرَاتِ': 'then the raiders',
  'صُبْحًا': 'at dawn',
  'فَأَثَرْنَ': 'then they left',
  'بِهِ': 'with it',
  'نَقْعًا': 'dust',
  'فَوَسَطْنَ': 'then they penetrated',
  'بِهِ': 'with it',
  'جَمْعًا': 'a group',
  'إِنَّ': 'indeed',
  'الْإِنسَانَ': 'man',
  'لِرَبِّهِ': 'to his Lord',
  'لَكَنُودٌ': 'is ungrateful',
  'وَإِنَّهُ': 'and indeed he',
  'عَلَىٰ': 'to',
  'ذَٰلِكَ': 'that',
  'لَشَهِيدٌ': 'is a witness',
  'وَإِنَّهُ': 'and indeed he',
  'لِحُبِّ': 'for love',
  'الْخَيْرِ': 'of wealth',
  'لَشَدِيدٌ': 'is intense',
  'أَفَلَا': 'does he not',
  'يَعْلَمُ': 'know',
  'إِذَا': 'when',
  'بُعْثِرَ': 'is scattered',
  'مَا': 'what',
  'فِي': 'in',
  'الْقُبُورِ': 'the graves',
  'وَحُصِّلَ': 'and is brought forth',
  'مَا': 'what',
  'فِي': 'in',
  'الصُّدُورِ': 'the chests',
  'إِنَّ': 'indeed',
  'رَبَّهُم': 'their Lord',
  'بِهِمْ': 'of them',
  'يَوْمَئِذٍ': 'on that Day',
  'لَخَبِيرٌ': 'is All-Aware',
  
  // Words from Al-Qaari'ah (101)
  'ٱلۡقَارِعَةُ': 'the Striking Calamity',
  'الْقَارِعَةُ': 'the Striking Calamity',
  'مَا': 'what',
  'الْقَارِعَةُ': 'the Striking Calamity',
  'وَمَا': 'and what',
  'أَدْرَىٰكَ': 'will make you know',
  'مَا': 'what',
  'الْقَارِعَةُ': 'the Striking Calamity',
  'يَوْمَ': 'Day',
  'يَكُونُ': 'will be',
  'النَّاسُ': 'people',
  'كَالْفَرَاشِ': 'like moths',
  'الْمَبْثُوثِ': 'dispersed',
  'وَتَكُونُ': 'and will be',
  'الْجِبَالُ': 'the mountains',
  'كَالْعِهْنِ': 'like wool',
  'الْمَنفُوشِ': 'fluffed up',
  'فَأَمَّا': 'then as for',
  'مَن': 'whoever',
  'ثَقُلَتْ': 'are heavy',
  'مَوَازِينُهُ': 'his scales',
  'فَهُوَ': 'then he',
  'فِي': 'in',
  'عِيشَةٍ': 'life',
  'رَّاضِيَةٍ': 'satisfying',
  'وَأَمَّا': 'and as for',
  'مَن': 'whoever',
  'خَفَّتْ': 'are light',
  'مَوَازِينُهُ': 'his scales',
  'فَأُمُّهُ': 'then his mother',
  'هَاوِيَةٌ': 'is an abyss',
  'وَمَا': 'and what',
  'أَدْرَىٰكَ': 'will make you know',
  'مَا': 'what',
  'هِيَهْ': 'it',
  'نَارٌ': 'fire',
  'حَامِيَةٌ': 'blazing',
  
  // Words from At-Takaathur (102)
  'أَلۡهَىٰكُمُ': 'has distracted you',
  'أَلْهَاكُمُ': 'has distracted you',
  'التَّكَاثُرُ': 'competition',
  'حَتَّىٰ': 'until',
  'زُرْتُمُ': 'you visit',
  'الْمَقَابِرَ': 'the graves',
  'كَلَّا': 'no',
  'سَوْفَ': 'soon',
  'تَعْلَمُونَ': 'you will know',
  'ثُمَّ': 'then',
  'كَلَّا': 'no',
  'سَوْفَ': 'soon',
  'تَعْلَمُونَ': 'you will know',
  'كَلَّا': 'no',
  'لَوْ': 'if',
  'تَعْلَمُونَ': 'you know',
  'عِلْمَ': 'knowledge',
  'الْيَقِينِ': 'of certainty',
  'لَتَرَوُنَّ': 'you will surely see',
  'الْجَحِيمَ': 'Hellfire',
  'ثُمَّ': 'then',
  'لَتَرَوُنَّهَا': 'you will surely see it',
  'عَيْنَ': 'with the eye',
  'الْيَقِينِ': 'of certainty',
  'ثُمَّ': 'then',
  'لَتُسْأَلُنَّ': 'you will surely be asked',
  'يَوْمَئِذٍ': 'on that Day',
  'عَنِ': 'about',
  'النَّعِيمِ': 'the favors',
  
  // Words from Al-Asr (103)
  'وَالْعَصْرِ': 'by time',
  'إِنَّ': 'indeed',
  'الْإِنسَانَ': 'man',
  'لَفِي': 'is in',
  'خُسْرٍ': 'loss',
  'إِلَّا': 'except',
  'الَّذِينَ': 'those who',
  'آمَنُوا': 'believed',
  'وَعَمِلُوا': 'and did',
  'الصَّالِحَاتِ': 'righteous deeds',
  'وَتَوَاصَوْا': 'and advised',
  'بِالْحَقِّ': 'with truth',
  'وَتَوَاصَوْا': 'and advised',
  'بِالصَّبْرِ': 'with patience',
  
  // Words from Al-Humazah (104)
  'وَيْلٌ': 'woe',
  'لِّكُلِّ': 'to every',
  'هُمَزَةٍ': 'slanderer',
  'لُّمَزَةٍ': 'backbiter',
  'الَّذِي': 'who',
  'جَمَعَ': 'collected',
  'مَالًا': 'wealth',
  'وَعَدَّدَهُ': 'and counted it',
  'يَحْسَبُ': 'thinks',
  'أَنَّ': 'that',
  'مَالَهُ': 'his wealth',
  'أَخْلَدَهُ': 'will make him immortal',
  'كَلَّا': 'no',
  'لَيُنبَذَنَّ': 'he will surely be thrown',
  'فِي': 'into',
  'الْحُطَمَةِ': 'the Crusher',
  'وَمَا': 'and what',
  'أَدْرَىٰكَ': 'will make you know',
  'مَا': 'what',
  'الْحُطَمَةُ': 'the Crusher',
  'نَارُ': 'fire',
  'اللَّهِ': 'of Allah',
  'الْمُوقَدَةُ': 'ignited',
  'الَّتِي': 'which',
  'تَطَّلِعُ': 'mounts up',
  'عَلَى': 'over',
  'الْأَفْئِدَةِ': 'the hearts',
  'إِنَّهَا': 'indeed it',
  'عَلَيْهِم': 'upon them',
  'مُّؤْصَدَةٌ': 'closed',
  'فِي': 'in',
  'عَمَدٍ': 'extended',
  'مُّمَدَّدَةٍ': 'columns',
  
  // Words from Al-Fil (105)
  'أَلَمْ': 'have you not',
  'تَرَ': 'seen',
  'كَيْفَ': 'how',
  'فَعَلَ': 'did',
  'رَبُّكَ': 'your Lord',
  'بِأَصْحَابِ': 'with the companions',
  'الْفِيلِ': 'of the elephant',
  'أَلَمْ': 'have you not',
  'يَجْعَلْ': 'make',
  'كَيْدَهُمْ': 'their plan',
  'فِي': 'in',
  'تَضْلِيلٍ': 'error',
  'وَأَرْسَلَ': 'and sent',
  'عَلَيْهِمْ': 'upon them',
  'طَيْرًا': 'birds',
  'أَبَابِيلَ': 'in flocks',
  'تَرْمِيهِم': 'striking them',
  'بِحِجَارَةٍ': 'with stones',
  'مِّن': 'of',
  'سِجِّيلٍ': 'hard clay',
  'فَجَعَلَهُمْ': 'and made them',
  'كَعَصْفٍ': 'like straw',
  'مَّأْكُولٍ': 'eaten',
  
  // Words from Quraysh (106)
  'لِإِيلَافِ': 'for the accustomed',
  'قُرَيْشٍ': 'Quraysh',
  'إِيلَافِهِمْ': 'their accustomed',
  'رِحْلَةَ': 'journey',
  'الشِّتَاءِ': 'of winter',
  'وَالصَّيْفِ': 'and summer',
  'فَلْيَعْبُدُوا': 'let them worship',
  'رَبَّ': 'Lord',
  'هَٰذَا': 'this',
  'الْبَيْتِ': 'House',
  'الَّذِي': 'who',
  'أَطْعَمَهُم': 'fed them',
  'مِّن': 'from',
  'جُوعٍ': 'hunger',
  'وَآمَنَهُم': 'and secured them',
  'مِّن': 'from',
  'خَوْفٍ': 'fear',
  
  // Words from Al-Maa'un (107)
  'أَرَأَيْتَ': 'have you seen',
  'الَّذِي': 'the one who',
  'يُكَذِّبُ': 'denies',
  'بِالدِّينِ': 'the recompense',
  'فَذَٰلِكَ': 'then that',
  'الَّذِي': 'is the one who',
  'يَدُعُّ': 'repels',
  'الْيَتِيمَ': 'the orphan',
  'وَلَا': 'and does not',
  'يَحُضُّ': 'encourage',
  'عَلَىٰ': 'on',
  'طَعَامِ': 'feeding',
  'الْمِسْكِينِ': 'the poor',
  'فَوَيْلٌ': 'so woe',
  'لِّلْمُصَلِّينَ': 'to those who pray',
  'الَّذِينَ': 'who',
  'هُمْ': 'they',
  'عَن': 'from',
  'صَلَاتِهِمْ': 'their prayer',
  'سَاهُونَ': 'unmindful',
  'الَّذِينَ': 'who',
  'هُمْ': 'they',
  'يُرَاءُونَ': 'show off',
  'وَيَمْنَعُونَ': 'and prevent',
  'الْمَاعُونَ': 'the small kindnesses',
  
  // Words from Al-Kawthar (108)
  'إِنَّا': 'indeed we',
  'أَعْطَيْنَاكَ': 'have given you',
  'الْكَوْثَرَ': 'al-Kawthar',
  'فَصَلِّ': 'so pray',
  'لِرَبِّكَ': 'to your Lord',
  'وَانْحَرْ': 'and sacrifice',
  'إِنَّ': 'indeed',
  'شَانِئَكَ': 'your hater',
  'هُوَ': 'he',
  'الْأَبْتَرُ': 'the cut off',
  
  // Words from Al-Kaafiroon (109)
  'قُلْ': 'Say',
  'يَا': 'O',
  'أَيُّهَا': 'you',
  'الْكَافِرُونَ': 'disbelievers',
  'لَا': 'I do not',
  'أَعْبُدُ': 'worship',
  'مَا': 'what',
  'تَعْبُدُونَ': 'you worship',
  'وَلَا': 'and you do not',
  'أَنتُمْ': 'you',
  'عَابِدُونَ': 'worshippers',
  'مَا': 'what',
  'أَعْبُدُ': 'I worship',
  'وَلَا': 'and I will not',
  'أَنَا': 'I',
  'عَابِدٌ': 'a worshipper',
  'مَّا': 'what',
  'عَبَدتُّمْ': 'you have worshipped',
  'وَلَا': 'and you will not',
  'أَنتُمْ': 'you',
  'عَابِدُونَ': 'worshippers',
  'مَا': 'what',
  'أَعْبُدُ': 'I worship',
  'لَكُمْ': 'for you',
  'دِينُكُمْ': 'your religion',
  'وَلِيَ': 'and for me',
  'دِينِي': 'my religion',
  
  // Add more common words as needed
};

// ============================================================================
// Helper Functions
// ============================================================================

/**
 * Get translation for an Arabic word from the dictionary
 */
function getWordTranslation(arabicWord: string): string | null {
  // Try exact match first (with diacritics)
  if (ARABIC_WORD_DICTIONARY[arabicWord]) {
    return ARABIC_WORD_DICTIONARY[arabicWord];
  }
  
  const normalized = normalizeArabic(arabicWord);
  
  // Try normalized match (without diacritics)
  if (ARABIC_WORD_DICTIONARY[normalized]) {
    return ARABIC_WORD_DICTIONARY[normalized];
  }
  
  // Try matching without definite article (with diacritics)
  if (arabicWord.startsWith('ال') || arabicWord.startsWith('وَال') || arabicWord.startsWith('بِال') || arabicWord.startsWith('فَال')) {
    let withoutAl = arabicWord;
    if (arabicWord.startsWith('وَال')) withoutAl = arabicWord.substring(2);
    else if (arabicWord.startsWith('بِال')) withoutAl = arabicWord.substring(3);
    else if (arabicWord.startsWith('فَال')) withoutAl = arabicWord.substring(3);
    else if (arabicWord.startsWith('ال')) withoutAl = arabicWord.substring(2);
    
    if (ARABIC_WORD_DICTIONARY[withoutAl] || ARABIC_WORD_DICTIONARY[normalizeArabic(withoutAl)]) {
      const translation = ARABIC_WORD_DICTIONARY[withoutAl] || ARABIC_WORD_DICTIONARY[normalizeArabic(withoutAl)];
      return `the ${translation}`;
    }
  }
  
  // Try matching normalized without definite article
  if (normalized.startsWith('ال') && normalized.length > 2) {
    const withoutAl = normalized.substring(2);
    if (ARABIC_WORD_DICTIONARY[withoutAl]) {
      return `the ${ARABIC_WORD_DICTIONARY[withoutAl]}`;
    }
  }
  
  // Try matching common prefixes (with diacritics)
  const prefixes = [
    { pattern: /^بِ/, translation: 'with/in' },
    { pattern: /^فِي/, translation: 'in' },
    { pattern: /^لِ/, translation: 'for/to' },
    { pattern: /^إِلَىٰ/, translation: 'to' },
    { pattern: /^عَلَىٰ/, translation: 'on' },
    { pattern: /^عَنْ/, translation: 'from/about' },
    { pattern: /^مِنْ/, translation: 'from' },
    { pattern: /^وَ/, translation: 'and' },
    { pattern: /^فَ/, translation: 'then/so' },
  ];
  
  for (const prefix of prefixes) {
    const match = arabicWord.match(prefix.pattern);
    if (match) {
      const withoutPrefix = arabicWord.substring(match[0].length);
      if (ARABIC_WORD_DICTIONARY[withoutPrefix] || ARABIC_WORD_DICTIONARY[normalizeArabic(withoutPrefix)]) {
        const wordTranslation = ARABIC_WORD_DICTIONARY[withoutPrefix] || ARABIC_WORD_DICTIONARY[normalizeArabic(withoutPrefix)];
        return `${prefix.translation} ${wordTranslation}`;
      }
    }
  }
  
  // Try normalized prefixes
  const normalizedPrefixes = ['ب', 'ف', 'ل', 'إلى', 'على', 'عن', 'من', 'و', 'ف'];
  for (let i = 0; i < normalizedPrefixes.length; i++) {
    const prefix = normalizedPrefixes[i];
    if (normalized.startsWith(prefix) && normalized.length > prefix.length) {
      const withoutPrefix = normalized.substring(prefix.length);
      if (ARABIC_WORD_DICTIONARY[withoutPrefix]) {
        const prefixTranslation = prefixes[i]?.translation || prefix;
        return `${prefixTranslation} ${ARABIC_WORD_DICTIONARY[withoutPrefix]}`;
      }
    }
  }
  
  return null;
}

/**
 * Normalize Arabic text for matching (remove diacritics for comparison)
 */
function normalizeArabic(text: string): string {
  return text
    .replace(/[\u064B-\u065F\u0670]/g, '') // Remove diacritics
    .replace(/[\u200B-\u200D\uFEFF]/g, '') // Remove zero-width characters
    .trim();
}

// ============================================================================
// Main Processing Function
// ============================================================================

async function updateWordTranslations() {
  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

  if (!supabaseUrl || !supabaseKey) {
    console.error('❌ Missing environment variables:');
    console.error('   NEXT_PUBLIC_SUPABASE_URL:', supabaseUrl ? '✓' : '✗');
    console.error('   SUPABASE_SERVICE_ROLE_KEY:', supabaseKey ? '✓' : '✗');
    process.exit(1);
  }

  const supabase = createClient(supabaseUrl, supabaseKey);

  console.log('🔄 Starting word translation update for surahs 97-114...\n');

  let totalUpdated = 0;
  let totalSkipped = 0;

  for (let surahNumber = START_SURAH; surahNumber <= END_SURAH; surahNumber++) {
    console.log(`📖 Processing Surah ${surahNumber}...`);

    try {
      // Get surah ID first
      const { data: surah, error: surahError } = await supabase
        .from('surahs')
        .select('id')
        .eq('surah_number', surahNumber)
        .single();

      if (surahError || !surah) {
        console.error(`  ❌ Error fetching surah ${surahNumber}: ${surahError?.message || 'Not found'}`);
        continue;
      }

      // Get all verses for this surah with their words
      const { data: verses, error: versesError } = await supabase
        .from('verses')
        .select(`
          id,
          verse_number,
          text_arabic,
          surah_id,
          words (
            id,
            word_position,
            text_arabic,
            translation_english
          )
        `)
        .eq('surah_id', surah.id);

      if (versesError) {
        console.error(`  ❌ Error fetching verses: ${versesError.message}`);
        continue;
      }

      if (!verses || verses.length === 0) {
        console.log(`  ⚠️  No verses found for surah ${surahNumber}`);
        continue;
      }

      // Process each verse
      let surahUpdated = 0;
      let surahSkipped = 0;
      
      for (const verse of verses) {
        const words = (verse as any).words || [];
        
        // Update words with translations from dictionary
        for (const word of words) {
          // Skip if translation already exists
          if (word.translation_english) {
            surahSkipped++;
            totalSkipped++;
            continue;
          }

          // Get translation from dictionary
          const translation = getWordTranslation(word.text_arabic);
          
          if (translation) {
            // Update the word
            const { error: updateError } = await supabase
              .from('words')
              .update({ translation_english: translation })
              .eq('id', word.id);

            if (updateError) {
              console.error(`  ⚠️  Error updating word ${word.id}: ${updateError.message}`);
              surahSkipped++;
              totalSkipped++;
            } else {
              surahUpdated++;
              totalUpdated++;
            }
          } else {
            // Log first few unmatched words for debugging
            if (surahSkipped < 3) {
              console.log(`  🔍 No translation found for: "${word.text_arabic}" (normalized: "${normalizeArabic(word.text_arabic)}")`);
            }
            surahSkipped++;
            totalSkipped++;
          }
        }
      }
      
      if (surahUpdated > 0) {
        console.log(`  ✅ Updated ${surahUpdated} words, skipped ${surahSkipped} words`);
      } else {
        console.log(`  ⚠️  No translations found for ${surahSkipped} words in this surah`);
      }

      console.log(`  ✅ Surah ${surahNumber} processed`);
    } catch (error: any) {
      console.error(`  ❌ Error processing surah ${surahNumber}:`, error.message);
    }
  }

  console.log(`\n📊 Summary:`);
  console.log(`   ✅ Updated: ${totalUpdated} words`);
  console.log(`   ⏭️  Skipped: ${totalSkipped} words (already had translations or could not determine)`);
  console.log(`\n✨ Translation update complete!`);
}

// ============================================================================
// Run Script
// ============================================================================

updateWordTranslations()
  .then(() => {
    console.log('\n🎉 Script completed successfully!');
    process.exit(0);
  })
  .catch((error) => {
    console.error('\n💥 Fatal error:', error);
    process.exit(1);
  });

