import 'package:flutter/material.dart';
import 'package:smart_city_ambience/emojiReactList/emojiReactList.dart';
import 'package:smart_city_ambience/emojiReactPicker/emojiReactPicker.dart';
import 'package:smart_city_ambience/screens/events/event_card.dart';

class EventDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Event event = ModalRoute.of(context).settings.arguments as Event;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Flexible(
              child: EventCard(
                child: event,
                showFullDesc: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
