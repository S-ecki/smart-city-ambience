import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_scatter/flutter_scatter.dart';
import 'package:provider/provider.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/word_cloud/rotated_text.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/word_cloud/word_cloud_colors.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/word_cloud/word_cloud_item.dart';
import 'package:smart_city_ambience/types/word_cloud.dart';

class WordCloudWidget extends StatelessWidget {
  final rand = new Random();

  @override
  Widget build(BuildContext context) {
    // filled with dummy data + input
    List<String> wordList = Provider.of<WordCloud>(context).words;
    List<Widget> widgets = <Widget>[];

    for (var i = 0; i < wordList.length; i++) {
      widgets.add(
        WordCloudItem(
          index: i,
          text: TextWrapper(
              text: wordList[i],
              color: colorList[rand.nextInt(colorList.length)],
              size: rand.nextInt(18) + 12),
        ),
      );
    }

    final screenSize = MediaQuery.of(context).size;
    final ratio = screenSize.width / screenSize.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(6, 6, 0, 0),
          child: SizedBox(
            width: 260,
            child: ListTile(
              title: Text(
                "Verbalisierte Gefühle",
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                "Täglich verbalisierte Emotionen innerhalb des City Radius",
                textScaleFactor: 0.9,
              ),
            ),
          ),
        ),
        Divider(thickness: 1),
        SizedBox(
          child: Center(
            child: FittedBox(
              child: Scatter(
                fillGaps: true,
                delegate: ArchimedeanSpiralScatterDelegate(ratio: ratio),
                children: widgets,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


