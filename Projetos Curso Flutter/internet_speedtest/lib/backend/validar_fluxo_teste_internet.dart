import 'package:flutter/material.dart';
import 'package:internet_speedtest/backend/fluxo_teste_internet.dart';
import 'package:internet_speedtest/backend/speedometro_notifier.dart';
import 'package:internet_speedtest/backend/verificar_conexao.dart';

class ValidarFluxoTesteInternet {
  SpeedometroNotifier speedometroNotifier = SpeedometroNotifier();
  FluxoTesteInternet fluxoTesteInternet = FluxoTesteInternet();
  void iniciarFluxo(BuildContext context) async {
    bool temInternet = await verificarConexao();

    if (!context.mounted) return;

    speedometroNotifier.estaComInternet(temInternet);

    if (!speedometroNotifier.temInternet) {
      Navigator.pop(context);

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
