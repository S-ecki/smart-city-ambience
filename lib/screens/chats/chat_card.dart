import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ChatCard extends StatelessWidget {
  final Chat child;

  ChatCard({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      // cards always take full width
      width: double.infinity,

      child: Card(
        color: Theme.of(context).backgroundColor,
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
          children: [
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Theme.of(context).primaryColor,
                            size: 24.0,
                          ),
                          Icon(
                            Icons.audiotrack,
                            color: Theme.of(context).primaryColor,
                            size: 24.0,
                          ),
                          Icon(
                            Icons.beach_access,
                            color: Theme.of(context).primaryColor,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Chat {
  final String title;
  //final String comments;

  //Auto generated id
  final String eventId = Uuid().v1();

  Chat({@required this.title});
}
