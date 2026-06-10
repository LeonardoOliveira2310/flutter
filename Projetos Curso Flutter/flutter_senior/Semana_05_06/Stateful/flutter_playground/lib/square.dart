import 'package:flutter/material.dart';

abstract class Shape {
  final double height;
  final double width;
  final double borderRadius;
  final Color color;
  final Alignment alignment;
  const Shape({
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.color,
    required this.alignment,
  });
}

class Square extends Shape {
  Square({
    required super.height,
    required super.width,
    required super.borderRadius,
    required super.color,
    required super.alignment,
  });
}

class Rectangle extends Shape {
  Rectangle({
    required super.height,
    required super.width,
    required super.borderRadius,
    required super.color,
    required super.alignment,
  });
}
