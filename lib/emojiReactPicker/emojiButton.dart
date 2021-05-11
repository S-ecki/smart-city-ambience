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
      builder: (context, Map<String, List<EnhancedEmoji>> enhancedEmojis) =>
          InkWell(
        child: Container(
          child: Text(
            enhancedEmoji.emoji.code,
            style: TextStyle(fontSize: 24),
          ),
        ),
        onTap: () {
          if (variant == EmojiButtonVariant.Button) {
            Navigator.pop(context);
            StoreProvider.of<ReactionsState>(context).dispatch(
                AddReaction(enhancedEmoji: enhancedEmoji, eventId: eventId));
          }
        },
      ),
    );
  }
}
