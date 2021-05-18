import 'package:flutter/material.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/charts/bar_chart.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/charts/pie_chart.dart';

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 6, 0, 0),
                  child: SizedBox(
                    width: 350,
                    height: dimens.maxHeight * 0.15,
                    child: ListTile(
                        title: Text(
                          "Aufschlüsselung der Gefühle",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        subtitle: Text("Anzahl der täglichen Emotionen und Reaktionen auf Beiträge innerhalb des City Radius", textScaleFactor: 0.9,),
                    ),
                  ),
                ),
                // number of children must correspond to TabView children
                SizedBox(
                  child: TabBar(
                    tabs: [
                      Tab(
                        text: "Dieses Monat",
                      ),
                      Tab(
                        text: "Dieses Jahr",
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
                  height: dimens.maxHeight * 0.7,
                  child: TabBarView(
                    children: [
                      Center(child: PieChart()),
                      Center(child: BarChart()),
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
