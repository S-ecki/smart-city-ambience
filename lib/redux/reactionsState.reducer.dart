import 'package:smart_city_ambience/redux/reactionsState.actions.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';

/**
 * 
 */
ReactionsState reactionsStateReducer(
    ReactionsState currentState, dynamic action) {
  if (action is AddReaction) {
    currentState.enhancedEmojis[action.eventId]
        ?.insert(0, action.enhancedEmoji);
    return ReactionsState(
      enhancedEmojis: currentState.enhancedEmojis,
    );
  }
  if (action is RemoveReaction) {
    currentState.enhancedEmojis[action.eventId].removeWhere((enhancedEmoji) =>
        enhancedEmoji.emoji.name == action.enhancedEmoji.emoji.name);
    return ReactionsState(
      enhancedEmojis: currentState.enhancedEmojis,
    );
  }
  return currentState;
}
