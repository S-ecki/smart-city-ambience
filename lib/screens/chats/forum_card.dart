import 'package:flutter/material.dart';
import 'package:smart_city_ambience/emojiReactList/emojiReactList.dart';
import 'package:smart_city_ambience/emojiReactPicker/emojiReactPicker.dart';
import 'package:uuid/uuid.dart';

class ForumCard extends StatelessWidget {
  final Forum child;
  final bool showFullDesc;
  final bool withBorder;
  final int nrOfComments;

  ForumCard(
      {@required this.child,
      this.showFullDesc,
      this.withBorder,
      this.nrOfComments});

  @override
  Widget build(BuildContext context) {
    return Container(
      // cards always take full width
      width: double.infinity,

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              withBorder ? BorderRadius.circular(15.0) : BorderRadius.zero,
        ),
        // total padding on every card = 12 (see padding of outer column)
        margin: withBorder
            ? EdgeInsets.all(6)
            : EdgeInsets.only(left: 4, right: 4, top: 6, bottom: 0),
        // prevent widget to go over edge of card
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        // return card without header if no title is provided
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]),
          ),
          child: Column(
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          child.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: PopupMenuButton(
                          child: Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: "report",
                              child: Text('Beitrag melden'),
                            ),
                          ],
                          onSelected: (value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Beitrag wurde gemeldet."),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      child.description,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: showFullDesc ? 100 : 3,
                      overflow: showFullDesc ? null : TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: [
                            EmojiReactList(
                              eventId: child.forumId,
                            ),
                            EmojiReactPicker(
                              eventId: child.forumId,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: withBorder
                                ? Theme.of(context).primaryColor
                                : Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            withBorder
                                ? "Kommentare (" + nrOfComments.toString() + ")"
                                : "",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Forum {
  final String title;
  final String description;

  //Auto generated id
  final String forumId = Uuid().v1();

  Forum({@required this.title, @required this.description});
}
