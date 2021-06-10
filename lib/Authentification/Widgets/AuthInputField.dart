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
    return Theme(
      data: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white,
        ),
        errorColor: Colors.yellowAccent,
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        keyboardType:
            label == "Email" ? TextInputType.emailAddress : TextInputType.text,
        obscureText: isPasswordField,
        controller: controller,
        validator: (value) {
          if (controller.text.isEmpty) return "Darf nicht leer sein";
          if (label.toLowerCase() == "email") {
            return EmailValidator.validate(controller.text)
                ? null
                : "Ungültige Email";
          }
          if (label.toLowerCase() == "passwort bestätigen") {
            print("pw ${passwordController.text} + conf ${controller.text}");
            return passwordController.text == controller.text
                ? null
                : "Passwörter stimmen nicht überein";
          }
        },
        decoration: InputDecoration(
          enabledBorder: _textFieldBorder,
          errorBorder: _textFieldBorder,
          focusedErrorBorder: _textFieldBorder,
          focusedBorder: _textFieldBorder,
          labelText: label,
          labelStyle: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }

  final _textFieldBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey[400]),
    borderRadius: BorderRadius.circular(20),
  );
}
