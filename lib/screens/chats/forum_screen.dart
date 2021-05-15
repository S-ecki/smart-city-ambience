import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_city_ambience/dummyData/dummyForumEntries.dart';
import 'package:smart_city_ambience/screens/chats/forum_card.dart';

class ForumScreen extends StatelessWidget {
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
              ForumCard(
                child: dummyForumEntries[0],
                showFullDesc: false,
                withBorder: true,
              ),
              ForumCard(
                child: dummyForumEntries[1],
                showFullDesc: false,
                withBorder: true,
              ),
              ForumCard(
                child: dummyForumEntries[2],
                showFullDesc: false,
                withBorder: true,
              ),
              ForumCard(
                child: dummyForumEntries[3],
                showFullDesc: false,
                withBorder: true,
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
