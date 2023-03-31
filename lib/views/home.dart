import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Future signOut() async {
    FirebaseAuth.instance.signOut();
  }

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        children: [
          Text("Logged In"),
          IconButton(onPressed: signOut, icon: Icon(Icons.logout))
        ],
      )),
    );
  }
}
