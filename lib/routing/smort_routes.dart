
import 'package:flutter/material.dart';
import 'package:smart_city_ambience/screens/profile/profile_screen.dart';

class SmortRoutes {

  // example for other screen outside of bottom nav
  static const profileScreen = "/profile";


  static Map<String, WidgetBuilder> myRoutes = {

    profileScreen: (ctx) => ProfileScreen(),

    // add all routes that dont get accessed through tabs here
    // those accessed ONLY through tabs dont need a name
    // cause they are never called with pushNamed()
    
  };
}
