import 'package:smart_city_ambience/redux/reactionsState.actions.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';

/**
 * 
 */
ReactionsState reactionsStateReducer(
    ReactionsState currentState, dynamic action) {
  if (action is AddReaction) {
    print(action.eventId);
    print(action.enhancedEmoji);
    currentState.enhancedEmojis[action.eventId]
        ?.insert(0, action.enhancedEmoji);
    return ReactionsState(
      enhancedEmojis: currentState.enhancedEmojis,
      comments: currentState.comments,
    );
  }
  if (action is RemoveReaction) {
    currentState.enhancedEmojis[action.eventId].removeWhere((enhancedEmoji) =>
        enhancedEmoji.emoji.name == action.enhancedEmoji.emoji.name);
    return ReactionsState(
      enhancedEmojis: currentState.enhancedEmojis,
      comments: currentState.comments,
    );
  }
  if (action is AddComment) {
    if (currentState.comments[action.eventId].containsKey(action.userName)) {
      currentState.comments[action.eventId][action.userName]
          .add(action.comment);
    } else {
      currentState.comments[action.eventId][action.userName] = [action.comment];
    }
    return ReactionsState(
      enhancedEmojis: currentState.enhancedEmojis,
      comments: currentState.comments,
    );
  }
  return currentState;
}
