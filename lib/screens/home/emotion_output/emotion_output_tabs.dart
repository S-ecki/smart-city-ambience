import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_scatter/flutter_scatter.dart';
import 'package:provider/provider.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/charts/bar_chart.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/charts/pie_chart.dart';
import 'package:smart_city_ambience/types/word_cloud.dart';

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

// // onyl to get random test strings

// const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
// Random _rnd = Random();

// String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
//     length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

// List<String> test = [for (int i = 0; i < 50; ++i) getRandomString(6)];

// // small test of package

class WordCloudExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> wordList = Provider.of<WordCloud>(context).words;
    List<Widget> widgets = <Widget>[];
    for (var i = 0; i < wordList.length; i++) {
      widgets.add(Text(wordList[i]));
    }

    final screenSize = MediaQuery.of(context).size;
    final ratio = screenSize.width / screenSize.height;

    return Center(
      child: FittedBox(
        child: Scatter(
          fillGaps: true,
          delegate: ArchimedeanSpiralScatterDelegate(ratio: ratio),
          children: widgets,
        ),
      ),
    );
  }
}
