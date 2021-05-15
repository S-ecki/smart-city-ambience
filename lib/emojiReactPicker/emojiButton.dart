import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_city_ambience/redux/reactionsState.actions.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';
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
  const EmojiButton({Key key, this.enhancedEmoji, this.variant, this.eventId})
      : super(key: key);

  final EnhancedEmoji enhancedEmoji;
  final EmojiButtonVariant variant;
  final String eventId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReactionsState, Map<String, List<EnhancedEmoji>>>(
      converter: (store) => store.state.enhancedEmojis,
      builder: (context, Map<String, List<EnhancedEmoji>> enhancedEmojis) {
        print(eventId);
        return InkWell(
          child: Container(
            width: variant == EmojiButtonVariant.Text ? 40 : null,
            child: variant == EmojiButtonVariant.Text
                ? Badge(
                    position: BadgePosition.topEnd(top: -10, end: -2),
                    badgeColor: Colors.grey[150],
                    badgeContent: Text(
                      enhancedEmojis[eventId]
                          .where((element) =>
                              element.emoji.name == enhancedEmoji.emoji.name)
                          .length
                          .toString(),
                      style: TextStyle(fontSize: 8),
                    ),
                    child: Text(
                      enhancedEmoji.emoji.code,
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : Text(
                    enhancedEmoji.emoji.code,
                    style: TextStyle(fontSize: 20),
                  ),
          ),
          // use this to add to store, eventid fixed
          onTap: () {
            if (variant == EmojiButtonVariant.Button) {
              Navigator.pop(context);
              StoreProvider.of<ReactionsState>(context).dispatch(
                  AddReaction(enhancedEmoji: enhancedEmoji, eventId: eventId));
            }
          },
        );
      },
    );
  }
}
