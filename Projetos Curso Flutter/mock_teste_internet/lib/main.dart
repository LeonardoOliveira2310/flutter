import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internet_speed_test_pro/flutter_internet_speed_test_pro.dart';
import 'package:mock_teste_internet/backend/speedometro_notifier.dart';
import 'package:mock_teste_internet/widgets/speedometro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final internetSpeedTest = FlutterInternetSpeedTest()..enableLog();
  double latenciaGoogle = 0.0;
  double latenciaAws = 0.0;
  SpeedometroNotifier speedometroNotifier = SpeedometroNotifier();

  String progressoDownload = '';
  int tempoDeTeste = 0;
  double taxaDeDownload = 0.0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      speedometroNotifier.reset();
      resetLocal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Teste de Velocidade de Internet')),
        body: ListenableBuilder(
          listenable: speedometroNotifier,
          builder: (context, child) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Speedometro(
                    value: speedometroNotifier.downloadRate,
                    unitText: speedometroNotifier.unitText,
                  ),

                  if (speedometroNotifier.progressoDownload > 0)
                    SizedBox(
                      width: 200,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: SliderComponentShape
                              .noThumb, // Remove o botão deslizante
                          overlayShape: SliderComponentShape
                              .noOverlay, // Remove o círculo de expansão ao clicar
                        ),
                        child: Slider(
                          activeColor: Colors.green,
                          onChangeEnd: (value) =>
                              speedometroNotifier.progressoDeDownload('100'),
                          min: 0,
                          max: 100,
                          value: speedometroNotifier.progressoDownload,
                          onChanged: (v) =>
                              speedometroNotifier.progressoDownload,
                        ),
                      ),
                    ),

                  tempoDeTeste == 0
                      ? SizedBox()
                      : Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  fontWeight: FontWeight.bold,
                                  size: 35,
                                  Icons.arrow_circle_down_sharp,
                                  color: Colors.green,
                                ),
                                Text(
                                  'DOWNLOAD ${speedometroNotifier.unitText} ',
                                ),
                              ],
                            ),
                            Text(
                              taxaDeDownload.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: taxaDeDownload < 10
                                    ? Colors.red
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                  tempoDeTeste == 0
                      ? Center(child: Text(''))
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Ping Google: ${latenciaGoogle.toStringAsFixed(2)}ms',
                            ),
                            Text(
                              'Ping AWS: ${latenciaAws.toStringAsFixed(2)}ms',
                            ),
                          ],
                        ),

                  const SizedBox(height: 32.0),

                  if (!speedometroNotifier.testeInProgress) ...{
                    ElevatedButton(
                      child: const Text('Iniciar Teste'),
                      onPressed: () async {
                        speedometroNotifier.reset();
                        resetLocal();

                        speedometroNotifier.testeEmProgresso(true);
                        speedometroNotifier.calculandoPing(true);

                        latenciaGoogle = await speedometroNotifier.checkLatency(
                          host: Host.google,
                        );

                        latenciaAws = await speedometroNotifier.checkLatency(
                          host: Host.aws,
                        );

                        await internetSpeedTest.startTesting(
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
                            speedometroNotifier.taxaDeDownload(
                              download.transferRate,
                            );

                            speedometroNotifier.textoUnidadeMedidaVelocidade(
                              download.unit == SpeedUnit.kbps ? 'Kbps' : 'Mbps',
                            );

                            speedometroNotifier.progressoDeDownload('100');

                            speedometroNotifier.tempoDeDownload(
                              download.durationInMillis,
                            );
                          },
                          onProgress: (double percent, TestResult data) {
                            if (kDebugMode) {
                              print(
                                'the transfer rate $data.transferRate, the percent $percent',
                              );
                            }
                            speedometroNotifier.textoUnidadeMedidaVelocidade(
                              data.unit == SpeedUnit.kbps ? 'Kbps' : 'Mbps',
                            );

                            if (data.type == TestType.download) {
                              speedometroNotifier.taxaDeDownload(
                                data.transferRate,
                              );
                              speedometroNotifier.progressoDeDownload(
                                percent.toStringAsFixed(2),
                              );

                              progressoDownload =
                                  speedometroNotifier.downloadProgress;
                              taxaDeDownload = speedometroNotifier.downloadRate;
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
                            speedometroNotifier.taxaDeDownload(
                              data.transferRate,
                            );
                            speedometroNotifier.textoUnidadeMedidaVelocidade(
                              data.unit == SpeedUnit.kbps ? 'Kbps' : 'Mbps',
                            );
                            speedometroNotifier.tempoDeDownload(
                              data.durationInMillis,
                            );
                            tempoDeTeste = data.durationInMillis;
                          },

                          onCancel: () {
                            speedometroNotifier.reset();
                            resetLocal();
                          },
                        );
                      },
                    ),
                  } else ...{
                    speedometroNotifier.testandoPing
                        ? Text('Iniciando teste, aguarde...')
                        : CircularProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton.icon(
                        onPressed: () => internetSpeedTest.cancelTest(),
                        icon: const Icon(Icons.cancel_rounded),
                        label: const Text('Cancelar'),
                      ),
                    ),
                  },
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void resetLocal() {
    progressoDownload = '';
    tempoDeTeste = 0;
    taxaDeDownload = 0.0;
    latenciaGoogle = 0.0;
    latenciaAws = 0.0;
  }
}
