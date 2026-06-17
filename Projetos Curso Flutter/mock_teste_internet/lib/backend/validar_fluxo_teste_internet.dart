import 'package:flutter/material.dart';
import 'package:mock_teste_internet/backend/fluxo_teste_internet.dart';
import 'package:mock_teste_internet/backend/speedometro_notifier.dart';
import 'package:mock_teste_internet/backend/verificar_conexao.dart';

class ValidarFluxoTesteInternet {
  SpeedometroNotifier speedometroNotifier = SpeedometroNotifier();
  FluxoTesteInternet fluxoTesteInternet = FluxoTesteInternet();

  void iniciarFluxo(BuildContext context) async {
    bool temInternet = await verificarConexao();

    speedometroNotifier.estaComInternet(temInternet);

    if (!speedometroNotifier.temInternet) {
      return;
    }

    speedometroNotifier.iniciarOuReiniciarFluxo();

    speedometroNotifier.testeEmProgresso(true);
    speedometroNotifier.calculandoPing(true);

    await speedometroNotifier.checkLatency(host: Host.google);

    await speedometroNotifier.checkLatency(host: Host.aws);

    await fluxoTesteInternet.iniciarTesteDeVelocidade();
  }
}
