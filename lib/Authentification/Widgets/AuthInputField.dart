import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  const AuthInputField(
      {Key key,
      @required this.controller,
      @required this.label,
      @required this.isPasswordField})
      : super(key: key);

  final TextEditingController controller;
  final String label;
  final bool isPasswordField;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPasswordField,
      controller: controller,
      validator: (value) {
        if (controller.text.isEmpty) return "Can't be empty";
        return "";
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
