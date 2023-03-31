import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spice/views/home.dart';
import 'package:spice/views/login.dart';

class AuthState extends StatelessWidget {
  const AuthState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //Logged In
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    ));
  }
}
