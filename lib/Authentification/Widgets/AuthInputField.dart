import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  const AuthInputField(
      {Key key, @required this.controller, @required this.label})
      : super(key: key);

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
