import 'package:smart_city_ambience/screens/chats/forum_card.dart';
import 'package:smart_city_ambience/types/enahancedEmoji.dart';
import 'package:smart_city_ambience/types/enhancedUser.dart';

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

/**
 * 
 */
class AddComment {
  final String comment;
  final String userName;
  final String eventId;

  AddComment({this.userName, this.comment, this.eventId});
}

/**
 * 
 */
class AddForumEntry {
  final Forum forum;

  AddForumEntry({this.forum});
}

/**
 * 
 */
class UpdateUserInformation {
  final EnhancedUser newUser;

  UpdateUserInformation({this.newUser});
}
