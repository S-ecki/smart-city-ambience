import "package:flutter/material.dart";

// common styling for all Cards
// Card without a header can be achieved by not providing title property

class EventCard extends StatelessWidget {
  final Widget child;
  final String title;

  EventCard({@required this.child, this.title});

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
        child: title == null
            ? child
            // otherwise return header with fullscreen icon
            : Column(
                children: [
                  ListTile(
                    title: Text(
                      title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.fullscreen),
                      onPressed: () {
                      },
                    ),
                  ),
                  Divider(thickness: 1,),
                  child,
                ],
              ),
      ),
    );
  }
}
