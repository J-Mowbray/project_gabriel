import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gabrielsstar/components/my_button.dart';
import 'package:gabrielsstar/components/my_textfield.dart';
import 'package:gabrielsstar/helper/helper_functions.dart';

/// LoginPage handles user authentication through email and password.
///
/// This screen provides a form for existing users to sign in to the application
/// and contains a link to the registration page for new users.
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
      builder: (context) => const Center(
        child: CircularProgressIndicator()),
    );

    // Attempt to sign in with Firebase Authentication
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      // Remove loading indicator after successful authentication
      if (mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Handle authentication errors by displaying appropriate messages
      if (mounted){
        Navigator.pop(context);
        displayMessageToUser(e.code, context);
      }
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
                  Text(
                    "Forgot Password?",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

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