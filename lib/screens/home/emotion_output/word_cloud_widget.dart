import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_scatter/flutter_scatter.dart';
import 'package:provider/provider.dart';
import 'package:smart_city_ambience/types/word_cloud.dart';

class WordCloudWidget extends StatelessWidget {
  List<Color> colorList = [
    Color(0xFF42A5F5),
    Color(0xFF1A237E),
    Color(0xFF4E342E),
    Color(0xFFAA00FF),
    Color(0xFF00B8D4),
    Color(0xFF1B5E20),
    Color(0xFFF57F17),
    Color(0xFFB71C1c),
  ];
  Random rand = new Random();
  @override
  Widget build(BuildContext context) {
    List<String> wordList = Provider.of<WordCloud>(context).words;
    List<Widget> widgets = <Widget>[];

    for (var i = 0; i < wordList.length; i++) {
      widgets.add(ScatterItem(
          text: RotatedText(
              text: wordList[i],
              color: colorList[rand.nextInt(colorList.length)],
              size: rand.nextInt(25) + 15),
          index: i));
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
        Divider(thickness: 1,),
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

class ScatterItem extends StatelessWidget {
  ScatterItem({this.text, this.index});
  final RotatedText text;
  final int index;
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.bodyText2.copyWith(
          fontSize: text.size.toDouble(),
          color: text.color,
        );
    return RotatedBox(
      quarterTurns: random.nextInt(2),
      child: Text(
        text.text,
        style: style,
      ),
    );
  }
}

class RotatedText {
  const RotatedText({
    this.text,
    this.color,
    this.size,
  });
  final String text;
  final Color color;
  final int size;
}
