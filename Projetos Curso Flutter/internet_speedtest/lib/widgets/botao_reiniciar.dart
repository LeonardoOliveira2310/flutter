import 'package:flutter/material.dart';

class BotaoReiniciarTeste extends StatelessWidget {
  const BotaoReiniciarTeste({super.key, required this.onTap});

  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.cyanAccent, width: 3.0),
          ),
          child: const Center(
            child: Text(
              'Reiniciar',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
