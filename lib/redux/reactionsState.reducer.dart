import 'package:smart_city_ambience/redux/reactionsState.actions.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';

/**
 * 
 */
ReactionsState reactionsStateReducer(
    ReactionsState currentState, dynamic action) {
  if (action is AddReaction) {
    if (!currentState.enhancedEmojis.containsKey(action.eventId)) {
      currentState.enhancedEmojis[action.eventId] = [];
    }
    currentState.enhancedEmojis[action.eventId]
        ?.insert(0, action.enhancedEmoji);
    return ReactionsState(
      enhancedEmojis: currentState.enhancedEmojis,
      comments: currentState.comments,
      forumEntries: currentState.forumEntries,
    );
  }
  if (action is RemoveReaction) {
    currentState.enhancedEmojis[action.eventId].removeWhere((enhancedEmoji) =>
        enhancedEmoji.emoji.name == action.enhancedEmoji.emoji.name);
    return ReactionsState(
      enhancedEmojis: currentState.enhancedEmojis,
      comments: currentState.comments,
      forumEntries: currentState.forumEntries,
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
      forumEntries: currentState.forumEntries,
    );
  }
  if (action is AddForumEntry) {
    currentState.comments[action.forum.forumId] = {};
    return ReactionsState(
      enhancedEmojis: currentState.enhancedEmojis,
      comments: currentState.comments,
      forumEntries: currentState.forumEntries + [action.forum],
    );
  }
  return currentState;
}
