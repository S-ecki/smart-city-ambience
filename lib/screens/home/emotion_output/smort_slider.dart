import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SmortSlider extends StatefulWidget {
  const SmortSlider({Key key}) : super(key: key);

  @override
  _SmortSliderState createState() => _SmortSliderState();
}

class _SmortSliderState extends State<SmortSlider> {
  var _value = 10.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Column(
        children: [
          Text("City Radius ändern"),
          SfSlider(
            min: 5.0,
            max: 25.0,
            interval: 5,
            value: _value,
            showTicks: true,
            showLabels: true,
            enableTooltip: true,
            tooltipShape: SfPaddleTooltipShape(),
            numberFormat: NumberFormat("#0",),
            tooltipTextFormatterCallback:
                (dynamic actualValue, String formattedText) {
              return "$formattedText km";
            },
            labelFormatterCallback:
                (dynamic actualValue, String formattedText) {
              return '$formattedText km';
            },
            onChanged: (dynamic newValue) {
              setState(() {
                _value = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}