import 'package:flutter/material.dart';
import 'package:smart_city_ambience/screens/chats/forum_card.dart';

class ForumDetailScreen extends StatelessWidget {
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Forum forum = ModalRoute.of(context).settings.arguments as Forum;
    return Scaffold(
      appBar: AppBar(
        title: Text("Discussion"),
      ),
      body: ForumCard(
        child: forum,
        showFullDesc: true,
        withBorder: false,
      ),
    );
  }
}
