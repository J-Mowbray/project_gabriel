import 'package:flutter/material.dart';
import 'package:gabrielsstar/theme/theme_config.dart';

/// Display a message to the user in an alert dialog
/// 
/// @param message The message to display
/// @param context The BuildContext
/// @param title Optional title for the dialog
void displayMessageToUser(
  String message, 
  BuildContext context, 
  {String? title}
) {
  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      title: title != null ? Text(
        title,
        style: AppTheme.sectionHeadingStyle(context),
      ) : null,
      content: Text(
        message,
        style: AppTheme.bodyTextStyle(context),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'OK',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    )
  );
}

/// Show a success message with a green header
void displaySuccessMessage(String message, BuildContext context) {
  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      icon: Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 36,
      ),
      title: Text(
        'Success',
        style: AppTheme.sectionHeadingStyle(context),
      ),
      content: Text(
        message,
        style: AppTheme.bodyTextStyle(context),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'OK',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    )
  );
}