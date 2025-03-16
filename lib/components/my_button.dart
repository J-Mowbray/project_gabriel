import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final bool fullWidth;
  
  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    // Using elevatedButtonTheme from ThemeData
    final button = ElevatedButton(
      onPressed: onTap,
      // No need to specify style - comes from theme!
      child: Text(text),
    );
    
    return fullWidth
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }
}