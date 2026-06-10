import 'package:flutter/material.dart';
import 'package:flutter_speedometer_gauge/flutter_speedometer_gauge.dart';

class Speedometro extends StatelessWidget {
  const Speedometro({super.key, required double value}) : _value = value;

  final double _value;

  @override
  Widget build(BuildContext context) {
    return SpeedometerGauge(
      min: 0,
      max: 100,
      value: _value,
      units: _value == 0 ? '' : 'Download Mbps',
      majorTickCount: 11,

      segments: [
        GaugeSegment(
          thickness: 20,
          to: _value,
          color: _value < 10 ? Colors.red : Colors.green,
        ),
      ],
    );
  }
}
