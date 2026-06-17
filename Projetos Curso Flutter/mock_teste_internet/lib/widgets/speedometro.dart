import 'package:flutter/material.dart';
import 'package:flutter_speedometer_gauge/flutter_speedometer_gauge.dart';

class Speedometro extends StatelessWidget {
  const Speedometro({
    super.key,
    required double value,
    required String unitText,
  }) : _value = value,
       _unitText = unitText;

  final double _value;
  final String _unitText;

  @override
  Widget build(BuildContext context) {
    return SpeedometerGauge(
      curve: Curves.bounceInOut,
      valueStyle: const TextStyle(color: Colors.transparent, fontSize: 75),
      needleColor: Colors.cyanAccent,
      size: 400,
      duration: const Duration(milliseconds: 600),
      min: 0,
      max: 200,
      value: _value,
      units: _value == 0 ? '' : 'Download $_unitText',
      majorTickCount: 11,
      segments: [
        GaugeSegment(
          thickness: 20,
          to: _value,
          color: _value < 10 ? Colors.redAccent : Colors.cyanAccent,
        ),
      ],
    );
  }
}
