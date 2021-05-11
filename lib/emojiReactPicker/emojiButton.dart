import 'package:flutter/material.dart';
import 'package:smart_city_ambience/types/enahancedEmoji.dart';

/**
 * 
 * 
 */
enum EmojiButtonVariant { Button, Text }

/**
 * 
 * 
 */
class EmojiButton extends StatelessWidget {
  const EmojiButton({Key key, this.enhancedEmoji, this.variant})
      : super(key: key);

  final EnhancedEmoji enhancedEmoji;
  final EmojiButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Text(
          enhancedEmoji.emoji.code,
          style: TextStyle(fontSize: 24),
        ),
      ),
      onTap: () {
        if (variant == EmojiButtonVariant.Button) Navigator.pop(context);
      },
    );
  }
}
