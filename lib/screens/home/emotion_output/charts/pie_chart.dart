/// Package import
import 'package:flutter/material.dart';
import 'package:smart_city_ambience/types/enahancedEmoji.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// State class of doughnut chart.
class PieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildDefaultDoughnutChart();
  }

  /// Return the circular chart with default doughnut series.
  SfCircularChart _buildDefaultDoughnutChart() {
    return SfCircularChart(
      title: ChartTitle(text: 'Some Title', borderWidth: 5),
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.bottom
      ),
      series: _getDefaultDoughnutSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
      margin: EdgeInsets.all(8),
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          height: '55%',
          width: '55%',
          widget: SizedBox(
            height: 20,
            width: 20,
            child: Icon(Icons.location_city, size: 36,),
          ),
        ),
      ],
    );
  }

  /// Returns the doughnut series which need to be render.
  List<DoughnutSeries<ChartData, String>> _getDefaultDoughnutSeries() {
    final List<ChartData> chartData = <ChartData>[
      ChartData(EmojiType.Positive, 152),
      ChartData(EmojiType.Neutral, 34),
      ChartData(EmojiType.Negative, 78),
    ];
    return <DoughnutSeries<ChartData, String>>[
      DoughnutSeries<ChartData, String>(
        radius: '80%',
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
