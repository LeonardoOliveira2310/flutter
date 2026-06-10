void main() {
  //deixando o nome na vertical
  String nome = 'Leonardo';
  for (var i = 0; i < nome.length; i++) {
    //Interpolação de variável utiliza ${}
    print('${nome[i]} - Letra nº {$i}');
  }
}
