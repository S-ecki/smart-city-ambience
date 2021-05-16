import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';
import 'package:smart_city_ambience/routing/smort_routes.dart';
import 'package:smart_city_ambience/screens/chats/forum_card.dart';
import 'package:smart_city_ambience/screens/events/event_screen.dart';

class ForumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReactionsState, ReactionsState>(
      converter: (store) => store.state,
      builder: (context, ReactionsState state) => Container(
        // ScrollView (child) takes all the space it needs
        width: double.infinity,
        height: double.infinity,
        // background color
        color: Theme.of(context).backgroundColor,
        // this makes the column scrollable -> prevents pixel overflow on smaller phones
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox.shrink(),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(SmortRoutes.forumDetailScreen,
                    arguments: state.forumEntries[index]);
              },
              child: ForumCard(
                child: state.forumEntries[index],
                showFullDesc: false,
                withBorder: true,
                nrOfComments: getNrOfComments(
                    state.comments, state.forumEntries[index].forumId),
              ),
            ),
            itemCount: state.forumEntries.length,
          ),
        ),
      ),
    );
  }
}
