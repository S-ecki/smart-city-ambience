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
                children: [
                  //TODO: alignment
                  
                  Image.asset(
                    child.image,
                    height: 100,
                  ),

                  ListTile(
                    title: Text(
                      child.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.fullscreen),
                      onPressed: () {},
                    ),
                  ),
                  Divider(
                    thickness: 1,
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

  Event({@required this.image, this.title});

  getImage() {
    return this.image;
  }
}
