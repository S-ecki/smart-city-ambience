import 'package:flutter/material.dart';
import 'package:smart_city_ambience/routing/smort_routes.dart';
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
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 550,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
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
                                label: "Passwort",
                                isPasswordField: true,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              child: AuthInputField(
                                passwordController: passwordController,
                                controller: confirmPasswordController,
                                label: "Passwort bestätigen",
                                isPasswordField: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AuthActionButton(
                        label: "Registrieren",
                        formKey: _formKey,
                        emailController: emailController,
                        passwordController: passwordController,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Du hast schon einen Account?",
                            style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Einloggen",
                              style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white, fontWeight: FontWeight.bold,),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
