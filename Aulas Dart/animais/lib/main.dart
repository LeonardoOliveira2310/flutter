import 'package:animais/cachorro.dart';
import 'package:animais/gato.dart';
import 'package:animais/porco.dart';

void main(List<String> arguments) {
  Gato gato = Gato(nome: "Tchongo", barulho: "Meow");
  Cachorro cachorro = Cachorro(nome: "Churumelo", barulho: "Grrrrrr");
  Porco porco = Porco(nome: "Peppa Pig", barulho: "Oink");

  print("O barulho do gato é: ${gato.barulho}");
  print("O cachorro ta bravo, ouça o rosnado: ${cachorro.barulho}");
  print("Engraçado o barulho da Peppa né: ${porco.barulho}");
}
