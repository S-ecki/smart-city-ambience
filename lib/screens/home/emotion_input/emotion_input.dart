import 'package:customtogglebuttons/customtogglebuttons.dart';
import 'package:flutter/material.dart';
import 'package:smart_city_ambience/emojiReactList/emojiReactList.dart';
import 'package:smart_city_ambience/emojiReactPicker/emojiReactPicker.dart';
import 'package:smart_city_ambience/screens/events/event_card.dart';
import 'package:smart_city_ambience/screens/home/emotion_input/emoji_button_home.dart';
import 'package:smart_city_ambience/types/enahancedEmoji.dart';

class EmotionInput extends StatefulWidget {
  const EmotionInput({Key key}) : super(key: key);

  @override
  _EmotionInputState createState() => _EmotionInputState();
}

class _EmotionInputState extends State<EmotionInput> {
  Event homeEvent = Event();
  List<bool> _isSelected = [for (var _ in emojiReactionList) false];
  FocusNode _focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomToggleButtons(
                    spacing: 0,
                    runSpacing: 0,
                    constraints: BoxConstraints(
                      maxHeight: 100,
                      maxWidth: 100,
                    ),
                    fillColor: Colors.grey[200],
                    renderBorder: false,
                    isSelected: _isSelected,
                    children: <Widget>[
                      for (var emoji in emojiReactionList)
                        EmojiButtonHome(enhancedEmoji: emoji),
                    ],
                    onPressed: (index) {
                      setState(
                        () {
                          print("new");
                          _isSelected[index] = !_isSelected[index];
                          _isSelected.forEach((element) {
                            print(element);
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    focusNode: _focusNode,
                    controller: _controller,
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintText: "Verbalisiere deine heutigen Gefühle",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Eingabe speichern"),
                      IconButton(
                          icon: Icon(Icons.save),
                          onPressed: () {
                            for (int i = 0; i < 12; ++i) {
                              _isSelected[i] = false;
                            }
                            setState(() {
                              _controller.clear();
                              _focusNode.unfocus();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Gefühl gespeichert."),
                              ));
                            });
                            _isSelected.forEach((element) {
                              print(element);
                            });
                          })
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // return Card(
    //   child: Column(
    //     children: [
    //       ToggleButtons(
    //         children: [
    //           for (int i = 0; i < 12; ++i) EmojiButtonHome(enhancedEmoji: emojiReactionList[i])
    //         ],
    //         isSelected: isSelected,
    //         onPressed: (int index) {
    //           setState(() {
    //             for (int buttonIndex = 0;
    //                 buttonIndex < isSelected.length;
    //                 buttonIndex++) {
    //               if (buttonIndex == index) {
    //                 isSelected[buttonIndex] = !isSelected[buttonIndex];
    //               } else {
    //                 isSelected[buttonIndex] = false;
    //               }
    //             }
    //           });
    //         },
    //       ),
    //       ToggleButtons(
    //         children: [
    //           for (var emoji in emojiReactionList)
    //             EmojiButtonHome(enhancedEmoji: emoji)
    //         ],
    //         isSelected: isSelected,
    //         onPressed: (int index) {
    //           setState(() {
    //             for (int buttonIndex = 0;
    //                 buttonIndex < isSelected.length;
    //                 buttonIndex++) {
    //               if (buttonIndex == index) {
    //                 isSelected[buttonIndex] = !isSelected[buttonIndex];
    //               } else {
    //                 isSelected[buttonIndex] = false;
    //               }
    //             }
    //           });
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
