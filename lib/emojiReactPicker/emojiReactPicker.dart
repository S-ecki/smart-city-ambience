import 'package:flutter/material.dart';
import 'package:smart_city_ambience/emojiReactPicker/popupMenuWidget.dart';
import 'package:smart_city_ambience/types/enahancedEmoji.dart';
import 'emojiButton.dart';

/**
 * 
 * 
 */

class EmojiReactPicker extends StatelessWidget {
  EmojiReactPicker({this.eventId});

  final String eventId;

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
                  eventId: eventId,
                ),
                EmojiReactRow(
                  emojiType: EmojiType.Neutral,
                  eventId: eventId,
                ),
                EmojiReactRow(
                  emojiType: EmojiType.Negative,
                  eventId: eventId,
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
  const EmojiReactRow({Key key, this.emojiType, this.eventId})
      : super(key: key);

  final EmojiType emojiType;
  final String eventId;

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
              eventId: eventId,
            ),
          )
          .toList(),
    );
  }
}
