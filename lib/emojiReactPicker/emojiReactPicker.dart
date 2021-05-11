import 'package:flutter/material.dart';
import 'package:smart_city_ambience/emojiReactPicker/popupMenuWidget.dart';
import 'package:smart_city_ambience/types/enahancedEmoji.dart';
import 'emojiButton.dart';

/**
 * 
 * 
 */

class EmojiReactPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      iconSize: 24,
      icon: Icon(Icons.apps),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuWidget(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmojiReactRow(
                  emojiType: EmojiType.Positive,
                ),
                EmojiReactRow(
                  emojiType: EmojiType.Neutral,
                ),
                EmojiReactRow(
                  emojiType: EmojiType.Negative,
                ),
              ],
            ),
          )
        ].toList();
      },
    );
  }
}

/**
 * 
 * 
 */
class EmojiReactRow extends StatelessWidget {
  const EmojiReactRow({Key key, this.emojiType}) : super(key: key);

  final EmojiType emojiType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: emojiReactionList
          .where(
              (EnhancedEmoji enhancedEmoji) => enhancedEmoji.type == emojiType)
          .map(
            (EnhancedEmoji enhancedEmoji) => EmojiButton(
              enhancedEmoji: enhancedEmoji,
              variant: EmojiButtonVariant.Button,
            ),
          )
          .toList(),
    );
  }
}
