import 'package:flutter/material.dart';

/// NavigationCard provides colourful, icon-based navigation buttons for the app.
///
/// This component creates the distinctive coloured cards used on the home screen
/// for navigating to different sections of the app. Each card features a
/// consistent layout with an icon and label on a coloured background.
class NavigationCard extends StatelessWidget {
  /// Title text displayed below the icon
  final String title;

  /// Icon displayed in the center of the card
  final IconData icon;

  /// Background color for the card (typically from AppTheme category colors)
  final Color color;

  /// Callback function executed when the card is tapped
  final VoidCallback onTap;

  /// Creates a navigation card for the home screen grid.
  ///
  /// Parameters:
  ///   title - Label text displayed below the icon
  ///   icon - Icon displayed in the center of the card
  ///   color - Background color of the card (typically a section color)
  ///   onTap - Function to execute when the card is tapped
  const NavigationCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Navigate when the card is tapped
      onTap: onTap,
      child: Card(
        // Slightly elevated appearance for depth
        elevation: 4,
        // Rounded corners for the card
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          // Apply the category-specific background color
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            // Centre contents vertically
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Large white icon
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 8),
              // White text label
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
