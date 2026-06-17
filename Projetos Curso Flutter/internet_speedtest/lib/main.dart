import 'package:flutter/material.dart';
import 'package:internet_speedtest/frontend/pagina_teste_velocidade.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speed Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyanAccent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        appBarTheme: AppBarTheme(centerTitle: true),
      ),

      home: PaginaTesteVelocidade(),
    );
  }
}
