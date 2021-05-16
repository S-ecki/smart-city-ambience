// Button on AppBar of every screen
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_city_ambience/redux/reactionsState.actions.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';
import 'package:smart_city_ambience/routing/smort_routes.dart';
import 'package:smart_city_ambience/screens/chats/forum_card.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/smort_slider.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: PopupMenuButton(
          child: Icon(
            Icons.location_pin,
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: SmortSlider(),
            ),
          ],
        ),
      ),
    );
  }
}

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
      title: Text("Erstelle einen neuen Forumeintrag"),
      content: Container(
        child: Column(
          children: [
            TextFormField(
              validator: (String val) =>
                  titleController.text.isEmpty ? "Can't be empty" : null,
              controller: titleController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: "Titel",
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
                labelText: "Beschreibung",
                // ! quick fix: top alignment of prefix icon does not work
                // ! exact padding from bottom to align on pixel 2
                prefixIcon: Padding(
                  padding: EdgeInsets.only(bottom: 57),
                  child: Icon(
                    Icons.description,
                  ),
                ),
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
                    titleController.clear();
                    descriptionController.clear();
                  }
                },
                child: Text(
                  "Forumeintrag hinzufügen",
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
        child: const Icon(Icons.add_comment),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }
}
