
import 'package:flutter/material.dart';
import 'package:flutter_scatter/flutter_scatter.dart';
import 'package:provider/provider.dart';
import 'package:smart_city_ambience/types/word_cloud.dart';
import 'package:hashtagable/hashtagable.dart';

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


class ScatterItem extends StatelessWidget {
  ScatterItem(this.hashtag, this.index);
  final HashTagText hashtag;
  final int index;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.body1.copyWith(
          fontSize: hashtag.size.toDouble(),
          color: hashtag.color,
        );
    return RotatedBox(
      quarterTurns: hashtag.rotated ? 1 : 0,
      child: Text(
        hashtag.hashtag,
        style: style,
      ),
    );
  }
}