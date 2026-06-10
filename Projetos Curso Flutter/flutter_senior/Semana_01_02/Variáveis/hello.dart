void main() {
  // print("Hello World!");
  // print("Impressão 2");
  // print(hello);
  /*Operadores básicos*/
  var num1 = 10;
  var num2 = 2;
  var totalSoma = num1 + num2; //adição
  var totalSub = num1 - num2; //subtração
  var totalMult = num1 * num2; //multiplicação
  var totalDiv = num1 / num2; //divisão
  var totalMod = num1 % num2; //MOD - resto de divisão

  print("O valor ${num1} + ${num2} é: $totalSoma");
  print("O valor ${num1} - ${num2} é: $totalSub");
  print("O valor ${num1} * ${num2} é: $totalMult");
  print("O valor ${num1} / ${num2} é: $totalDiv");
  print("O valor ${num1} % ${num2} é: $totalMod");
  totalMod == 0 ? print("Par") : print('Ímpar');

  /*Concatenação*/
  var hello = "Hello ";
  var world = "World!";
  print(hello + world);

  /*Tomadas de decisões*/

  var ehVerdadeiro = num1 == num2;
  if (ehVerdadeiro) {
    print('Verdade');
  } else {
    print('Falso');
  }
}
