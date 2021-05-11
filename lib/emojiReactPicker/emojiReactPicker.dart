import 'package:flutter/material.dart';
import 'package:smart_city_ambience/types/enahancedEmoji.dart';

/**
 * 
 * 
 */
class PopupMenuWidget<T> extends PopupMenuEntry<T> {
  const PopupMenuWidget({Key key, this.height, this.child}) : super(key: key);

  @override
  final Widget child;

  @override
  final double height;

  @override
  bool get enabled => false;

  @override
  _PopupMenuWidgetState createState() => new _PopupMenuWidgetState();

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _PopupMenuWidgetState extends State<PopupMenuWidget> {
  @override
  Widget build(BuildContext context) => widget.child;
}

/**
 * 
 * 
 */

class EmojiReactPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      iconSize: 24,
      icon: Icon(Icons.apps),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuWidget(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmojiReactRow(
                  emojiType: EmojiType.Positive,
                ),
                EmojiReactRow(
                  emojiType: EmojiType.Neutral,
                ),
                EmojiReactRow(
                  emojiType: EmojiType.Negative,
                ),
              ],
            ),
          )
        ].toList();
      },
    );
  }
}

/**
 * 
 */
class EmojiReactRow extends StatelessWidget {
  const EmojiReactRow({Key key, this.emojiType}) : super(key: key);

  final EmojiType emojiType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: emojiReactionList
          .where(
              (EnhancedEmoji enhancedEmoji) => enhancedEmoji.type == emojiType)
          .map(
            (EnhancedEmoji enhancedEmoji) => InkWell(
                child: Container(
                  child: Text(
                    enhancedEmoji.emoji.code,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                }),
          )
          .toList(),
    );
  }
}
