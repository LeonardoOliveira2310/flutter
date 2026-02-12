import 'package:estudo/src/cadastro_simples.dart';
import 'package:estudo/src/calculo_idade.dart';
import 'package:estudo/src/calculo_imc.dart';
import 'package:estudo/src/carrinho_de_compras.dart';

void main(List<String> arguments) {
  if (arguments[0] == 'calculo-idade') {
    calculoIdade();
  } else if (arguments[0] == 'carrinho-compras') {
    carrinhoCompras();
  } else if (arguments[0] == 'calculo-imc') {
    calculoDeImc();
  } else if (arguments[0] == 'cadastro') {
    cadastrarPessoa();
  } else {
    print("ESSE PROGRAMA NÃO EXISTE");
  }
}
