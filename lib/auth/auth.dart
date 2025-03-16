import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gabrielsstar/auth/login_or_register.dart';
import 'package:gabrielsstar/pages/home_page.dart';

/// AuthPage handles authentication state and redirects to appropriate screens.
///
/// This widget serves as the root authentication controller for the app.
/// It listens to Firebase authentication state changes and automatically
/// redirects users to either the home page (if authenticated) or the 
/// login/register screens (if not authenticated).
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        // Listen to Firebase authentication state changes
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot) {
          // If user is authenticated (logged in)
          if (snapshot.hasData) {
            // Navigate to the home page
            return const HomePage();
          } 
          // If user is not authenticated (logged out)
          else {
            // Navigate to the login/register page
            return const LoginOrRegister();
          }
        })
    );
  }
}