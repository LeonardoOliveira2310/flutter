import 'dart:io';

void main() {
  calcImc();
}

calcImc() {
  print("===== Digite seu peso =====");
  var textPeso = stdin.readLineSync();
  var peso = double.parse(textPeso!);

  print("===== Digite sua altura =====");
  var textAltura = stdin.readLineSync();
  var altura = double.parse(textAltura!);

  print('=============================');
  var calcImc = peso / (altura * altura);

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
