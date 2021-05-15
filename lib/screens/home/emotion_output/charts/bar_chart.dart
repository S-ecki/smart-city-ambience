import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChart extends StatelessWidget {
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Some Title'),
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.bottom,
      ),
      // TODO: update to DateTimeCategoryAxis
      primaryXAxis: DateTimeAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        intervalType: DateTimeIntervalType.months,
        dateFormat: DateFormat.MMMM(),
        // show all labels
        interval: 1,
        // smart alignment of labels if the intersect each other
        labelIntersectAction: AxisLabelIntersectAction.multipleRows,
        // to disable vertical lines
        majorGridLines: MajorGridLines(width: 0),
        // caps the number of labels per 100 px
        // maximumLabels: 6,
        // set boundaries of timeframe
        // visibleMinimum: DateTime(2021, 1),
        // visibleMaximum: DateTime(2021, 3),
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
  List<StackedColumnSeries<BarChartData, DateTime>> _getStackedColumnSeries() {
    // TODO: define globally
    final List<BarChartData> chartData = <BarChartData>[
      BarChartData(DateTime(2021, 1), 143, 37, 61),
      BarChartData(DateTime(2021, 2), 72, 42, 101),
      BarChartData(DateTime(2021, 3), 83, 12, 60),
    ];
    return <StackedColumnSeries<BarChartData, DateTime>>[
      StackedColumnSeries<BarChartData, DateTime>(
        dataSource: chartData,
        name: "Positiv",
        xValueMapper: (BarChartData data, _) => data.month,
        yValueMapper: (BarChartData data, _) => data.positiveAmount,
        dataLabelMapper: (BarChartData data, _) => data.positiveAmount < 30 ? "" : null,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
        ),
      ),
      StackedColumnSeries<BarChartData, DateTime>(
        dataSource: chartData,
        name: "Neutral",
        xValueMapper: (BarChartData data, _) => data.month,
        yValueMapper: (BarChartData data, _) => data.neutralAmount,
        dataLabelMapper: (BarChartData data, _) => data.neutralAmount < 30 ? "" : null,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
        ),
      ),
      StackedColumnSeries<BarChartData, DateTime>(
        dataSource: chartData,
        name: "Negativ",
        xValueMapper: (BarChartData data, _) => data.month,
        yValueMapper: (BarChartData data, _) => data.negativeAmount,
        dataLabelMapper: (BarChartData data, _) => data.negativeAmount < 30 ? "" : null,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
        ),
      ),
    ];
  }
}

class BarChartData {
  DateTime month;

  int positiveAmount;
  int neutralAmount;
  int negativeAmount;

  BarChartData(
      this.month, this.positiveAmount, this.neutralAmount, this.negativeAmount);
}
