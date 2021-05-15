import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';
import 'package:smart_city_ambience/types/enahancedEmoji.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChart extends StatelessWidget {
  // counts the types of emojis
  // simply pass in the Map that you get from the redux store with the type
  int getEmojiCount(
      EmojiType type, Map<String, List<EnhancedEmoji>> enhancedEmojis) {
    List<List<EnhancedEmoji>> entryList =
        enhancedEmojis.entries.map((mapEntry) => mapEntry.value).toList();
    int count = 0;
    entryList.forEach((list) {
      list.forEach((element) {
        if (element.type == type) count++;
      });
    });
    return count;
  }

  Widget build(BuildContext context) {
    return StoreConnector<ReactionsState, Map<String, List<EnhancedEmoji>>>(
      converter: (store) => store.state.enhancedEmojis,
      builder: (context, Map<String, List<EnhancedEmoji>> enhancedEmojis) =>
          SfCartesianChart(
        plotAreaBorderWidth: 0,
        title: ChartTitle(text: 'Some Title'),
        legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          position: LegendPosition.bottom,
        ),
        primaryXAxis: CategoryAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          // show all labels
          interval: 1,
          // smart alignment of labels if the intersect each other
          labelIntersectAction: AxisLabelIntersectAction.multipleRows,
          // to disable vertical lines
          majorGridLines: MajorGridLines(width: 0),
          // caps the number of labels per 100 px
        ),
        primaryYAxis: NumericAxis(
          axisLine: AxisLine(width: 0),
          // labelFormat: '{value}',
          // maximum: 300,
          majorTickLines: MajorTickLines(size: 0),
        ),
        series: _getStackedColumnSeries(enhancedEmojis),
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }

  /// Returns the list of chart serie which needs to render
  /// on the stacked column chart
  List<StackedColumnSeries<BarChartData, String>> _getStackedColumnSeries(
      Map<String, List<EnhancedEmoji>> enhancedEmojis) {

    // extract all set emojis from app
    int positiveMay = getEmojiCount(EmojiType.Positive, enhancedEmojis);
    int neutralMay = getEmojiCount(EmojiType.Neutral, enhancedEmojis);
    int negativeMay = getEmojiCount(EmojiType.Negative, enhancedEmojis);

    // add to dummy data
    final List<BarChartData> chartData = <BarChartData>[
      BarChartData("Februar", 143, 37, 61),
      BarChartData("März", 83, 12, 60),
      BarChartData("April", 101, 41, 44),
      BarChartData("Mai", 53 + positiveMay, 9 + neutralMay, 36 + negativeMay),
    ];

    return <StackedColumnSeries<BarChartData, String>>[
      StackedColumnSeries<BarChartData, String>(
        dataSource: chartData,
        name: "Positiv",
        xValueMapper: (BarChartData data, _) => data.month,
        yValueMapper: (BarChartData data, _) => data.positiveAmount,
        dataLabelMapper: (BarChartData data, _) =>
            data.positiveAmount < 30 ? "" : null,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
        ),
      ),
      StackedColumnSeries<BarChartData, String>(
        dataSource: chartData,
        name: "Neutral",
        xValueMapper: (BarChartData data, _) => data.month,
        yValueMapper: (BarChartData data, _) => data.neutralAmount,
        dataLabelMapper: (BarChartData data, _) =>
            data.neutralAmount < 30 ? "" : null,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
        ),
      ),
      StackedColumnSeries<BarChartData, String>(
        dataSource: chartData,
        name: "Negativ",
        xValueMapper: (BarChartData data, _) => data.month,
        yValueMapper: (BarChartData data, _) => data.negativeAmount,
        dataLabelMapper: (BarChartData data, _) =>
            data.negativeAmount < 30 ? "" : null,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
        ),
      ),
    ];
  }
}

class BarChartData {
  String month;

  int positiveAmount;
  int neutralAmount;
  int negativeAmount;

  BarChartData(
      this.month, this.positiveAmount, this.neutralAmount, this.negativeAmount);
}
