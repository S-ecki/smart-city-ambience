import 'package:flutter/material.dart';
import 'package:smart_city_ambience/screens/home/charts/pie_chart.dart';

class EmotionOutputTabs extends StatelessWidget {
  const EmotionOutputTabs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: DefaultTabController(
        length: 2,
        child: LayoutBuilder(
          builder: (_, dimens) {
            return Column(
              children: [
                SizedBox(
                  height: dimens.maxHeight * 0.1,
                  child: ListTile(
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
                ),
                // number of children must correspond to TabView children
                SizedBox(
                  height: dimens.maxHeight * 0.1,
                  child: TabBar(
                    tabs: [
                      Tab(
                        text: "Pie Chart",
                      ),
                      Tab(
                        text: "text2",
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0,
                  thickness: 1,
                ),
                // fixed height for Tab content
                SizedBox(
                  height: dimens.maxHeight * 0.8,
                  child: TabBarView(
                    children: [
                      Center(child: PieChart()),
                      Center(child: Text("")),
                    ],
                  ),
                )
              ],
            );
          },
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
