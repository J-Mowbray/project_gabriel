// base_page_layout.dart
import 'package:flutter/material.dart';

/// BasePageLayout provides a consistent page structure throughout the app.
///
/// This reusable widget implements a standard page layout with an app bar,
/// consistent padding, and optional components like a floating action button.
/// It ensures visual consistency across different screens while reducing
/// duplicate code.
class BasePageLayout extends StatelessWidget {
  /// Title displayed in the app bar
  final String title;

  /// Main content to display in the body of the page
  final Widget child;

  /// Optional floating action button to display at the bottom of the screen
  final Widget? floatingActionButton;

  /// Optional widget to display below the app bar (e.g., tabs)
  final PreferredSizeWidget? bottomAppBar;

  /// Creates a consistent page layout with standard styling.
  ///
  /// Parameters:
  ///   title - Text to display in the app bar
  ///   child - Main content widget to display in the page body
  ///   floatingActionButton - Optional button to display at the bottom of the screen
  ///   bottomAppBar - Optional widget to display below the app bar (like TabBar)
  const BasePageLayout({
    super.key,
    required this.title,
    required this.child,
    this.floatingActionButton,
    this.bottomAppBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with styling from the global theme configuration
      appBar: AppBar(title: Text(title), bottom: bottomAppBar),
      // Page body with consistent background colour and padding
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          child: Padding(padding: const EdgeInsets.all(16.0), child: child),
        ),
      ),
      // Optional floating action button if provided
      floatingActionButton: floatingActionButton,
    );
  }
}
