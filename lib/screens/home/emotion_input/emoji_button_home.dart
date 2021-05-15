import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_city_ambience/emojiReactPicker/emojiButton.dart';
import 'package:smart_city_ambience/redux/reactionsState.actions.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';
import 'package:smart_city_ambience/types/enahancedEmoji.dart';


class EmojiButtonHome extends StatelessWidget {
  const EmojiButtonHome({Key key, this.enhancedEmoji}) : super(key: key);
  final EnhancedEmoji enhancedEmoji;
  final eventId = "daily-emotion";


  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReactionsState, Map<String, List<EnhancedEmoji>>>(
      converter: (store) => store.state.enhancedEmojis,
      builder: (context, Map<String, List<EnhancedEmoji>> enhancedEmojis) {
        return Container(
          width: null,
          child: Text(
            
            enhancedEmoji.emoji.code,
            style: TextStyle(fontSize: 13),
          ),
        );
      },
    );
  }
}
