import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internet_speed_test_pro/flutter_internet_speed_test_pro.dart';
import 'package:mock_teste_internet/backend/speedometro_notifier.dart';

class FluxoTesteInternet {
  final internetSpeedTest = FlutterInternetSpeedTest()..enableLog();
  SpeedometroNotifier speedometroNotifier = SpeedometroNotifier();

  Future<void> iniciarTesteDeVelocidade() {
    return internetSpeedTest.startTesting(
      useFastApi: true,
      downloadTestServer: 'https://fast.com/',
      onStarted: () {
        speedometroNotifier.testeEmProgresso(true);
        speedometroNotifier.calculandoPing(false);
      },
      onCompleted: (TestResult download, TestResult upload) {
        if (kDebugMode) {
          print(
            'the transfer rate ${download.transferRate}, ${upload.transferRate}',
          );
        }
        speedometroNotifier.taxaDeDownload(download.transferRate);

        speedometroNotifier.textoUnidadeMedidaVelocidade(
          download.unit == SpeedUnit.kbps ? 'Kbps' : 'Mbps',
        );

        speedometroNotifier.progressoDeDownload('100');

        speedometroNotifier.tempoDeDownload(download.durationInMillis);
      },
      onProgress: (double percent, TestResult data) {
        if (kDebugMode) {
          print('the transfer rate $data.transferRate, the percent $percent');
        }
        speedometroNotifier.textoUnidadeMedidaVelocidade(
          data.unit == SpeedUnit.kbps ? 'Kbps' : 'Mbps',
        );

        if (data.type == TestType.download) {
          speedometroNotifier.taxaDeDownload(data.transferRate);
          speedometroNotifier.progressoDeDownload(percent.toStringAsFixed(2));
        }
      },
      onError: (String errorMessage, String speedTestError) {
        if (kDebugMode) {
          print(
            'the errorMessage $errorMessage, the speedTestError $speedTestError',
          );
        }

        speedometroNotifier.reset();
      },
      onDownloadComplete: (TestResult data) {
        speedometroNotifier.taxaDeDownload(data.transferRate);
        speedometroNotifier.textoUnidadeMedidaVelocidade(
          data.unit == SpeedUnit.kbps ? 'Kbps' : 'Mbps',
        );
        speedometroNotifier.tempoDeDownload(data.durationInMillis);
      },
      onCancel: () {
        speedometroNotifier.iniciarOuReiniciarFluxo();
      },
    );
  }

  void cancelarTesteDeVelocidade(BuildContext context) {
    internetSpeedTest.cancelTest();
    Navigator.pop(context);
  }
}
