import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gabrielsstar/components/my_button.dart';
import 'package:gabrielsstar/components/my_textfield.dart';
import 'package:gabrielsstar/helper/helper_functions.dart';
import 'package:gabrielsstar/pages/privacy_policy_page.dart'; // Add this import

/// LoginPage handles user authentication through email and password.
///
/// This screen provides a form for existing users to sign in to the application
/// and contains a link to the registration page for new users as well as allow
/// password resets for user accounts
class LoginPage extends StatefulWidget {
  /// Callback function triggered when the user wants to navigate to registration.
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers for the input fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// Attempts to authenticate the user with Firebase using email and password.
  ///
  /// Displays a loading indicator during authentication and handles potential
  /// authentication errors by showing appropriate messages to the user.
  void login() async {
    // Display loading indicator while authentication is in progress
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    // Attempt to sign in with Firebase Authentication
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Remove loading indicator after successful authentication
      if (mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Check if widget is still mounted before updating UI
      if (!mounted) return;

      // Remove loading indicator
      Navigator.pop(context);

      // Display user-friendly error message
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = "No account found with this email address.";
          break;
        case 'wrong-password':
          errorMessage = "Please enter your password.";
          break;
        case 'invalid-credential':
          errorMessage = "Incorrect email or password. Please try again.";
          break;
        case 'invalid-email':
          errorMessage = "Please enter a valid email address.";
          break;
        case 'user-disabled':
          errorMessage = "This account has been disabled.";
          break;
        case 'too-many-requests':
          errorMessage = "Too many attempts. Please try again later.";
          break;
        default:
          errorMessage =
              "Login failed. Please check your credentials and try again.";
      }
      displayMessageToUser(errorMessage, context);
    }
  }

  /// Shows a dialogue that allows the user to request a password reset.
  ///
  /// Displays a dialogue with an email input field and sends a password
  /// reset email when the user submits their email address.
  void _showForgotPasswordDialog() {
    final resetEmailController = TextEditingController();
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              "Enter the email address associated with your account. \n\nIf an account exists, we'll send you a link to reset your password. \n\nYou may need to check your spam folder.",
              style: theme.textTheme.bodyLarge,
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
                  style: TextStyle(color: theme.colorScheme.secondary),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (resetEmailController.text.trim().isNotEmpty) {
                    _resetPassword(resetEmailController.text.trim());
                  } else {
                    displayMessageToUser(
                      "Please enter your email address.",
                      context,
                    );
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
      builder: (context) => const Center(child: CircularProgressIndicator()),
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
        context,
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
              Icon(Icons.person, size: 80, color: theme.primaryColor),

              const SizedBox(height: 25),

              // Application name display
              Text("Gabriel's Star", style: theme.textTheme.headlineMedium),

              const SizedBox(height: 50),

              // Email input field
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

              // Add privacy policy notice here
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "By logging in, you agree to our ",
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.primaryColor.withOpacity(0.7),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Privacy Policy",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: theme.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 15,
              ), // Reduced from 25 to accommodate new row
              // Login button to initiate authentication
              MyButton(text: "Login", onTap: login),

              const SizedBox(height: 25),

              // Registration option for new users
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.primaryColor.withOpacity(0.7),
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      " Register here!",
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
