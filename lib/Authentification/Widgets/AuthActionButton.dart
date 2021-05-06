import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:smart_city_ambience/Authentification/AuthService.dart';

class AuthActionButton extends StatelessWidget {
  const AuthActionButton(
      {Key key,
      @required this.emailController,
      @required this.passwordController,
      @required this.formKey})
      : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 16),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Colors.lightBlue),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {
          if (!formKey.currentState.validate()) {
            return;
          }
          context.read<AuthServcice>().signIn(
              mail: emailController.text, password: passwordController.text);
        },
        child: Text(
          "LOG IN",
          style: TextStyle(color: Colors.lightBlue),
        ),
      ),
    );
  }
}
