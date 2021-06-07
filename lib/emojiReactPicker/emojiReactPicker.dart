import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_city_ambience/emojiReactPicker/popupMenuWidget.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';
import 'package:smart_city_ambience/types/enahancedEmoji.dart';
import 'emojiButton.dart';

class EmojiReactPicker extends StatelessWidget {
  EmojiReactPicker({this.eventId});

  final String eventId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReactionsState, Map<String, List<EnhancedEmoji>>>(
      converter: (store) => store.state.enhancedEmojis,
      builder: (context, Map<String, List<EnhancedEmoji>> enhancedEmojis) =>
          PopupMenuButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        iconSize: 24,
        icon: getEmojiCount(enhancedEmojis, eventId) == 0 ? Icon(Icons.emoji_emotions_outlined) : null,
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
      ),
    );
  }
}

int getEmojiCount(
    Map<String, List<EnhancedEmoji>> enhancedEmojis, String eventID) {
  return enhancedEmojis[eventID]?.length ?? 0;
}

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
