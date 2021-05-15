// Button on AppBar of every screen
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_city_ambience/redux/reactionsState.actions.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';
import 'package:smart_city_ambience/routing/smort_routes.dart';
import 'package:smart_city_ambience/screens/chats/forum_card.dart';

class OptionsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.0),
      child: PopupMenuButton(
        child: Icon(Icons.more_vert),
        // list starts further down to still see button
        offset: Offset(0, 10),
        // define items statically
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              child: Text("Verhaltenskodex"),
              value: SmortRoutes.rules,
            ),
            PopupMenuItem(
              child: Text("Nutzungsanleitung"),
              value: SmortRoutes.tutorial,
            ),
            PopupMenuItem(
              child: Text("Einstellungen"),
              enabled: false,
              // value: SmortRoutes.tutorial,
            ),
          ];
        },
        // route to selected screen
        onSelected: (value) => Navigator.of(context).pushNamed(value),
      ),
    );
  }
}

class ForumFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReactionsState, List<Forum>>(
      converter: (store) => store.state.forumEntries,
      builder: (context, forumEntries) => FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {},
      ),
    );
  }
}
