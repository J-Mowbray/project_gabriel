// theme_config.dart
import 'package:flutter/material.dart';

/// AppTheme centralizes all theming for the Gabriel's Star app
/// 
/// The design follows these principles:
/// 1. All colors defined in one place
/// 2. Consistent styles across components
/// 3. Easy toggling between light and dark mode
/// 4. Simple API for accessing theme components
class AppTheme {
  // ========== CORE COLOR PALETTE ==========
  // Main brand colors
  static const Color primaryColor = Color(0xFF2E7EED); // Brand blue
  static const Color secondaryColor = Color(0xFF26A69A); // Teal accent
  
  // Category card colors (these remain the same in both light/dark)
  static const Color resourcesCardColor = Color(0xFF0470C9);
  static const Color supportNetworksCardColor = Color(0xFF66BB6A);
  static const Color typesOfLossCardColor = Color(0xFFBA68C8);
  static const Color personalStoriesCardColor = Color(0xFFFFB74D);
  static const Color supportTipsCardColor = Color(0xFFEF5350);
  static const Color awarenessCardColor = Color(0xFF26A69A);

  // Light theme colors
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF8F8F8);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightTextPrimary = Color(0xFF333333);
  static const Color lightTextSecondary = Color(0xFF757575);
  static const Color lightDivider = Color(0xFFEEEEEE);
  
  // Dark theme colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkCard = Color(0xFF2C2C2C);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFCCCCCC);
  static const Color darkDivider = Color(0xFF424242);

  // ========== HELPER METHODS ==========
  /// Adjusts color opacity
  static Color withAlpha(Color color, double opacity) {
    return color.withAlpha((opacity * 255).round());
  }

  // ========== THEME DATA ==========
  /// Light theme configuration
  static ThemeData get lightTheme {
    return _buildThemeData(
      brightness: Brightness.light,
      backgroundColor: lightBackground,
      surfaceColor: lightSurface,
      cardColor: lightCard,
      textPrimaryColor: lightTextPrimary,
      textSecondaryColor: lightTextSecondary,
      dividerColor: lightDivider,
    );
  }

  /// Dark theme configuration
  static ThemeData get darkTheme {
    return _buildThemeData(
      brightness: Brightness.dark,
      backgroundColor: darkBackground,
      surfaceColor: darkSurface,
      cardColor: darkCard,
      textPrimaryColor: darkTextPrimary,
      textSecondaryColor: darkTextSecondary,
      dividerColor: darkDivider,
    );
  }

  /// Core theme builder that handles both light and dark
  static ThemeData _buildThemeData({
    required Brightness brightness,
    required Color backgroundColor,
    required Color surfaceColor,
    required Color cardColor,
    required Color textPrimaryColor,
    required Color textSecondaryColor,
    required Color dividerColor,
  }) {
    // Build consistent color scheme
    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: secondaryColor,
      onSecondary: Colors.white,
      error: brightness == Brightness.light ? Colors.red.shade700 : Colors.red.shade300,
      onError: Colors.white,
      background: backgroundColor,
      onBackground: textPrimaryColor,
      surface: surfaceColor,
      onSurface: textPrimaryColor,
      outline: brightness == Brightness.light 
          ? withAlpha(Colors.black, 0.12) 
          : withAlpha(Colors.white, 0.12),
    );

    // Build consistent text theme
    final textTheme = TextTheme(
      displayLarge: TextStyle(color: textPrimaryColor, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: textPrimaryColor, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(color: textPrimaryColor, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: textPrimaryColor, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(color: textPrimaryColor, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: textPrimaryColor),
      bodyLarge: TextStyle(color: textPrimaryColor),
      bodyMedium: TextStyle(color: textSecondaryColor),
    );

    // Return complete theme
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      primaryColor: primaryColor,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: cardColor,
      dividerColor: dividerColor,
      textTheme: textTheme,
      
      // AppBar theme - consistent across the app
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      
      // Button themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      
      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceColor,
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: brightness == Brightness.light 
                ? withAlpha(Colors.black, 0.12) 
                : withAlpha(Colors.white, 0.12),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: brightness == Brightness.light 
                ? withAlpha(Colors.black, 0.12) 
                : withAlpha(Colors.white, 0.12),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: primaryColor,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colorScheme.error,
          ),
        ),
        hintStyle: TextStyle(
          color: withAlpha(textPrimaryColor, 0.5),
        ),
      ),
      
      // Card theme
      cardTheme: CardTheme(
        color: cardColor,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.only(bottom: 16),
      ),
    );
  }

  // ========== TEXT STYLE CONVENIENCE METHODS ==========
  /// Style for page titles (large, bold)
  static TextStyle pageTitleStyle(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!;
  }
  
  /// Style for section headings
  static TextStyle sectionHeadingStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!;
  }
  
  /// Style for main body text
  static TextStyle bodyTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!;
  }

  /// Style for secondary/supporting text
  static TextStyle infoTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!;
  }
  
  // ========== COLOR ACCESSORS ==========
  /// Get category card colors by name for consistency
  static Color getCategoryCardColor(String category) {
    switch (category.toLowerCase()) {
      case 'resources':
        return resourcesCardColor;
      case 'support networks':
        return supportNetworksCardColor;
      case 'types of loss':
        return typesOfLossCardColor;
      case 'personal stories':
        return personalStoriesCardColor;
      case 'support tips':
        return supportTipsCardColor;
      case 'raising awareness':
      case 'awareness':
        return awarenessCardColor;
      default:
        return primaryColor;
    }
  }
}