import 'package:customtogglebuttons/customtogglebuttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_city_ambience/redux/reactionsState.actions.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';
import 'package:smart_city_ambience/screens/events/event_card.dart';
import 'package:smart_city_ambience/screens/home/emotion_input/emoji_button_home.dart';
import 'package:smart_city_ambience/types/enahancedEmoji.dart';

import 'home_text_field.dart';

class EmotionInput extends StatefulWidget {
  const EmotionInput({Key key}) : super(key: key);

  @override
  _EmotionInputState createState() => _EmotionInputState();
}

class _EmotionInputState extends State<EmotionInput> {
  // Event homeEvent = Event(); // used to declare a home-event in redux
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  // used for ToggleButtons
  // initially filled with 12x false - all 12 emojis are not selected
  List<bool> _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = [for (var _ in emojiReactionList) false];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.fromLTRB(8, 10, 8, 8),
        child: Row(
          children: [
            // emoji toogle buttons
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomToggleButtons(
                    constraints: BoxConstraints(
                      maxHeight: 45,
                      maxWidth: 45,
                    ),
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
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    // textfield
                    HomeTextField(
                        focusNode: _focusNode, controller: _controller),
                    Spacer(),
                    // save button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Eingabe speichern"),
                        IconButton(
                          constraints: BoxConstraints(maxHeight: 35),
                          iconSize: 20,
                          icon: Icon(Icons.save),
                          onPressed: () => _onPressed(),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressed() {
    // TODO: add words provider
    // clear input and unfocus
    _controller.clear();
    _focusNode.unfocus();
    // let user know it was saved
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Gefühl gespeichert."),
      ),
    );
    for (int i = 0; i < 12; ++i) {
      // add to emotion store
      // TODO: works?
      if (_isSelected[i]) {
        StoreProvider.of<ReactionsState>(context).dispatch(
          AddReaction(enhancedEmoji: emojiReactionList[i], eventId: "home"),
        );
      }
      // reset emojis
      _isSelected[i] = false;
    }
    // update UI
    setState(
      () {},
    );
  }
}