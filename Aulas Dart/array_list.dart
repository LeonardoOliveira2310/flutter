import 'dart:io';

void main() {
  // var nome = [];

  // bool condicao = true;
  // while (condicao) {
  //   print("Digite um nome");
  //   String? text = stdin.readLineSync();
  //   if (text == 'sair') {
  //     print("=== PROGRAMA FINALIZADO ===");
  //     condicao = false;
  //   } else {
  //     nome.add(text);
  //   }
  //   print(nome);
  // }
  //Tipagem Explícita
  List<String> nomes = ["MandooGames", "Leonardo", "Xirubley"];
  //adicionando valor a um array
  nomes.add("Mano Games");
  //exibindo todos os nomes e o tamanho da lista
  print(nomes);
  print(nomes.length);
  nomes.add("oli Singu laire");
  //acessando item específico dentro de um array
  print(nomes[3]);
  print(nomes.length);
  //Removendo itens do array por String
  nomes.remove("Mano Games");
  print(nomes);
  print(nomes.length);
  //Removendo itens do array por indice
  nomes.removeAt(1);
  print(nomes);
  print(nomes.length);
}
