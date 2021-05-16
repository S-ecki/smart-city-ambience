import 'package:smart_city_ambience/screens/chats/forum_card.dart';
import 'package:smart_city_ambience/types/enahancedEmoji.dart';

/**
 * 
 */
class ReactionsState {
  Map<String, List<EnhancedEmoji>> enhancedEmojis;
  Map<String, Map<String, List<String>>> comments;
  List<Forum> forumEntries;

  ReactionsState({this.enhancedEmojis, this.comments, this.forumEntries});
}
