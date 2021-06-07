import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smart_city_ambience/types/search_radius.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SmortSlider extends StatefulWidget {
  const SmortSlider({Key key}) : super(key: key);

  @override
  _SmortSliderState createState() => _SmortSliderState();
}

class _SmortSliderState extends State<SmortSlider> {

  @override
  Widget build(BuildContext context) {
    // save state of radius with
    var _radius = Provider.of<SearchRadius>(context).radius;
    return Container(
      width: 400,
      child: Column(
        children: [
          Text("City Radius ändern"),
          SfSlider(
            min: 5.0,
            max: 20.0,
            interval: 5,
            value: _radius,
            showTicks: true,
            showLabels: true,
            enableTooltip: true,
            tooltipShape: SfPaddleTooltipShape(),
            numberFormat: NumberFormat(
              "#0",
            ),
            stepSize: 1,
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
                _radius = newValue;
                  Provider.of<SearchRadius>(context, listen: false).setRadius(_radius);
              });
            },
          ),
          
        ],
      ),
    );
  }
}
