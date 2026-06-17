import 'dart:io';

/// Retorna verdadeiro ou falso se o usuário está conectado com a internet
Future<bool> verificarConexao() async {
  try {
    final resultado = await InternetAddress.lookup('google.com');
    if (resultado.isNotEmpty && resultado[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }

  return false;
}
