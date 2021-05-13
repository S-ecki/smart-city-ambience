import 'package:flutter_emoji/flutter_emoji.dart';

/**
 * 
 */
enum EmojiType { Positive, Negative, Neutral }

// get string without "EmojiType." at the front
extension ParseToString on EmojiType {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

/**
 * Extends the Emoji class by a Type
 * to make it easier to find postive, ... emojis
 */
class EnhancedEmoji {
  Emoji emoji;
  EmojiType type;

  EnhancedEmoji({this.emoji, this.type});

  @override
  bool operator ==(dynamic other) {
    if (!(other is EnhancedEmoji)) return false;
    return other.emoji.name == this.emoji.name;
  }
}

/**
 * Currnet List of possible Reactions
 * used in emojiReactPicker
 */
final List<EnhancedEmoji> emojiReactionList = [
  EnhancedEmoji(emoji: Emoji("smiley", "😀"), type: EmojiType.Positive),
  EnhancedEmoji(emoji: Emoji("inLove", "🥰"), type: EmojiType.Positive),
  EnhancedEmoji(emoji: Emoji("party smiley", "🥳"), type: EmojiType.Positive),
  EnhancedEmoji(emoji: Emoji("lauging smiley", "😂"), type: EmojiType.Positive),
  EnhancedEmoji(emoji: Emoji("sleepy smiley", "🥱"), type: EmojiType.Neutral),
  EnhancedEmoji(emoji: Emoji("neutral smiley", "😐"), type: EmojiType.Neutral),
  EnhancedEmoji(emoji: Emoji("big eyes smiley", "🥺"), type: EmojiType.Neutral),
  EnhancedEmoji(
      emoji: Emoji("Shock smiley face", "😲"), type: EmojiType.Neutral),
  EnhancedEmoji(emoji: Emoji("angry smiley", "😡"), type: EmojiType.Negative),
  EnhancedEmoji(
      emoji: Emoji("confused smiley", "😖"), type: EmojiType.Negative),
  EnhancedEmoji(emoji: Emoji("sick smiley", "🤢"), type: EmojiType.Negative),
  EnhancedEmoji(emoji: Emoji("pissed smiley", "😤"), type: EmojiType.Negative)
];
