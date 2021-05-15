import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {}

class BarChart extends StatelessWidget {

  // TODO: get from redux
  int negativeMay = 0;
  int neutralMay = 0;
  int positiveMay = 0;

  final List<BarChartData> chartData = <BarChartData>[
    BarChartData("Februar", 143, 37, 61),
    BarChartData("März", 83, 12, 60),
    BarChartData("April", 101, 41, 44),
    BarChartData("Mai", 53, 9, 36),
  ];

  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Some Title'),
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.bottom,
      ),
      primaryXAxis: CategoryAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,

        // intervalType: DateTimeIntervalType.months,
        // dateFormat: DateFormat.MMMM(),
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
      series: _getStackedColumnSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// Returns the list of chart serie which need to render
  /// on the stacked column chart.
  List<StackedColumnSeries<BarChartData, String>> _getStackedColumnSeries() {
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
