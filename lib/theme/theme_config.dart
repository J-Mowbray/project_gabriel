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
  /// Primary brand color - main blue used throughout the app
  static const Color primaryColor = Color(0xFF2E7EED); // Brand blue
  
  /// Secondary brand color - red accent for complementary UI elements
  static const Color secondaryColor = Color.fromARGB(255, 255, 0, 0); // Teal accent
  
  // Category-specific colors for navigation cards and section headers
  /// Blue color used for the Resources section UI elements
  static const Color resourcesCardColor = Color(0xFF0470C9);
  
  /// Green color used for the Support Networks section UI elements
  static const Color supportNetworksCardColor = Color(0xFF66BB6A);
  
  /// Purple color used for the Types of Loss section UI elements
  static const Color typesOfLossCardColor = Color(0xFFBA68C8);
  
  /// Orange color used for the Personal Stories section UI elements
  static const Color personalStoriesCardColor = Color(0xFFFFB74D);
  
  /// Red color used for the Support Tips section UI elements
  static const Color supportTipsCardColor = Color(0xFFEF5350);
  
  /// Teal color used for the Awareness section UI elements
  static const Color awarenessCardColor = Color(0xFF26A69A);

  // Light theme colors for the app's light mode
  /// Light blue background color for light theme screens
  static const Color lightBackground = Color.fromARGB(255, 157, 234, 255);
  
  /// Off-white surface color for light theme containers
  static const Color lightSurface = Color(0xFFF8F8F8);
  
  /// White card color for light theme cards and elevated surfaces
  static const Color lightCard = Color(0xFFFFFFFF);
  
  /// Dark grey primary text color for light theme
  static const Color lightTextPrimary = Color(0xFF333333);
  
  /// Medium grey secondary text color for light theme
  static const Color lightTextSecondary = Color(0xFF757575);
  
  /// Light grey divider color for light theme separators
  static const Color lightDivider = Color(0xFFEEEEEE);
  
  // Dark theme colors for the app's dark mode
  /// Deep dark background color for dark theme screens
  static const Color darkBackground = Color(0xFF121212);
  
  /// Slightly lighter surface color for dark theme containers
  static const Color darkSurface = Color(0xFF1E1E1E);
  
  /// Dark grey card color for dark theme cards and elevated surfaces
  static const Color darkCard = Color(0xFF2C2C2C);
  
  /// White primary text color for dark theme
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  
  /// Light grey secondary text color for dark theme
  static const Color darkTextSecondary = Color(0xFFCCCCCC);
  
  /// Dark grey divider color for dark theme separators
  static const Color darkDivider = Color(0xFF424242);

  // ========== HELPER METHODS ==========
  /// Adjusts color opacity to create transparent or semi-transparent versions
  ///
  /// This helper applies a specified level of transparency to a color, making
  /// it useful for creating overlays, shadows, or muted background variations.
  ///
  /// Parameters:
  ///   color - The base color to adjust
  ///   opacity - Target opacity value between 0.0 (transparent) and 1.0 (opaque)
  ///
  /// Returns:
  ///   A new Color with the same RGB values but adjusted alpha channel
  static Color withAlpha(Color color, double opacity) {
    return color.withAlpha((opacity * 255).round());
  }

  // ========== THEME DATA ==========
  /// Light theme configuration for the app
  ///
  /// Provides a complete ThemeData object configured for light mode,
  /// including color scheme, text styles, and component themes.
  ///
  /// Returns:
  ///   ThemeData object ready for use in MaterialApp theme property
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

  /// Dark theme configuration for the app
  ///
  /// Provides a complete ThemeData object configured for dark mode,
  /// including color scheme, text styles, and component themes.
  ///
  /// Returns:
  ///   ThemeData object ready for use in MaterialApp darkTheme property
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

  /// Core theme builder that handles both light and dark theme configuration
  ///
  /// This private method centralizes theme creation logic, ensuring consistency
  /// between light and dark themes while allowing for mode-specific adjustments.
  ///
  /// Parameters:
  ///   brightness - Brightness.light or Brightness.dark to set the base mode
  ///   backgroundColor - Main screen background color
  ///   surfaceColor - Color for surfaces like input fields and dialogs
  ///   cardColor - Color for elevated card components
  ///   textPrimaryColor - Color for primary text content
  ///   textSecondaryColor - Color for secondary/supporting text
  ///   dividerColor - Color for dividers and separators
  ///
  /// Returns:
  ///   Configured ThemeData object with all component themes set
  static ThemeData _buildThemeData({
    required Brightness brightness,
    required Color backgroundColor,
    required Color surfaceColor,
    required Color cardColor,
    required Color textPrimaryColor,
    required Color textSecondaryColor,
    required Color dividerColor,
  }) {
    // Build consistent color scheme based on the brightness mode
    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: secondaryColor,
      onSecondary: Colors.white,
      error: brightness == Brightness.light ? Colors.red.shade700 : Colors.red.shade300,
      onError: Colors.white,
      surface: surfaceColor,
      onSurface: textPrimaryColor,
      outline: brightness == Brightness.light 
          ? withAlpha(Colors.black, 0.12) 
          : withAlpha(Colors.white, 0.12),
    );

    // Configure text theme with consistent styling across the app
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

    // Build and return the complete theme configuration
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      primaryColor: primaryColor,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: cardColor,
      dividerColor: dividerColor,
      textTheme: textTheme,
      
      // AppBar theme - consistent styling for all app bars
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
      
      // Button themes - consistent styling for elevated buttons
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
      
      // Input field styling for text inputs and form fields
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
      
      // Card styling for consistent card appearance
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
  /// Style for page titles (large, bold heading)
  ///
  /// Returns a consistent text style for main page titles across the app.
  ///
  /// Parameters:
  ///   context - The build context to access the current theme
  ///
  /// Returns:
  ///   TextStyle configured for page titles
  static TextStyle pageTitleStyle(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!;
  }
  
  /// Style for section headings (medium, bold subheading)
  ///
  /// Returns a consistent text style for section headings within pages.
  ///
  /// Parameters:
  ///   context - The build context to access the current theme
  ///
  /// Returns:
  ///   TextStyle configured for section headings
  static TextStyle sectionHeadingStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!;
  }
  
  /// Style for main body text (regular paragraph text)
  ///
  /// Returns a consistent text style for primary content text.
  ///
  /// Parameters:
  ///   context - The build context to access the current theme
  ///
  /// Returns:
  ///   TextStyle configured for main body text
  static TextStyle bodyTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!;
  }

  /// Style for secondary/supporting text (smaller, lighter text)
  ///
  /// Returns a consistent text style for supplementary information.
  ///
  /// Parameters:
  ///   context - The build context to access the current theme
  ///
  /// Returns:
  ///   TextStyle configured for supporting text
  static TextStyle infoTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!;
  }
  
  // ========== COLOR ACCESSORS ==========
  /// Get category card color by name for consistent color usage
  ///
  /// Allows retrieving the appropriate color for a section by its name,
  /// ensuring consistent color mapping throughout the app.
  ///
  /// Parameters:
  ///   category - String name of the app section/category
  ///
  /// Returns:
  ///   Color matching the specified category, or primaryColor if not found
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