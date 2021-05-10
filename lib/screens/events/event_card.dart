import "package:flutter/material.dart";

// common styling for all Cards
// Card without a header can be achieved by not providing title property

class EventCard extends StatelessWidget {
  final Event child;

  EventCard({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      // cards always take full width
      width: double.infinity,

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        // total padding on every card = 12 (see padding of outer column)
        margin: EdgeInsets.all(6),
        // prevent widget to go over edge of card
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        // return card without header if no title is provided
        child: child.title == null
            ? child
            // otherwise return header with fullscreen icon
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //TODO: alignment
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

                  ListTile(
                    title: Text(
                      child.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      child.description,
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.pink,
                                  size: 24.0,
                                ),
                                Icon(
                                  Icons.audiotrack,
                                  color: Colors.green,
                                  size: 30.0,
                                ),
                                Icon(
                                  Icons.beach_access,
                                  color: Colors.blue,
                                  size: 36.0,
                                ),
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
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: Text('Kommentare (4)'),
                            ),
                          ),
                        ],
                      ),
                    ],
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
  Event({@required this.image, this.title, this.description});
}
