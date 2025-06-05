import 'dart:ui';

class AppColors {
  // Text colors
  static const Color primaryText = Color(0xFF0B0B0B);
  static const Color mutedText = Color(0xFFBFBFBD);

  // Backgrounds & Surfaces
  static const Color backgroundLight = Color(0xFFF8F8F8);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color bubbleUser = Color(0xFFFAFAF8);
  static const Color bubbleAI = Color(0xFFFFFFFF);
  static const Color chipBackground = Color(0xFFFAFAF8);

  // Status / Accent colors
  static const Color accentGreen = Color(0xFF32A069);
  static const Color indicatorIdle = Color(0xFF118569);
  static const Color indicatorActive = Color(0xFF25D27B);

  // Gradients
  static const List<Color> backgroundGradientColors = [
    Color(0xFFFFFFFF), // White
    Color(0xFFFAFAF8), // Near-white
    Color(0xFFF5F5F5), // Light gray
  ];

  static const Color gradientStart = Color(0xFFFFFFFF);
  static const Color gradientMiddle = Color(0xFFFAFAF8);
  static const Color gradientEnd = Color(0xFFF5F5F5);

  // Gradient used in shader
  static const List<Color> dotAIGradientColors = [
    Color(0xFF26C675),
    Color(0xFF0A4254),
  ];
}
