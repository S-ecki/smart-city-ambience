import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_city_ambience/dummyData/dummyChats.dart';
import 'package:smart_city_ambience/dummyData/dummyEvents.dart';
import 'package:smart_city_ambience/routing/smort_routes.dart';
import 'package:smart_city_ambience/screens/chats/chat_card.dart';
import 'package:smart_city_ambience/screens/events/event_card.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // ScrollView (child) takes all the space it needs
      width: double.infinity,
      height: double.infinity,
      // background color
      color: Theme.of(context).backgroundColor,
      // this makes the column scrollable -> prevents pixel overflow on smaller phones
      child: SingleChildScrollView(
        // distributing padding between outer container (here) and cards makes
        // sure that padding on the edges and in between cards is the same
        // resulting padding = 12
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              ChatCard(
                child: dummyChats[0],
              ),
              ChatCard(child: dummyChats[1]),
              ChatCard(
                child: dummyChats[2],
              ),
              ChatCard(
                child: dummyChats[3],
              ),

              /*
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(SmortRoutes.eventDetailScreen,
                      arguments: dummyEvents[0]);
                },
                child: EventCard(child: dummyEvents[0]),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(SmortRoutes.eventDetailScreen,
                      arguments: dummyEvents[0]);
                },
                child: EventCard(child: dummyEvents[1]),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
