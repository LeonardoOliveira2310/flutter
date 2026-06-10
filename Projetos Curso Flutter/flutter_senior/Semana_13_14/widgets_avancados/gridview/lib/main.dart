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
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, //número de colunas
        crossAxisSpacing: 4, //espaçamento horizontal
        mainAxisSpacing: 4, //espaçamento vertical
      ),
      itemCount: 30,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Image.network(
              'https://picsum.photos/200/200?random=$index',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Text(
                'Foto $index',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black54,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
    //Exemplo prático
    // return GridView.builder(
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 3, //número de colunas
    //     crossAxisSpacing: 4, //espaçamento horizontal
    //     mainAxisSpacing: 4, //espaçamento vertical
    //   ),
    //   itemCount: 20,
    //   itemBuilder: (context, index) {
    //     return Container(
    //       color: Colors.blueAccent,
    //       child: Center(
    //         child: Text('Item $index', style: TextStyle(color: Colors.white)),
    //       ),
    //     );
    //   },
    // );
    //Exemplo simples
    // return GridView.count(
    //   crossAxisCount: 3,
    //   children: [
    //     ...List.generate(9, (index) {
    //       //"..." significa SPREAD, "espalhar"
    //       return Container(
    //         margin: EdgeInsets.all(4),
    //         color: Colors.amber,
    //         child: Center(child: Text("Item $index")),
    //       );
    //     }),
    //   ],
    // );
  }
}
