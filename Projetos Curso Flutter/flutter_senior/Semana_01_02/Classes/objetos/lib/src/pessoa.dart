//class Pessoa {
import 'humano.dart';

class Pessoa extends Humano {
  //=>herança da classe humano
  // String nome = "Tchongo";
  // int idade = 37;
  // String sexo = "M";
  String? nome;
  int? idade;
  String? sexo;

  //Pessoa({String? nome, int? idade, String? sexo}) {
  //inicializar(String nome, int idade, String sexo) {
  // this.nome = nome;
  // this.nome = nome;
  // this.idade = idade;
  // this.sexo = sexo;
  //}

  //forma mais simples de criar um construtor
  Pessoa({this.nome, this.idade, this.sexo});
}
