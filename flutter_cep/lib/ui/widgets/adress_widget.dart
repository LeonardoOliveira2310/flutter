import 'package:flutter/material.dart';

class AdressWidget extends StatelessWidget {
  const AdressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Icon(Icons.check_circle_rounded),
              Text("CEP encontrado"),
              Text("Informações de endereço"),
            ],
          ),
        ),
      ],
    );
  }
}
