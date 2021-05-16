
import 'package:flutter/material.dart';
import 'package:flutter_scatter/flutter_scatter.dart';
import 'package:provider/provider.dart';
import 'package:smart_city_ambience/types/word_cloud.dart';

class WordCloudWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> wordList = Provider.of<WordCloud>(context).words;
    List<Widget> widgets = <Widget>[];

    for (var i = 0; i < wordList.length; i++) {
      widgets.add(Text(wordList[i]));
    }

    final screenSize = MediaQuery.of(context).size;
    final ratio = screenSize.width / screenSize.height;

    return Center(
      child: FittedBox(
        child: Scatter(
          fillGaps: true,
          delegate: ArchimedeanSpiralScatterDelegate(ratio: ratio),
          children: widgets,
        ),
      ),
    );
  }
}