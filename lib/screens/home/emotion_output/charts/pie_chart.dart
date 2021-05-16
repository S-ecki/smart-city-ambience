import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/charts/chart_functions.dart';
import 'package:smart_city_ambience/types/enahancedEmoji.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// State class of doughnut chart.
class PieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReactionsState, Map<String, List<EnhancedEmoji>>>(
      converter: (store) => store.state.enhancedEmojis,
      builder: (context, Map<String, List<EnhancedEmoji>> enhancedEmojis) =>
          SfCircularChart(
        title: ChartTitle(text: 'Some Title', borderWidth: 5),
        legend: Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
            position: LegendPosition.bottom),
        series: _getDefaultDoughnutSeries(enhancedEmojis),
        tooltipBehavior: TooltipBehavior(enable: true),
        margin: EdgeInsets.all(8),
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            height: '55%',
            width: '55%',
            widget: SizedBox(
              height: 20,
              width: 20,
              child: Icon(
                Icons.location_city,
                size: 42,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Returns the doughnut series which need to be render.
  List<DoughnutSeries<ChartData, String>> _getDefaultDoughnutSeries(Map<String, List<EnhancedEmoji>> enhancedEmojis) {

    // extract all set emojis from app
    int _positiveMay = getEmojiCount(EmojiType.Positive, enhancedEmojis);
    int _neutralMay = getEmojiCount(EmojiType.Neutral, enhancedEmojis);
    int _negativeMay = getEmojiCount(EmojiType.Negative, enhancedEmojis);
    
    // add dummy data
    final List<ChartData> chartData = <ChartData>[
      ChartData(EmojiType.Positive, 63 + _positiveMay),
      ChartData(EmojiType.Neutral, 13 + _neutralMay),
      ChartData(EmojiType.Negative, 38 + _negativeMay),
    ];

    return <DoughnutSeries<ChartData, String>>[
      DoughnutSeries<ChartData, String>(
        radius: '100%',
        explode: true,
        explodeOffset: '10%',
        dataSource: chartData,
        xValueMapper: (ChartData data, _) => data.type.toShortString(),
        yValueMapper: (ChartData data, _) => data.amount,
        dataLabelSettings: DataLabelSettings(isVisible: true),
      )
    ];
  }
}

class ChartData {
  EmojiType type;
  int amount;

  ChartData(this.type, this.amount);
}
