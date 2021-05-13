import "package:flutter/material.dart";
import 'package:smart_city_ambience/emojiReactList/emojiReactList.dart';
import 'package:smart_city_ambience/emojiReactPicker/emojiReactPicker.dart';
import 'package:uuid/uuid.dart';

// common styling for all Cards
// Card without a header can be achieved by not providing title property

class EventCard extends StatelessWidget {
  final Event child;
  final bool showFullDesc;

  EventCard({@required this.child, this.showFullDesc});

  @override
  Widget build(BuildContext context) {
    return Container(
      // cards always take full width
      width: double.infinity,

      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 4.0, color: Theme.of(context).accentColor),
          borderRadius: BorderRadius.circular(15.0),
        ),
        // total padding on every card = 12 (see padding of outer column)
        margin: EdgeInsets.all(6),
        // prevent widget to go over edge of card
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        // return card without header if no title is provided
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(child.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Image(
              image: AssetImage(child.image),
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  child.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  child.description,
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 3,
                  overflow: showFullDesc ? null : TextOverflow.ellipsis,
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
                            eventId: child.eventId,
                          ),
                          EmojiReactPicker(
                            eventId: child.eventId,
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
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          'Kommentare (4)',
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
            ),
          ],
        ),
      ),
    );
  }
}

class Event {
  final String image;
  final String title;
  //final String comments;
  final String description;

  //Auto generated id
  final String eventId = Uuid().v1();

  Event({@required this.image, this.title, this.description});
}
