import 'package:flutter/material.dart';

class AgroTheme {
  static const Color _seedColor = Color(0xFF48B78B);

  static ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seedColor,
      primary: const Color(0xFF1B5E20),
      secondary: const Color(0xFF8D6E63),
      surface: const Color(0xFFF8FAF8),
      secondaryContainer: const Color(0xFFD7E8DE),
      onSecondaryContainer: const Color(0xFF002111),
      errorContainer: const Color(0xFFFFDAD6),
      onErrorContainer: const Color(0xFF410002),
      brightness: Brightness.light,
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    cardTheme: CardThemeData(color: Color(0xFF222521), elevation: 0),
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
      primary: const Color(0xFF81C784),
      onPrimary: const Color(0xFF003310),
      surface: const Color(0xFF1A1C19),
      surfaceContainer: const Color(0xFF222521),
      secondary: const Color(0xFFD7C4A5),
      secondaryContainer: const Color(0xFF1B4D3E),
      onSecondaryContainer: const Color(0xFFB9F3D8),
      errorContainer: const Color(0xFF93000A),
      onErrorContainer: const Color(0xFFFFDAD6),
    ),
  );
}
