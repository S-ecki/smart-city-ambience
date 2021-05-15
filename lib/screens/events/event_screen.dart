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
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ListView.separated(
          itemCount: dummyEvents.length,
          separatorBuilder: (context, index) => SizedBox(
            height: 20,
          ),
          itemBuilder: (BuildContext context, int index) => InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(SmortRoutes.eventDetailScreen,
                  arguments: dummyEvents[index]);
            },
            child: EventCard(
              child: dummyEvents[index],
              showFullDesc: false,
              withBorder: true,
            ),
          ),
        ),
      ),
    );
  }
}
