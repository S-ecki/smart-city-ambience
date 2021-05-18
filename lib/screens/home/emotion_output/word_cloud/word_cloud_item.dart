import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/word_cloud/rotated_text.dart';

class WordCloudItem extends StatelessWidget {
  WordCloudItem({this.text, this.index});
  final TextWrapper text;
  final int index;
  final random = new Random();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyText2.copyWith(
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
