import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import "material_color_generator.dart";

ThemeData smortTheme(BuildContext context) {
  final primaryColor = generateMaterialColor(Color(0xFF7d3331));
  final accentColor = Color(0xFF2e463a);
  final navBarColor = Color(0xFFffe6a7);

  return ThemeData(
    // Material Color with own Color Palette can be created as follows
    primarySwatch: primaryColor,
    accentColor: accentColor,
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
      labelColor: accentColor,
      unselectedLabelColor: Colors.grey,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: accentColor, width: 2),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: navBarColor,
      unselectedItemColor: Colors.black54,
    ),
  );
}
