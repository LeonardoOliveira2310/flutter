import 'package:flutter/material.dart';

class BarraDeProgresso extends StatelessWidget {
  const BarraDeProgresso({
    super.key,
    required this.fimDoProgresso,
    required this.tempoDeExecucao,
  });

  final double fimDoProgresso;
  final int tempoDeExecucao;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: fimDoProgresso / 100),
        duration: Duration(seconds: tempoDeExecucao),
        builder: (context, double value, _) {
          return LinearProgressIndicator(minHeight: 16, value: value);
        },
      ),
    );
  }
}
