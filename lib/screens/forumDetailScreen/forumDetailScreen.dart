import 'package:flutter/material.dart';
import 'package:smart_city_ambience/screens/chats/forum_card.dart';
import 'package:smart_city_ambience/screens/eventDetailScreen/bottomCommentContainer.dart';
import 'package:smart_city_ambience/screens/eventDetailScreen/commentSection.dart';

class ForumDetailScreen extends StatelessWidget {
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Forum forum = ModalRoute.of(context).settings.arguments as Forum;
    return Scaffold(
      appBar: AppBar(
        title: Text("Discussion"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 60),
          child: Column(
            children: [
              ForumCard(
                child: forum,
                showFullDesc: true,
                withBorder: false,
              ),
              CommentSection(
                eventId: forum.forumId,
                label: "Diskussion",
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BottomCommentContainer(
        commentController: commentController,
        eventId: forum.forumId,
      ),
    );
  }
}
