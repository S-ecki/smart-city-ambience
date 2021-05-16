import 'package:flutter/material.dart';
import 'package:smart_city_ambience/screens/home/emotion_input/emotion_input.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/emotion_output_tabs.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/word_cloud_widget.dart';
import 'package:smart_city_ambience/types/word_cloud.dart';

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
      child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(6),
            child: LayoutBuilder(
              builder: (context, dimens) {
                return Column(
                  children: [
                    SizedBox(
                      width: dimens.maxWidth,
                      child: EmotionInput(),
                    ),
                    SizedBox(
                      height: 400,
                      width: dimens.maxWidth,
                      child: EmotionOutputTabs(),
                    ),
                    SizedBox(
                      height: 300,
                      width: dimens.maxWidth,
                      child: Card(child: WordCloudWidget()),
                    )
                  ],
                );
              },
            )),
      ),
    );
  }
}
