import 'package:flutter/material.dart';
import 'package:smart_city_ambience/screens/home/emotion_input/emotion_input.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/emotion_output_tabs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

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
                  SizedBox(
                    height: dimens.maxHeight * 0.27,
                    width: dimens.maxWidth,
                    child: EmotionInput(),
                  ),
                  SizedBox(
                    height: dimens.maxHeight * 0.73,
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
