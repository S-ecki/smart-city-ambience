import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_city_ambience/emojiReactPicker/emojiButton.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';
import 'package:smart_city_ambience/types/enahancedEmoji.dart';

/**
 * 
 * 
 */
class EmojiReactList extends StatelessWidget {
  EmojiReactList({this.currentEventId});

  final String currentEventId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReactionsState, Map<String, List<EnhancedEmoji>>>(
      converter: (store) => store.state.enhancedEmojis,
      builder: (context, Map<String, List<EnhancedEmoji>> reactions) => Row(
        children: [
          ...reactions[currentEventId].map(
            (enhancedEmoji) => EmojiButton(
              enhancedEmoji: enhancedEmoji,
              variant: EmojiButtonVariant.Text,
            ),
          ),
          reactions[currentEventId].length >= 4 ? Text("...") : Text("")
        ],
      ),
    );
  }
}
