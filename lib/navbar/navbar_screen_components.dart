// Button on AppBar of every screen
import 'package:flutter/material.dart';

class OptionsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.more_vert),
      // TODO: add functionality
      onPressed: () {},
    );
  }
}

class EventFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {},
        );
  }
}

class ChatFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {},
        );
  }
}
