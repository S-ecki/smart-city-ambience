import 'package:flutter/material.dart';
import 'commentInput.dart';

class BottomCommentContainer extends StatelessWidget {
  const BottomCommentContainer(
      {Key key, @required this.commentController, this.eventId})
      : super(key: key);

  final TextEditingController commentController;
  final String eventId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: Icon(
                  Icons.person,
                ),
              ),
              margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
            ),
            CommentInput(
              commentController: commentController,
              eventId: eventId,
            ),
          ],
        ),
      ),
    );
  }
}
