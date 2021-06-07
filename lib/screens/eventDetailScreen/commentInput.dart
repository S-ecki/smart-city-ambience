import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_city_ambience/redux/reactionsState.actions.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';
import 'package:provider/provider.dart';

class CommentInput extends StatelessWidget {
  CommentInput({Key key, @required this.commentController, this.eventId})
      : super(key: key);

  final TextEditingController commentController;
  final FocusNode commentFocusNode = FocusNode();
  final String eventId;

  void handleOnSave(BuildContext context, User user) {
    if (commentController.text.isEmpty) return;
    StoreProvider.of<ReactionsState>(context).dispatch(
      AddComment(
        eventId: eventId,
        comment: commentController.text,
        userName: user != null && user.email.length >= 0
            ? user.email.split("@")[0]
            : "anonym",
      ),
    );
    commentFocusNode.unfocus();
    commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var user = context.watch<User>();
    return StoreConnector<ReactionsState,
        Map<String, Map<String, List<String>>>>(
      converter: (store) => store.state.comments,
      builder: (context, Map<String, Map<String, List<String>>> comments) =>
          Flexible(
        child: TextFormField(
          onFieldSubmitted: (String val) => handleOnSave(context, user),
          focusNode: commentFocusNode,
          controller: commentController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            hintText: "Kommentar...",
            isDense: true,
            suffixIcon: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => handleOnSave(context, user),
              child: Icon(Icons.send),
            ),
          ),
        ),
      ),
    );
  }
}
