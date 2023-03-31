import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spice/constants.dart';
import 'package:spice/views/forgot_password.dart';
import 'package:spice/views/sign_up.dart';

import '../components/text_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //Sign In
  Future signIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailPopup();
      } else if (e.code == 'wrong-password') {
        wrongPasswordPopup();
      }
    }
  }

  //Error Popup
  void wrongEmailPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Email'),
        );
      },
    );
  }

  void wrongPasswordPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Email'),
        );
      },
    );
  }

  @override
  //Cleanup
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: size.width * 0.3,
                  height: size.height * 0.3,
                ),
                Text(
                  'Welcome',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(fontSize: 28, color: Colors.grey[700]),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                TextInput(
                  hintText: "Email",
                  obscureText: false,
                  controller: emailController,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextInput(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordController,
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ForgotPasswordPage();
                          }));
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.all(18),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(35)),
                    child: const Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Or",
                          style: TextStyle(color: Colors.grey[900]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(45),
                          color: Colors.grey[200]),
                      child: Image.asset(
                        'assets/images/google.png',
                        height: size.height * 0.05,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Expanded(child: SizedBox()),
                      const Text('Not a member?'),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const SignUpPage();
                          }));
                        },
                        child: const Text(
                          'Register Now',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
