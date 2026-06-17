import 'package:flutter/material.dart';
import 'package:internet_speedtest/backend/speedometro_notifier.dart';
import 'package:internet_speedtest/backend/validar_fluxo_teste_internet.dart';

class ResultadoTeste extends StatefulWidget {
  const ResultadoTeste({super.key});

  @override
  State<ResultadoTeste> createState() => _ResultadoTesteState();
}

class _ResultadoTesteState extends State<ResultadoTeste> {
  SpeedometroNotifier speedometroNotifier = SpeedometroNotifier();
  ValidarFluxoTesteInternet validarFluxoTesteInternet =
      ValidarFluxoTesteInternet();
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      curve: Curves.bounceInOut,
      duration: const Duration(seconds: 3),
      opacity:
          speedometroNotifier.progressoDownload == 0 &&
              speedometroNotifier.tempoDeTeste > 0
          ? 1.0
          : 0.0,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                size: 35,
                Icons.arrow_circle_down_sharp,
                color: Colors.cyanAccent, //Colors.green,
              ),
              Text('DOWNLOAD ${speedometroNotifier.unitText}'),
            ],
          ),
          Text(
            speedometroNotifier.taxaDoDownload.toStringAsFixed(2),
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: speedometroNotifier.taxaDoDownload < 10
                  ? Colors.redAccent
                  : Colors.cyanAccent,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Ping Google: ${speedometroNotifier.pingGoogle.toStringAsFixed(2)}ms',
              ),
              Text(
                'Ping AWS: ${speedometroNotifier.pingAws.toStringAsFixed(2)}ms',
              ),
            ],
          ),
          speedometroNotifier.tempoDeTeste == 0
              ? const SizedBox()
              : ElevatedButton(
                  child: FittedBox(
                    child: Text("Reiniciar", overflow: TextOverflow.ellipsis),
                  ),
                  onPressed: () {
                    validarFluxoTesteInternet.iniciarFluxo(context);
                  },
                ),
        ],
      ),
    );
  }
}
