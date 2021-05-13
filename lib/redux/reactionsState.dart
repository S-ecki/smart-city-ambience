import 'package:smart_city_ambience/types/enahancedEmoji.dart';

/**
 * 
 */
class ReactionsState {
  Map<String, List<EnhancedEmoji>> enhancedEmojis;
  Map<String, Map<String, List<String>>> comments;

  ReactionsState({this.enhancedEmojis, this.comments});
}
