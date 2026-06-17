import 'package:flutter/material.dart';
import 'package:mock_teste_internet/backend/fluxo_teste_internet.dart';
import 'package:mock_teste_internet/backend/speedometro_notifier.dart';
import 'package:mock_teste_internet/backend/validar_fluxo_teste_internet.dart';
import 'package:mock_teste_internet/widgets/animacao_speedometro.dart';
import 'package:mock_teste_internet/widgets/resultado_teste.dart';

class PaginaTesteVelocidade extends StatefulWidget {
  const PaginaTesteVelocidade({super.key});

  @override
  State<PaginaTesteVelocidade> createState() => _PaginaTesteVelocidadeState();
}

class _PaginaTesteVelocidadeState extends State<PaginaTesteVelocidade> {
  //final LogImpl logModule = LogFirebase();
  SpeedometroNotifier speedometroNotifier = SpeedometroNotifier();
  FluxoTesteInternet fluxoTesteInternet = FluxoTesteInternet();
  ValidarFluxoTesteInternet validarFluxoTesteInternet =
      ValidarFluxoTesteInternet();

  @override
  void initState() {
    // TODO: implement initState
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
        appBar: AppBar(title: const Text('Teste de Internet')),
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
                        ? Text("prj03VerificarLatencia...")
                        : speedometroNotifier.downloadRate != 0
                        ? const SizedBox()
                        : Text("prj03PreparandoTesteVelocidade..."),
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
