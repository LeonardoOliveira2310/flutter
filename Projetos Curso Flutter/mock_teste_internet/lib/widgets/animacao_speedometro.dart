import 'package:flutter/material.dart';
import 'package:mock_teste_internet/backend/fluxo_teste_internet.dart';
import 'package:mock_teste_internet/backend/speedometro_notifier.dart';
import 'package:mock_teste_internet/widgets/speedometro.dart';

class AnimacaoSpeedometro extends StatefulWidget {
  const AnimacaoSpeedometro({super.key});

  @override
  State<AnimacaoSpeedometro> createState() => _AnimacaoSpeedometroState();
}

class _AnimacaoSpeedometroState extends State<AnimacaoSpeedometro> {
  SpeedometroNotifier speedometroNotifier = SpeedometroNotifier();
  FluxoTesteInternet fluxoTesteInternet = FluxoTesteInternet();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: speedometroNotifier,
      builder: (context, child) {
        return AnimatedOpacity(
          curve: Curves.bounceInOut,
          duration: const Duration(seconds: 3),
          opacity:
              speedometroNotifier.progressoDownload > 0 &&
                  speedometroNotifier.tempoDeTeste == 0
              ? 1.0
              : 0.0,
          child: Column(
            children: [
              Speedometro(
                unitText: speedometroNotifier.unitText,
                value: speedometroNotifier.downloadRate,
                contex: context,
              ),
              SizedBox(
                width: 280,
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: SliderComponentShape
                        .noThumb, // Remove o botão deslizante
                    overlayShape: SliderComponentShape
                        .noOverlay, // Remove o círculo de expansão ao clicar
                  ),
                  child: Slider(
                    activeColor: Colors.cyanAccent,
                    onChangeEnd: (value) =>
                        speedometroNotifier.progressoDeDownload('100'),
                    min: 0,
                    max: 100,
                    value: speedometroNotifier.progressoDownload,
                    onChanged: (v) => speedometroNotifier.progressoDownload,
                  ),
                ),
              ),
              speedometroNotifier.testandoPing
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () => fluxoTesteInternet
                            .cancelarTesteDeVelocidade(context),
                        child: FittedBox(
                          child: Text(
                            "prj03Cancelar",
                            style: TextStyle(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
