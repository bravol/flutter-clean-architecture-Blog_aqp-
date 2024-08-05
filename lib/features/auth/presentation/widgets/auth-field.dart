import 'package:flutter/material.dart';

class AuthFeild extends StatelessWidget {
  const AuthFeild(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isObsecure = false});
  final String hintText;
  final TextEditingController controller;
  final bool isObsecure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your $hintText';
        }
        return null;
      },
      controller: controller,
      obscureText: isObsecure,
    );
  }
}
