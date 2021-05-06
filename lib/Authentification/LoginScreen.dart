import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:smart_city_ambience/Authentification/AuthService.dart';

import 'Widgets/AuthInputField.dart';

class LoginPage extends StatelessWidget {
  @override
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  width: double.infinity,
                  child: Icon(
                    Icons.supervisor_account_rounded,
                    color: Colors.white,
                    size: 100,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                AuthInputField(
                  controller: emailController,
                  label: "Email",
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: AuthInputField(
                    controller: passwordController,
                    label: "Password",
                  ),
                ),
                Container(
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
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      if (!(emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty)) {
                        return;
                      }
                      context.read<AuthServcice>().signIn(
                          mail: emailController.text,
                          password: passwordController.text);
                    },
                    child: Text(
                      "LOG IN",
                      style: TextStyle(color: Colors.lightBlue),
                    ),
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
