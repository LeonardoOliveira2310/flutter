class Pessoa {
  String? nome;
  int? idade;
  double? peso;
  double? altura;

  //calcular IMC
  double imc() => peso! / (altura! * altura!);
  //se é maior de idade
  bool maiorDeIdade() => idade! >= 18;

  // double imc() {
  //   return peso! / (altura! * altura!);
  // }

  // bool maiorDeIdade() {
  //   return idade! >= 18;
  // }
}
