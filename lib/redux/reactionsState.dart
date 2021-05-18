import 'package:smart_city_ambience/screens/chats/forum_card.dart';
import 'package:smart_city_ambience/types/enahancedEmoji.dart';
import 'package:smart_city_ambience/types/enhancedUser.dart';

/**
 * 
 */
class ReactionsState {
  Map<String, List<EnhancedEmoji>> enhancedEmojis;
  Map<String, Map<String, List<String>>> comments;
  List<Forum> forumEntries;
  EnhancedUser user;

  ReactionsState(
      {this.enhancedEmojis, this.comments, this.forumEntries, this.user});
}
