import 'package:flutter/material.dart';

import '../constants.dart';

class TextInput extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const TextInput({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: kPrimaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey[200]),
      ),
    );
  }
}
