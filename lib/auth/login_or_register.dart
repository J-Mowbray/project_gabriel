import 'package:flutter/material.dart';
import 'package:gabrielsstar/pages/login_page.dart';
import 'package:gabrielsstar/pages/register_page.dart';

/// LoginOrRegister provides navigation between login and registration screens.
///
/// This stateful widget manages the state that determines whether to show
/// the login page or registration page, and provides the functionality
/// to toggle between them. It serves as a container that switches between
/// these two authentication screens.
class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  
  /// Determines which authentication screen to display.
  ///
  /// When true, the login page is shown; when false, the registration page
  /// is shown. Initialized to true to show the login page first.
  bool showLoginPage = true;

  /// Toggles between the login and registration screens.
  ///
  /// This method is passed as a callback to both the login and registration
  /// pages, allowing users to switch between them. It updates the state
  /// by inverting the current value of showLoginPage.
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Display either login or registration page based on state
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}