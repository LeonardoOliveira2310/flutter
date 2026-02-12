import 'package:objetos/src/pessoa.dart';

void main(List<String> arguments) {
  Pessoa pessoa = Pessoa(
    nome: "Leonardo",
    idade: 37,
    sexo: "M",
  ); //Tipando a variável
  //var pessoa = Pessoa();
  //pessoa.inicializar("Leonardo", 37, "M");
  print(pessoa.nome);
  print(pessoa.idade);
  print(pessoa.sexo);
  //Herda da classe Humano
  print(pessoa.peso);
  print(pessoa.altura);
}
