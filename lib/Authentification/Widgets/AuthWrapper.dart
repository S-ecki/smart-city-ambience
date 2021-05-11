import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_city_ambience/Authentification/LoginScreen.dart';
import 'package:smart_city_ambience/navbar/navbar_screen.dart';

/**
 * Listens to changes of authState and then decides
 * if a user is redirected to the home screen or 
 * to the login page
 */

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fireUser = context.watch<User>();

    if (fireUser == null) {
      return NavbarScreen();
    }
    // ! new
    // routes to tabscreen, which contains bottom nav bar
    // with chat / home / event screen
    return NavbarScreen();
  }
}
