import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SmortSlider extends StatefulWidget {
  const SmortSlider({Key key}) : super(key: key);

  @override
  _SmortSliderState createState() => _SmortSliderState();
}

class _SmortSliderState extends State<SmortSlider> {
  var _value = 0.5;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Column(
        children: [
          Text("Suchraduis ändern"),
          SfSlider(
            min: 0.0,
            max: 30.0,
            interval: 10,
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