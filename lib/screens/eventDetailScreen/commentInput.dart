import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_city_ambience/redux/reactionsState.actions.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';

class CommentInput extends StatelessWidget {
  CommentInput({Key key, @required this.commentController, this.eventId})
      : super(key: key);

  final TextEditingController commentController;
  final FocusNode commentFocusNode = FocusNode();
  final String eventId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReactionsState,
        Map<String, Map<String, List<String>>>>(
      converter: (store) => store.state.comments,
      builder: (context, Map<String, Map<String, List<String>>> comments) =>
          Flexible(
        child: TextFormField(
          focusNode: commentFocusNode,
          controller: commentController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            hintText: "Kommentar...",
            isDense: true,
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            suffixIcon: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                if (commentController.text.isEmpty) return;
                StoreProvider.of<ReactionsState>(context).dispatch(
                  AddComment(
                    eventId: eventId,
                    comment: commentController.text,
                    userName: "Current User",
                  ),
                );
                commentFocusNode.unfocus();
                commentController.clear();
              },
              child: Icon(Icons.post_add),
            ),
          ),
        ),
      ),
    );
  }
}
