// content_card.dart
import 'package:flutter/material.dart';
import 'package:gabrielsstar/theme/theme_config.dart';

class ContentCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback? onTap;

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
    // Using cardTheme from ThemeData
    final theme = Theme.of(context);
    final color = iconColor ?? theme.primaryColor;
    
    // Icon background color with appropriate alpha
    final iconBgColor = AppTheme.withAlpha(
      color, 
      theme.brightness == Brightness.dark ? 0.3 : 0.1
    );
    
    return Card(
      // Card styling comes from cardTheme in ThemeData!
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (icon != null) ...[
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: iconBgColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        icon,
                        color: color,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: Text(
                      title,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  if (onTap != null)
                    Icon(
                      Icons.arrow_forward_ios, 
                      size: 16, 
                      color: AppTheme.withAlpha(theme.colorScheme.onSurface, 0.6),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}