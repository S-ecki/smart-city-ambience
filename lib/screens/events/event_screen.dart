import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_city_ambience/dummyData/dummyEvents.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';
import 'package:smart_city_ambience/routing/smort_routes.dart';
import 'package:smart_city_ambience/screens/events/event_card.dart';

// Screen that shows cards with different content
// it defines background color and makes screen scrollable

int getNrOfComments(Map<String, Map<String, List<String>>> comments, eventId) {
  if (comments.containsKey(eventId)) {
    int count = 0;
    comments[eventId].entries.forEach((mapEntry) {
      count += mapEntry.value.length;
    });
    return count;
  } else
    return 0;
}

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReactionsState,
        Map<String, Map<String, List<String>>>>(
      converter: (store) => store.state.comments,
      builder: (context, Map<String, Map<String, List<String>>> comments) =>
          Container(
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
                nrOfComments:
                    getNrOfComments(comments, dummyEvents[index].eventId),
                showFullDesc: false,
                withBorder: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
