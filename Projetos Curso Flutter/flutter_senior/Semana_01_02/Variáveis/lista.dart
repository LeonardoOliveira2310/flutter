void main() {
  //   List<String> nomes = ['Tonho', 'Bastião', 'Zé Ruela'];
  //   var nome = nomes[1];
  //   print(nome);

  //   var maps = {
  //     "nome": "Tchongo",
  //     "idade": 33,
  //     "cidade": "Cerqueira césar",
  //     "estado": "Nova York",
  //   };
  //imprimindo valor original
  //print(maps["nome"]);
  //atribuindo novo valor ao map
  //maps["nome"] = "Zé Ruela";
  //imprimindo novo valor
  //print(maps["nome"]);

  //criando um Map Tipado <>
  //Map<tipo chave, tipo valores>
  //dynamic retorna qualquer tipo de valor.
  Map<String, dynamic> maps = {
    "nome": "Tchongo",
    "idade": 33,
    "cidade": "Cerqueira césar",
    "estado": "Nova York",
  };
  print(maps["nome"]);
}
