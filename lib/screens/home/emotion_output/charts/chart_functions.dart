// counts the types of emojis
// simply pass in the Map that you get from the redux store with the type
import 'package:smart_city_ambience/types/enahancedEmoji.dart';

int getEmojiCount(
    EmojiType type, Map<String, List<EnhancedEmoji>> enhancedEmojis) {
  List<List<EnhancedEmoji>> entryList =
      enhancedEmojis.entries.map((mapEntry) => mapEntry.value).toList();
  int count = 0;
  entryList.forEach((list) {
    list.forEach((element) {
      if (element.type == type) count++;
    });
  });
  return count;
}
