import 'package:flutter/material.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/charts/bar_chart.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/charts/pie_chart.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/word_cloud.dart';

class EmotionOutputTabs extends StatelessWidget {
  const EmotionOutputTabs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: DefaultTabController(
        length: 3,
        child: LayoutBuilder(
          builder: (_, dimens) {
            return Column(
              children: [
                // SizedBox(
                //   height: dimens.maxHeight * 0.1,
                //   child: ListTile(
                //     title: Text(
                //       "Emotions of last <7 days>",
                //       style: Theme.of(context).textTheme.headline6,
                //     ),
                //     trailing: IconButton(
                //       icon: Icon(Icons.access_time_rounded),
                //       color: Theme.of(context).accentColor,
                //       onPressed: () {
                //         //TODO: implement dropdown
                //       },
                //     ),
                //   ),
                // ),
                // number of children must correspond to TabView children
                SizedBox(
                  height: dimens.maxHeight * 0.15,
                  child: TabBar(
                    tabs: [
                      Tab(
                        text: "Pie Chart",
                      ),
                      Tab(
                        text: "Bar Chart",
                      ),
                      Tab(
                        text: "Word Cloud",
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
                  height: dimens.maxHeight * 0.85,
                  child: TabBarView(
                    children: [
                      Center(child: PieChart()),
                      Center(child: BarChart()),
                      Center(child: WordCloudExample()),
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


