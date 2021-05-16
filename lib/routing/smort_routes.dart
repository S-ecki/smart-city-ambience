import 'package:flutter/material.dart';
import 'package:smart_city_ambience/Authentification/LoginScreen.dart';
import 'package:smart_city_ambience/Authentification/RegisterScreen.dart';
import 'package:smart_city_ambience/navbar/navbar_screen.dart';
import 'package:smart_city_ambience/screens/eventDetailScreen/eventDetailScreen.dart';
import 'package:smart_city_ambience/screens/forumDetailScreen/forumDetailScreen.dart';
import 'package:smart_city_ambience/screens/profile/guide.dart';
import 'package:smart_city_ambience/screens/profile/profile_screen.dart';

class SmortRoutes {
  // example for other screen outside of bottom nav
  static const profileScreen = "/profile";
  static const registratinScreen = "/register";
  static const loginScreen = "/login";
  static const navBarScreen = "/home";
  static const eventDetailScreen = "/event-detail-screen";
  static const rules = "/rules";
  static const tutorial = "/tutorial";
  static const forumDetailScreen = "/forum-detail-screen";

  static Map<String, WidgetBuilder> myRoutes = {
    profileScreen: (ctx) => ProfileScreen(),
    registratinScreen: (ctx) => RegisterPage(),
    loginScreen: (ctx) => LoginPage(),
    navBarScreen: (ctx) => NavbarScreen(),
    eventDetailScreen: (ctx) => EventDetailScreen(),
    rules: (ctx) => Guide(),
    tutorial: (ctx) => NavbarScreen(), // ! change
    forumDetailScreen: (ctx) => ForumDetailScreen(),

    // add all routes that dont get accessed through tabs here
    // those accessed ONLY through tabs dont need a name
    // cause they are never called with pushNamed()
  };
}
