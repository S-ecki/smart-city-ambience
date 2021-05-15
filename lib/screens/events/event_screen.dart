import "package:flutter/material.dart";
import 'package:smart_city_ambience/dummyData/dummyEvents.dart';
import 'package:smart_city_ambience/routing/smort_routes.dart';
import 'package:smart_city_ambience/screens/events/event_card.dart';

// Screen that shows cards with different content
// it defines background color and makes screen scrollable

class EventScreen extends StatelessWidget {
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
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(SmortRoutes.eventDetailScreen,
                      arguments: dummyEvents[0]);
                },
                child: EventCard(
                  child: dummyEvents[0],
                  showFullDesc: false,
                  withBorder: true,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(SmortRoutes.eventDetailScreen,
                      arguments: dummyEvents[1]);
                },
                child: EventCard(
                  child: dummyEvents[1],
                  showFullDesc: false,
                  withBorder: true,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(SmortRoutes.eventDetailScreen,
                      arguments: dummyEvents[2]);
                },
                child: EventCard(
                  child: dummyEvents[2],
                  showFullDesc: false,
                  withBorder: true,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(SmortRoutes.eventDetailScreen,
                      arguments: dummyEvents[3]);
                },
                child: EventCard(
                  child: dummyEvents[3],
                  showFullDesc: false,
                  withBorder: true,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(SmortRoutes.eventDetailScreen,
                      arguments: dummyEvents[4]);
                },
                child: EventCard(
                  child: dummyEvents[4],
                  showFullDesc: false,
                  withBorder: true,
                ),
              ),
                            InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(SmortRoutes.eventDetailScreen,
                      arguments: dummyEvents[5]);
                },
                child: EventCard(
                  child: dummyEvents[5],
                  showFullDesc: false,
                  withBorder: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  