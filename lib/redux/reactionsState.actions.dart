import 'package:smart_city_ambience/types/enahancedEmoji.dart';

/**
 * 
 */
class AddReaction {
  final EnhancedEmoji enhancedEmoji;
  final String eventId;

  AddReaction({this.enhancedEmoji, this.eventId});
}

/**
 * 
 */
class RemoveReaction {
  final EnhancedEmoji enhancedEmoji;
  final String eventId;

  RemoveReaction({this.enhancedEmoji, this.eventId});
}
