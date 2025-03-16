import 'package:flutter/material.dart';
import 'package:gabrielsstar/theme/theme_config.dart';

/// Displays a message to the user in an alert dialog.
///
/// Creates and shows a modal dialog with the specified message and an OK button
/// to dismiss it. Optionally includes a title if provided. This function serves
/// as a standardized way to present informational and error messages to users
/// throughout the app.
///
/// Parameters:
///   message - The main text content to display in the dialog
///   context - The BuildContext from the calling widget
///   title - Optional title that appears at the top of the dialog
void displayMessageToUser(
  String message, 
  BuildContext context, 
  {String? title}
) {
  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      // Display the title only if one was provided
      title: title != null ? Text(
        title,
        style: AppTheme.sectionHeadingStyle(context),
      ) : null,
      // Main message content
      content: Text(
        message,
        style: AppTheme.bodyTextStyle(context),
      ),
      // Single OK button to dismiss the dialog
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
      // Rounded corners for the dialog matching app's design language
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    )
  );
}

/// Shows a success message dialog with a green checkmark icon.
///
/// Creates and shows a specialized dialog for successful operations,
/// featuring a green checkmark icon and a "Success" title. This provides
/// users with consistent, positive feedback when operations complete successfully.
///
/// Parameters:
///   message - Text describing the successful operation
///   context - The BuildContext from the calling widget
void displaySuccessMessage(String message, BuildContext context) {
  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      // Success checkmark icon in green
      icon: Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 36,
      ),
      // Fixed "Success" title
      title: Text(
        'Success',
        style: AppTheme.sectionHeadingStyle(context),
      ),
      // Success message content
      content: Text(
        message,
        style: AppTheme.bodyTextStyle(context),
      ),
      // Single OK button to dismiss the dialog
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
      // Rounded corners for the dialog matching app's design language
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    )
  );
}