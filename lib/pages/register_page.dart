import 'package:flutter/material.dart';
import 'package:gabrielsstar/components/my_button.dart';
import 'package:gabrielsstar/components/my_textfield.dart';
import 'package:gabrielsstar/helper/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// RegisterPage handles user account creation via email and password.
///
/// This screen provides a form for new users to create an account by entering
/// their name, email, and password, with validation to ensure password fields match
/// before submitting to Firebase Authentication.
class RegisterPage extends StatefulWidget {
  /// Callback function triggered when the user wants to navigate to the login page.
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controllers for the input fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  /// Registers a new user with Firebase Authentication.
  ///
  /// Validates that password fields match before attempting to create a new user
  /// account. Displays loading indicator during registration process and handles
  /// potential authentication errors with appropriate user messages.
  void registerUser() async {
    // Display loading indicator while registration is in progress
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    // Validate that passwords match before proceeding with registration
    if (passwordController.text != confirmPwController.text) {
      // Remove loading indicator
      Navigator.pop(context);

      // Notify user of password mismatch
      displayMessageToUser("Entered Passwords don't match!", context);

    } else {
      // Attempt to create a new user account with Firebase Authentication
      try {
        // Create the user with email and password
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // Remove loading indicator after successful registration
        if (mounted) {
          Navigator.pop(context);
        }
      } on FirebaseAuthException catch (e) {
        // Handle authentication errors
        if (mounted) {
          Navigator.pop(context);
          displayMessageToUser(e.code, context);
        }
      }
    }
  }

  /// Shows a dialog that allows the user to request a password reset.
  ///
  /// Displays a dialog with an email input field and sends a password
  /// reset email when the user submits their email address.
  void _showForgotPasswordDialog() {
    final resetEmailController = TextEditingController();
    final theme = Theme.of(context);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Reset Password",
          style: theme.textTheme.titleLarge,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Enter your email address to receive a password reset link.",
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: resetEmailController,
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(
                color: theme.colorScheme.secondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (resetEmailController.text.trim().isNotEmpty) {
                _resetPassword(resetEmailController.text.trim());
              } else {
                displayMessageToUser("Please enter your email address.", context);
              }
            },
            child: Text(
              "Send Reset Link",
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  /// Sends a password reset email to the specified email address.
  ///
  /// Displays a loading indicator during the process and shows
  /// success or error messages to the user.
  void _resetPassword(String email) async {
    // Display loading indicator
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator()),
    );

    try {
      // Send password reset email
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      
      // Check if widget is still mounted before updating UI
      if (!mounted) return;
      
      // Remove loading indicator 
      Navigator.pop(context);
      
      // Show success message
      displaySuccessMessage(
        "Password reset link sent to $email. Please check your inbox.",
        context
      );
    } on FirebaseAuthException catch (e) {
      // Check if widget is still mounted before updating UI
      if (!mounted) return;
      
      // Remove loading indicator
      Navigator.pop(context);
        
      // Display user-friendly error message
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = "No account found with this email.";
          break;
        case 'invalid-email':
          errorMessage = "Please enter a valid email address.";
          break;
        default:
          errorMessage = "Failed to send reset email. Please try again.";
      }
      displayMessageToUser(errorMessage, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App logo representation
              Icon(
                Icons.person,
                size: 80,
                color: theme.primaryColor,
              ),

              const SizedBox(height: 25),

              // Application name display
              Text(
                "Gabriel's Star", 
                style: theme.textTheme.headlineMedium,
              ),

              const SizedBox(height: 50),

              // Name input field
              MyTextfield(
                hintText: "Name",
                obscureText: false,
                controller: nameController,
              ),

              const SizedBox(height: 10),

              // Email input field with email keyboard type
              MyTextfield(
                hintText: "Email",
                obscureText: false,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 10),

              // Password input field with obscured text
              MyTextfield(
                hintText: "Password",
                obscureText: true,
                controller: passwordController,
              ),

              const SizedBox(height: 10),

              // Confirm password input field with obscured text
              MyTextfield(
                hintText: "Confirm Password",
                obscureText: true,
                controller: confirmPwController,
              ),

              const SizedBox(height: 10),

              // Forgot password option
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: _showForgotPasswordDialog,
                    child: Text(
                      "Forgot Password?",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Register button to initiate account creation
              MyButton(text: "Register", onTap: registerUser),

              const SizedBox(height: 25),

              // Login option for existing users
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.primaryColor.withOpacity(0.7),
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      " Login here!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}