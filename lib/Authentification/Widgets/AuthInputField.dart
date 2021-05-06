import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  AuthInputField(
      {Key key,
      @required this.controller,
      @required this.label,
      @required this.isPasswordField,
      this.passwordController})
      : super(key: key);

  final TextEditingController controller;
  final String label;
  final bool isPasswordField;
  TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPasswordField,
      controller: controller,
      validator: (value) {
        if (controller.text.isEmpty) return "Can't be empty";
        if (label.toLowerCase() == "email") {
          return EmailValidator.validate(controller.text)
              ? null
              : "Not valid email";
        }
        if (label.toLowerCase() == "confirm password") {
          return passwordController.text == controller.text
              ? null
              : "Passwords don't match";
        }
        if (label.toLowerCase() == "password") {
          return controller.text.length > 7
              ? null
              : "Password must be greater or equal 8";
        }
        return null;
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
