import 'package:flutter/material.dart';

/// MyTextfield provides a standardized text input component used throughout the app.
///
/// This reusable component creates a consistently styled text field that leverages
/// the app's theme configuration. It supports common text input features like
/// password obscuring, error messages, and specialized keyboard types.
class MyTextfield extends StatelessWidget {
  /// Placeholder text displayed when the field is empty
  final String hintText;
  
  /// Whether to hide the entered text (for passwords)
  final bool obscureText;
  
  /// Controller to manage the text input state
  final TextEditingController controller;
  
  /// Optional error message to display below the text field
  final String? errorText;
  
  /// Optional keyboard type to display (email, number, etc.)
  final TextInputType? keyboardType;
  
  /// Creates a standardized text field with consistent styling.
  ///
  /// Parameters:
  ///   hintText - Placeholder text shown when the field is empty
  ///   obscureText - When true, entered text is hidden (for passwords)
  ///   controller - Controller to manage and access the field's text value
  ///   errorText - Optional validation error message to display
  ///   keyboardType - Optional specialized keyboard layout (email, number, etc.)
  const MyTextfield({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    this.errorText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    // Create a TextField with styling from the global theme
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      // Text style from the app's theme
      style: Theme.of(context).textTheme.bodyLarge,
      // Input decoration inherits most properties from the inputDecorationTheme in AppTheme
      decoration: InputDecoration(
        // Only specify the properties that need to be customized per-instance
        hintText: hintText,
        errorText: errorText,
      ),
    );
  }
}