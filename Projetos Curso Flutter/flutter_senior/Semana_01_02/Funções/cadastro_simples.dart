import 'dart:io';

List<Map<String, dynamic>> cadastros = [];

void main() {
  bool condicao = true;
  limparTerminal();
  var comandos = {"1": "cadastro", "2": "imprimir", "3": "sair"};

  while (condicao) {
    print("Digite um dos comandos abaixo \n $comandos");
    String? comando = stdin.readLineSync();
    if (comando == "sair") {
      limparTerminal();
      print("=== PROGRAMA ENCERRADO ===");
      condicao = false;
    } else if (comando == "cadastro") {
      limparTerminal();
      cadastrar();
    } else if (comando == "imprimir") {
      limparTerminal();
      print(cadastros);
    } else {
      print("Comando inexistente");
    }
  }
}

limparTerminal() {
  print('\x1B[2J\x1B[0;0H');
}

cadastrar() {
  Map<String, dynamic> cadastro = {};
  print("=== Digite seu Nome ===");
  cadastro["nome"] = stdin.readLineSync();
  print("=== Digite sua Idade ===");
  cadastro["idade"] = stdin.readLineSync();
  print("=== Digite sua Cidade ===");
  cadastro["cidade"] = stdin.readLineSync();
  print("=== Digite seu Estado ===");
  cadastro["estado"] = stdin.readLineSync();

  cadastros.add(cadastro);
}
