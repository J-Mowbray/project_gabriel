// base_page_layout.dart
import 'package:flutter/material.dart';

class BasePageLayout extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? bottomAppBar;

  const BasePageLayout({
    super.key,
    required this.title,
    required this.child,
    this.floatingActionButton,
    this.bottomAppBar,
  });

  @override
  Widget build(BuildContext context) {
    // Uses appBarTheme from ThemeData - no need to specify colors!
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        bottom: bottomAppBar,
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}