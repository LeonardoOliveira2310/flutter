import 'package:flutter/material.dart';
import 'package:internet_speedtest/backend/fluxo_teste_internet.dart';
import 'package:internet_speedtest/backend/speedometro_notifier.dart';
import 'package:internet_speedtest/backend/validar_fluxo_teste_internet.dart';
import 'package:internet_speedtest/widgets/animacao_speedometro.dart';
import 'package:internet_speedtest/widgets/loading_widget.dart';
import 'package:internet_speedtest/widgets/resultado_teste.dart';

class PaginaTesteVelocidade extends StatefulWidget {
  const PaginaTesteVelocidade({super.key});

  @override
  State<PaginaTesteVelocidade> createState() => _PaginaTesteVelocidadeState();
}

class _PaginaTesteVelocidadeState extends State<PaginaTesteVelocidade> {
  SpeedometroNotifier speedometroNotifier = SpeedometroNotifier();
  FluxoTesteInternet fluxoTesteInternet = FluxoTesteInternet();
  ValidarFluxoTesteInternet validarFluxoTesteInternet =
      ValidarFluxoTesteInternet();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      speedometroNotifier.iniciarOuReiniciarFluxo();
      if (context.mounted) {
        validarFluxoTesteInternet.iniciarFluxo(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'DOWNLOAD SPEEDTEST',
            style: TextStyle(color: Colors.cyanAccent),
          ),
        ),
        body: ListenableBuilder(
          listenable: speedometroNotifier,
          builder: (context, child) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  speedometroNotifier.progressoDownload == 0
                      ? const SizedBox()
                      : const AnimacaoSpeedometro(),
                  speedometroNotifier.tempoDeTeste == 0
                      ? const SizedBox()
                      : const ResultadoTeste(),
                  if (speedometroNotifier.testeInProgress) ...{
                    speedometroNotifier.testandoPing
                        ? LoadingWidget(mensagem: 'Testando Ping')
                        : speedometroNotifier.downloadRate != 0
                        ? const SizedBox()
                        : LoadingWidget(mensagem: 'Iniciando Teste'),
                  },
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
