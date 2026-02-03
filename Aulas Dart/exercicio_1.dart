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

  if (idade >= 18) {
    print("Você é maior de idade");
  } else {
    print("Tu ainda é menor de idade");
  }
}
