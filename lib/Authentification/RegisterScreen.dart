import 'package:flutter/material.dart';
import 'Widgets/AuthActionButton.dart';
import 'Widgets/AuthHeaderContainer.dart';
import 'Widgets/AuthInputField.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 500,
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
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthHeaderContainer(),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AuthInputField(
                        controller: emailController,
                        label: "Email",
                        isPasswordField: false,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: AuthInputField(
                          controller: passwordController,
                          label: "Password",
                          isPasswordField: true,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: AuthInputField(
                          passwordController: passwordController,
                          controller: confirmPasswordController,
                          label: "Confirm Password",
                          isPasswordField: true,
                        ),
                      ),
                    ],
                  ),
                ),
                AuthActionButton(
                  label: "Register",
                  formKey: _formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // navigate to login page
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
