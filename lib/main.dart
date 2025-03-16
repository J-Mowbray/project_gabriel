import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gabrielsstar/auth/auth.dart';
import 'package:gabrielsstar/theme/theme_config.dart';
import 'package:gabrielsstar/firebase_options.dart'; // You need this import

void main() async {  // Make this async
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase BEFORE running the app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gabriel\'s Star',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const AuthPage(),
    );
  }
}