import 'package:flutter/material.dart';

class EmotionInputBox extends StatelessWidget {
  final String text;
  EmotionInputBox({@required text}) : text = text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
      // color: Colors.grey[200],
      height: 30,
      width: double.infinity,
      alignment: Alignment.centerLeft,
    );
  }
}
