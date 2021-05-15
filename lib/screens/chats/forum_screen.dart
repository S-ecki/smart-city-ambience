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
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ListView.separated(
          itemBuilder: (context, index) => ForumCard(
            child: dummyForumEntries[index],
            showFullDesc: false,
            withBorder: true,
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 20,
          ),
          itemCount: dummyForumEntries.length,
        ),
      ),
    );
  }
}
