import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gabrielsstar/auth/auth.dart';
import 'package:gabrielsstar/theme/theme_config.dart';
import 'package:gabrielsstar/firebase_options.dart';

/// Entry point for the Gabriel's Star application.
///
/// Initialises Firebase services before launching the app and
/// configures theme settings and the initial authentication screen.
void main() async {
  // Ensure Flutter engine is initialised before calling native code
  WidgetsFlutterBinding.ensureInitialized();

  // Initialise Firebase with platform-specific configuration
  // This must happen before any Firebase services are used
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Launch the application with the root widget
  runApp(const MyApp());
}

/// Root widget for the Gabriel's Star application.
///
/// Configures the MaterialApp with appropriate theming and
/// sets the authentication page as the initial route.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gabriel\'s Star',
      // Apply the light theme configuration from AppTheme
      theme: AppTheme.lightTheme,
      // Apply the dark theme configuration from AppTheme
      darkTheme: AppTheme.darkTheme,
      // Use the device system preference to determine light/dark mode
      themeMode: ThemeMode.system,
      // Set the authentication page as the initial screen
      // This will handle routing to login or home based on auth state
      home: const AuthPage(),
    );
  }
}
