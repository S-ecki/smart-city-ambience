import "package:flutter/material.dart";

import "material_color_generator.dart";

ThemeData smortTheme(BuildContext context) {
  return ThemeData(

    primarySwatch: Colors.blue,

    // Material Color with own Color Palette can be created as follows
    // primarySwatch: generateMaterialColor(Color.fromRGBO(15, 54, 246, 1.0)),

    // common Theme for Tab Components on Report Screen
    tabBarTheme: TabBarTheme(
      labelColor: Theme.of(context).primaryColor,
      unselectedLabelColor: Colors.grey,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
      ),
    ),

    // text style for headline/body etc can be defined here (size/ weight/ font...)
    // it gets applied on default
    textTheme: TextTheme(),

    // for text which needs other color
    accentTextTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white),
    ),
  );
}
