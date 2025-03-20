import 'package:flutter/material.dart';

/// MyButton provides a standardised button component used throughout the app.
///
/// This reusable component creates a styled button that can be either full-width
/// or content-sized. It leverages the app's theme configuration for consistent
/// styling and offers a simplified API for common button use cases.
class MyButton extends StatelessWidget {
  /// The text to display on the button
  final String text;

  /// Callback function to execute when the button is tapped
  final void Function()? onTap;

  /// Whether the button should expand to fill the available width
  /// Defaults to true (full-width)
  final bool fullWidth;

  /// Creates a standardised button with consistent styling.
  ///
  /// Parameters:
  ///   text - Label to display on the button
  ///   onTap - Function to call when the button is pressed
  ///   fullWidth - When true (default), button expands to fill available width;
  ///               when false, button sizes to its content
  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    // Create the base button with styling from the global theme
    final button = ElevatedButton(
      onPressed: onTap,
      // Button styling is inherited from the elevatedButtonTheme in AppTheme
      child: Text(text),
    );

    // Conditionally wrap the button in a SizedBox for full-width display
    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}
