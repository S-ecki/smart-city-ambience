import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_scatter/flutter_scatter.dart';
import 'package:smart_city_ambience/screens/home/charts/bar_chart.dart';
import 'package:smart_city_ambience/screens/home/charts/pie_chart.dart';

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
                  height: dimens.maxHeight * 0.8,
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

// onyl to get random test strings

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

List<String> test = [for (int i = 0; i < 50; ++i) getRandomString(6)];

// small test of package

class WordCloudExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[];
    for (var i = 0; i < test.length; i++) {
      widgets.add(Text(test[i]));
    }

    final screenSize = MediaQuery.of(context).size;
    final ratio = screenSize.width / screenSize.height;

    return Center(
      child: FittedBox(
        child: Scatter(
          fillGaps: false,
          delegate: ArchimedeanSpiralScatterDelegate(ratio: ratio),
          children: widgets,
        ),
      ),
    );
  }
}

class com {
  const com(this.word,this.rotated);
  final String word;
  final bool rotated;
}

class ScatterItem extends StatelessWidget {
  ScatterItem(this.comm);
  final com comm;
  //final int index;

  @override
  Widget build(BuildContext context) {
    
    return RotatedBox(
      quarterTurns: comm.rotated ? 1 : 0,
      child: Text(
        comm.word,
        //style: style,
      ),
    );
  }
  }