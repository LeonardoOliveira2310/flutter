class ModelCpf {
  final String cpf;

  ModelCpf({required this.cpf});

  String? verificarCpf(String cpf) {
    //var cpfOriginal = CPF;
    var digitoUm = verificaDigitoUm(cpf);
    cpf = cpf + digitoUm.toString();
    var digitoDois = verificaDigitoDois(cpf);
    cpf = cpf + digitoDois.toString();
    //print('CPF: $cpfOriginal');
    //print('Novo CPF: $CPF');

    return cpf;
  }

  String? verificaDigitoUm(String cpf) {
    int contador = 10;
    int digitoVerificadorUm = 0;
    double somaDigitoUm = 0;
    double modDigito = 0;
    for (var i = 0; i < cpf.length; i++) {
      somaDigitoUm = somaDigitoUm + (int.parse(cpf[i]) * contador--);

      if (contador < 2) {
        modDigito = (somaDigitoUm % 11);

        if (modDigito < 2) {
          digitoVerificadorUm = 0;
        } else {
          digitoVerificadorUm = 11 - modDigito.toInt();
        }
        return digitoVerificadorUm.toString();
      }
    }
    return null;
  }

  String? verificaDigitoDois(String cpf) {
    int contador = 11;
    int digitoVerificadorUm = 0;
    double somaDigitoUm = 0;

    double modDigito = 0;
    for (var i = 0; i < cpf.length; i++) {
      somaDigitoUm = somaDigitoUm + (int.parse(cpf[i]) * contador--);

      if (contador < 2) {
        modDigito = (somaDigitoUm % 11);

        //print('${divDigito.toInt()} - $modDigito');

        if (modDigito < 2) {
          digitoVerificadorUm = 0;
        } else {
          digitoVerificadorUm = 11 - modDigito.toInt();
        }
        //CPF = CPF + digitoVerificadorUm.toString();
        //print(CPF);
        return digitoVerificadorUm.toString();
      }
    }
    return null;
  }
}
