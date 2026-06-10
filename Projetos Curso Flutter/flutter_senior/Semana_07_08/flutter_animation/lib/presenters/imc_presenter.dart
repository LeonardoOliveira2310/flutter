import 'package:flutter_animation/models/person_model.dart';

abstract class ImcView {
  void update();
}

class ImcPresenter {
  final ImcView view;
  var result = '';

  ImcPresenter(this.view);

  void calcIMC(double height, double weight) {
    final person = PersonModel(height: height, weight: weight);
    result = '${person.calcIMC()}';
    view.update();
  }
}
