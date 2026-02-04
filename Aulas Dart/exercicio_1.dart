import 'dart:io';

void main() {
  //perguntar a idade da pessoa;
  //se a idade for maior ou igual a 18
  //  ele é maior de idade;
  //senão for
  //  ele não é maior de idade;
  print("=======digite uma idade=======");
  var input = stdin.readLineSync();
  var idade = int.parse(input!);

  if (idade >= 50) {
    print("Melhor Idade");
  } else if (idade >= 18) {
    print("Tu ainda é Adulto");
  } else if (idade >= 12) {
    print("Aborrecente");
  } else {
    print("fraldinha");
  }
}
