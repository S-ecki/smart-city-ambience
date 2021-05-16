import 'package:customtogglebuttons/customtogglebuttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:smart_city_ambience/redux/reactionsState.actions.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';
import 'package:smart_city_ambience/screens/home/emotion_input/emoji_button_home.dart';
import 'package:smart_city_ambience/screens/home/emotion_input/emotion_input_box.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/charts/chart_functions.dart';
import 'package:smart_city_ambience/types/enahancedEmoji.dart';
import 'package:smart_city_ambience/types/word_cloud.dart';

import 'home_text_field.dart';

class EmotionInput extends StatefulWidget {
  const EmotionInput({Key key}) : super(key: key);

  @override
  _EmotionInputState createState() => _EmotionInputState();
}

class _EmotionInputState extends State<EmotionInput> {
  TextEditingController _controller;
  FocusNode _focusNode;

  // used for ToggleButtons
  // initially filled with 12x false - all 12 emojis are not selected
  List<bool> _isSelected;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _isSelected = [for (var _ in emojiReactionList) false];
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            EmotionInputBox(text: "Wie fühlst du dich heute?"),
            Container(
              width: 200,
              alignment: Alignment.center,
              child: CustomToggleButtons(
                fillColor: Colors.grey[200],
                renderBorder: false,
                isSelected: _isSelected,
                // fill with all emojis
                children: <Widget>[
                  for (var emoji in emojiReactionList)
                    EmojiButtonHome(enhancedEmoji: emoji),
                ],
                // alter list<bool> to select emojis
                onPressed: (index) {
                  setState(
                    () {
                      _isSelected[index] = !_isSelected[index];
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10,),
            EmotionInputBox(text: "Verbalisiere deine heutigen Gefühle"),
            SizedBox(height: 15,), 
            HomeTextField(focusNode: _focusNode, controller: _controller),
            // save button
            SizedBox(
              width: 240,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                TextButton(onPressed: () => _onPressedCancel(), child: Text("Abbrechen")),
                ElevatedButton(onPressed: () => _onPressedSave(), child: Text("Speichern")),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onPressedSave() {
    // add entered words to word cloud
    var _provider = Provider.of<WordCloud>(context, listen: false);
    _provider.addWord(_controller.text);

    // clear input and unfocus
    _controller.clear();
    _focusNode.unfocus();
    _notifyScaffold("Gefühl gespeichert.");

    // number of neutral emojis before adding

    for (int i = 0; i < 12; ++i) {
      // should add selected emojis
      if (_isSelected[i]) {
        StoreProvider.of<ReactionsState>(context).dispatch(
          AddReaction(
            enhancedEmoji: emojiReactionList[i],
            eventId: "home",
          ),
        );
      }
      // reset all emojis to unselected
      _isSelected[i] = false;
    }

    // update UI to show unselected emojis
    setState(
      () {},
    );
  }

  void _onPressedCancel() {

    // clear input and unfocus
    _controller.clear();
    _focusNode.unfocus();
    _notifyScaffold("Vorgang abgebrochen.");


    for (int i = 0; i < 12; ++i) {
      // reset all emojis to unselected
      _isSelected[i] = false;
    }

    // update UI to show unselected emojis
    setState(
      () {},
    );
  }



  void _notifyScaffold(String text) {
    // let user know it was saved
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
