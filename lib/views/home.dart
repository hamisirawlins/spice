import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  Future signOut() async {
    FirebaseAuth.instance.signOut();
  }

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        children: [
          Text("Logged In as " + user.email!),
          IconButton(onPressed: signOut, icon: Icon(Icons.logout))
        ],
      )),
    );
  }
}
