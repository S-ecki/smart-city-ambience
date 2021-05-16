//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_city_ambience/screens/home/emotion_input/emotion_input.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/emotion_output_tabs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);



  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectionInd = 0;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // ScrollView (child) takes all the space it needs
      width: double.infinity,
      height: double.infinity,
      // background color
      color: Theme.of(context).backgroundColor,
      child: Padding(
          padding: const EdgeInsets.all(6),
          child: LayoutBuilder(
            builder: (context, dimens) {
              return Column(
                children: [
                  Container(
                    height: dimens.maxHeight * 0.30,
                    width: dimens.maxWidth,
                    child: EmotionInput(),
                  ),
                  SizedBox(
                    height: dimens.maxHeight * 0.70,
                    width: dimens.maxWidth,
                    child: EmotionOutputTabs(),
                  ),
                ],
              );
            },
          )),
    );
  }
}
