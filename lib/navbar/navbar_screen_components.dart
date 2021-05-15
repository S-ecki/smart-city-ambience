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
  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      title: Text("Add a new Discussion"),
      content: Container(
        child: Column(
          children: [
            TextFormField(
              validator: (String val) =>
                  titleController.text.isEmpty ? "Can't be empty" : null,
              autovalidate: true,
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: "Title",
                prefixIcon: Icon(
                  Icons.title_rounded,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              minLines: 4,
              maxLines: 6,
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: "Description",
                alignLabelWithHint: true,
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty) {
                    StoreProvider.of<ReactionsState>(context).dispatch(
                      AddForumEntry(
                        forum: Forum(
                          title: titleController.text,
                          description: descriptionController.text,
                        ),
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                },
                child: Text(
                  "Add Discussion",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).accentColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReactionsState, List<Forum>>(
      converter: (store) => store.state.forumEntries,
      builder: (context, forumEntries) => FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }
}
