// content_card.dart
import 'package:flutter/material.dart';
import 'package:gabrielsstar/theme/theme_config.dart';

/// ContentCard provides a standardised card layout for displaying information.
///
/// This reusable component displays titled content blocks with optional icons
/// and tap functionality. It's used throughout the app to present information
/// in a consistent format with visual cues for interactive elements.
class ContentCard extends StatelessWidget {
  /// Title text displayed at the top of the card
  final String title;

  /// Main content text displayed in the body of the card
  final String content;

  /// Optional icon to display next to the title
  final IconData? icon;

  /// Optional color for the icon and its background
  final Color? iconColor;

  /// Optional callback function when the card is tapped
  final VoidCallback? onTap;

  /// Creates a standardised content card with consistent styling.
  ///
  /// Parameters:
  ///   title - Heading text displayed at the top of the card
  ///   content - Main text content displayed in the card body
  ///   icon - Optional icon to display beside the title
  ///   iconColor - Optional color for the icon (defaults to primary color)
  ///   onTap - Optional callback function when card is tapped
  const ContentCard({
    super.key,
    required this.title,
    required this.content,
    this.icon,
    this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Access current theme and determine icon colours
    final theme = Theme.of(context);
    final color = iconColor ?? theme.primaryColor;

    // Create a semi-transparent background colour for the icon
    // with appropriate opacity based on light/dark mode
    final iconBgColor = AppTheme.withAlpha(
      color,
      theme.brightness == Brightness.dark ? 0.3 : 0.1,
    );

    return Card(
      // Card styling applied from global card theme
      child: InkWell(
        // Make the card tappable if onTap is provided
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title row with optional icon and navigation chevron
              Row(
                children: [
                  // Only show icon container if an icon is provided
                  if (icon != null) ...[
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: iconBgColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(icon, color: color),
                    ),
                    const SizedBox(width: 8),
                  ],
                  // Title text that expands to fill available space
                  Expanded(
                    child: Text(title, style: theme.textTheme.titleLarge),
                  ),
                  // Only show navigation chevron if card is tappable
                  if (onTap != null)
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: AppTheme.withAlpha(
                        theme.colorScheme.onSurface,
                        0.6,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              // Main content text
              Text(content, style: theme.textTheme.bodyLarge),
            ],
          ),
        ),
      ),
    );
  }
}
