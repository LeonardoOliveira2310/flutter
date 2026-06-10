import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //Ex. Card
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://picsum.photos/400/200',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Text(
              "Titulo do Card",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 4,
                    color: Colors.black,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    //Exemplo básico de utilização
    //Positioned: permite colocar um filho em uma posição exata.
    // return Stack(
    //   children: [
    //     Container(color: Colors.greenAccent, width: 200, height: 200),
    //     Positioned(
    //       bottom: 10,
    //       right: 10,
    //       child: Text("Texto sobreposto", style: TextStyle(fontSize: 35)),
    //     ),
    //   ],
    // );
  }
}
