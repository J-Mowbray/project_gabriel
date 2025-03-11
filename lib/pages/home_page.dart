import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // loguser out
  void logout() {
    FirebaseAuth.instance.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      actions: [
        // logout button
        IconButton(onPressed: logout, icon: Icon(Icons.logout),
        )
      ],
      )
    );
  }
}