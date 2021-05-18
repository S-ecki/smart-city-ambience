import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import "material_color_generator.dart";

ThemeData smortTheme(BuildContext context) {
  final darkAccentColor = Color(0xFF34252F);
  final accentColor = Color(0xFFBEC5AD);

  return ThemeData(
    // Material Color with own Color Palette can be created as follows
    primarySwatch: generateMaterialColor(Color(0xFFA4B494)),
    accentColor: darkAccentColor,
    // primarySwatch: Colors.pink,
    // accentColor: Colors.amber,

    backgroundColor: Colors.grey[200],

    // text style for headline/body etc can be defined here (size/ weight/ font...)
    // it gets applied on default
    textTheme: GoogleFonts.ralewayTextTheme(),
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: GoogleFonts.raleway(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 19,
        ),
      ),
    ),

    tabBarTheme: TabBarTheme(
      labelStyle: GoogleFonts.raleway(),
      labelColor: darkAccentColor,
      unselectedLabelColor: Colors.grey,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: accentColor, width: 2),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: darkAccentColor,
      unselectedLabelStyle: TextStyle(color: Colors.grey),
    ),
  );
}
