import 'dart:io';

void main() {
  calculoImc();
}

calculoImc() {
  print("===== Digite seu peso =====");
  String? textPeso = stdin.readLineSync();
  double peso = double.parse(textPeso!);

  print("===== Digite sua altura =====");
  String? textAltura = stdin.readLineSync();
  double altura = double.parse(textAltura!);

  double imc = calcImc(peso, altura);

  imprimirResultado(imc);
}

double calcImc(double peso, double altura) {
  return peso / (altura * altura);
}

imprimirResultado(double calcImc) {
  print('=============================');

  if (calcImc < 18.5) {
    print('Abaixo do peso');
  } else if (calcImc > 18.5 && calcImc < 24.9) {
    print('Peso Normal');
  } else if (calcImc > 25 && calcImc < 29.9) {
    print('Sobre Peso');
  } else if (calcImc > 30 && calcImc < 34.9) {
    print('Obesidade Grau 1');
  } else if (calcImc > 35 && calcImc < 39.9) {
    print('Obesidade Grau 1');
  } else {
    print('Obesidade Móbida');
  }
}
