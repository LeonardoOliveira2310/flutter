import 'package:animais/animal.dart';

class Gato extends Animal {
  String? nome;
  //barulho esta sendo passado por referencia.
  Gato({this.nome, barulho}) : super(barulho: barulho);
}
