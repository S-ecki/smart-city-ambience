import 'package:flutter/cupertino.dart';
import 'package:smart_city_ambience/dummyData/dummyWords.dart';

// contains words for word cloud
class WordCloud with ChangeNotifier {
  List<String> _words = [...dummyWords];

  List<String> get words {
    return _words;
  }

  // adds words to list
  // if multiple words are passed, they get split on space
  void addWord(String sentence) {
    final words = sentence.split(" ");
    _words.addAll(words);
    notifyListeners();
  }
}
