import 'package:flutter/material.dart';

import 'RadioSliderThumbShape.dart';

class RadioSlider extends StatefulWidget {
  final List<String> labels = ["0", "1", "2", "3", "4", "5"];

  @override
  _RadioSliderState createState() => _RadioSliderState();
}

class _RadioSliderState extends State<RadioSlider> {

  var _value = 3.0;

  @override
  Widget build(BuildContext context) {
    final themeData = SliderTheme.of(context).copyWith(
      trackHeight: 8,
      activeTrackColor: Colors.grey[300],
      inactiveTrackColor: Colors.grey[300],
      inactiveTickMarkColor: Colors.grey[500],
      tickMarkShape: RadioSliderTickMarkShape(widget.labels, activeColor: Color(0xff574efa)),
      trackShape: RadioSliderTrackShape(activeColor: Color(0xff574efa)),
      thumbShape: RadioSliderThumbShape(widget.labels, activeColor: Color(0xff574efa)),
    );

    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 16, left: 8, right: 8),
      child: SliderTheme(
        data: themeData,
        child: Slider(
          min: 0,
          max: (widget.labels.length - 1).toDouble(),
          value: _value.toDouble(),
          divisions: widget.labels.length - 1,
          onChanged: (double value) {
            if (value >= 1) {
              setState(() {
                _value = value;
              });
            }
          },
        ),
      ),
    );
  }
}
