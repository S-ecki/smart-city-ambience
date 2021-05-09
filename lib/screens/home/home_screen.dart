import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // ScrollView (child) takes all the space it needs
      width: double.infinity,
      height: double.infinity,
      // background color
      color: Theme.of(context).backgroundColor,
      // this makes the column scrollable -> prevents pixel overflow on smaller phones
      child: SingleChildScrollView(
        // distributing padding between outer container (here) and cards makes
        // sure that padding on the edges and in between cards is the same
        // resulting padding = 12
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(children: [
            Card(child: Text("hi"),),
            Card(child: Text("hi"),),
          ],),
        ),
      ),
    );
  }
}
