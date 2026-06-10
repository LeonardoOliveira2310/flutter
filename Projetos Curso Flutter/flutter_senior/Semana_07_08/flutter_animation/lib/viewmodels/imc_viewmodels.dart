import 'package:flutter/material.dart';
import 'package:flutter_animation/models/person_model.dart';

class ImcViewModel extends ChangeNotifier {
  var result = '';

  void calcIMC(double height, double weight) {
    final person = PersonModel(height: height, weight: weight);
    result = '${person.calcIMC()}';
    notifyListeners();
  }
}
