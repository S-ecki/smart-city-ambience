import 'package:flutter/material.dart';
import 'package:smart_city_ambience/screens/eventDetailScreen/bottomCommentContainer.dart';
import 'package:smart_city_ambience/screens/eventDetailScreen/commentSection.dart';
import 'package:smart_city_ambience/screens/events/event_card.dart';

class EventDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Event event = ModalRoute.of(context).settings.arguments as Event;
    final TextEditingController commentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Container(
          
          margin: EdgeInsets.fromLTRB(0, 0, 0, 60),
          child: Column(
            children: [
              EventCard(
                child: event,
                showFullDesc: true,
                withBorder: false,
              ),
              CommentSection(
                eventId: event.eventId,
                label: "Kommentare",
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BottomCommentContainer(
        commentController: commentController,
        eventId: event.eventId,
      ),
    );
  }
}
