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
  EmojiReactList({this.eventId});

  final String eventId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReactionsState, Map<String, List<EnhancedEmoji>>>(
        converter: (store) => store.state.enhancedEmojis,
        builder: (context, Map<String, List<EnhancedEmoji>> reactions) {
          print(reactions);
          List<EnhancedEmoji> emojisOfEvent = reactions.containsKey(eventId)
              ? reactions[eventId].toSet().toList()
              : [];
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: emojisOfEvent
                    .getRange(
                        0, emojisOfEvent.length > 3 ? 3 : emojisOfEvent.length)
                    .map(
                      (enhancedEmoji) => EmojiButton(
                        enhancedEmoji: enhancedEmoji,
                        variant: EmojiButtonVariant.Text,
                        eventId: eventId,
                      ),
                    )
                    .toList(),
              ),
              emojisOfEvent.length > 3 ? Text("...") : Text("")
            ],
          );
        });
  }
}
