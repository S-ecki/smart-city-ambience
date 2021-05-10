import 'package:flutter/material.dart';

class EmotionOutputTabs extends StatelessWidget {
  const EmotionOutputTabs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Emotions of last <7 days>",
                style: Theme.of(context).textTheme.headline6,
              ),
              trailing: IconButton(
                icon: Icon(Icons.access_time_rounded),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  //TODO: implement dropdown
                },
              ),
            ),
            // number of children must correspond to TabView children
            TabBar(
              tabs: [
                Tab(
                  text: "text1",
                ),
                Tab(
                  text: "text2",
                ),
              ],
            ),
            Divider(
              height: 0,
              thickness: 1,
            ),
            // fixed height for Tab content
            SizedBox(
              height: 250,
              child: TabBarView(
                children: [
                  Center(child: Text("Graph 1")),
                  Center(child: Text("Graph 2")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class EmotionOutput extends StatelessWidget {
//   Widget graph;

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, dimens) {return SizedBox(height: dimens, child: graph,)});
//   }
// }
