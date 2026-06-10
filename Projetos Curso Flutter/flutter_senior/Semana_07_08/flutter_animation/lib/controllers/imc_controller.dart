import 'package:flutter/material.dart';
import 'package:flutter_animation/models/person_model.dart';

class ImcController {
  Widget calcIMC(double height, double weight) {
    final person = PersonModel(height: height, weight: weight);
    return Text('${person.calcIMC()}');
  }
}
