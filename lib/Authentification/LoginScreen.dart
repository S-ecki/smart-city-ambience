import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:smart_city_ambience/Authentification/AuthService.dart';

class LoginPage extends StatelessWidget {
  @override
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        TextField(
          controller: emailController,
        ),
        TextField(
          controller: passwordController,
        ),
        ElevatedButton(
          onPressed: () {
            context.read<AuthServcice>().signIn(
                mail: emailController.text, password: passwordController.text);
          },
          child: Text("Logged In"),
        )
      ],
    ));
  }
}
