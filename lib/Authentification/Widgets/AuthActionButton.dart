import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:smart_city_ambience/Authentification/Service/AuthService.dart';
import 'package:smart_city_ambience/routing/smort_routes.dart';

class AuthActionButton extends StatelessWidget {
  const AuthActionButton(
      {Key key,
      @required this.emailController,
      @required this.passwordController,
      @required this.formKey,
      @required this.label})
      : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final String label;

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      title: Text(
        label.toLowerCase() == "log in"
            ? "No user found"
            : "Registration failed",
      ),
      content: Icon(
        Icons.error,
        color: Colors.lightBlue,
        size: 70,
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> handleOnPressed(BuildContext context) async {
    if (!formKey.currentState.validate()) {
      return;
    }
    if (label.toLowerCase() == "log in") {
      FireBaseSignInResponse response = await context
          .read<AuthServcice>()
          .signIn(
              mail: emailController.text, password: passwordController.text);
      if (response == FireBaseSignInResponse.Failed) {
        showAlertDialog(context);
      } else {
        Navigator.of(context).pushNamed(SmortRoutes.navBarScreen);
      }
    } else {
      FireBaseSignInResponse response = await context
          .read<AuthServcice>()
          .signUp(
              mail: emailController.text, password: passwordController.text);
      if (response == FireBaseSignInResponse.Failed) {
        showAlertDialog(context);
      } else {
        Navigator.of(context).pushNamed(SmortRoutes.loginScreen);
      }
    }
  }

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
        onPressed: () => handleOnPressed(context),
        child: Text(
          label,
          style: TextStyle(color: Colors.lightBlue),
        ),
      ),
    );
  }
}
