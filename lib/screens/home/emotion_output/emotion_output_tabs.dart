import 'package:flutter/material.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/charts/bar_chart.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/charts/pie_chart.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/smort_slider.dart';

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
                  // height: dimens.maxHeight * 0.1,
                  child: ListTile(
                      title: Text(
                        "Aufschlüsselung der Gefühle",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.all(2),
                        child: PopupMenuButton(
                          child: Icon(
                            Icons.location_pin,
                            color: Theme.of(context).accentColor,
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: SmortSlider(),
                            ),
                          ],
                        ),
                      )),
                ),
                // number of children must correspond to TabView children
                SizedBox(
                  // height: dimens.maxHeight * 0.15,
                  child: TabBar(
                    tabs: [
                      Tab(
                        text: "Dieser Monat",
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
                  height: dimens.maxHeight * 0.75,
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
