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
    var orientation = MediaQuery.of(context).orientation;
    //Muda a orientação dos widgets dinamicamente.
    return Flex(
      direction: orientation == Orientation.portrait
          ? Axis.vertical
          : Axis.horizontal,
      children: [
        Expanded(child: Container(color: Colors.redAccent)),
        Expanded(child: Container(color: Colors.blueAccent)),
        Expanded(child: Container(color: Colors.greenAccent)),
      ],
    );
    //Ex.:
    //Expanded: Faz o filho ocupar todo o espaço disponível
    //Flexible: Dá flexibilidade ao filho, mas sem forçar ocupar todo o espaço
    // return Flex(
    //   children: [
    //     Expanded(child: Container(color: Colors.redAccent)),
    //     Flexible(child: Container(color: Colors.blueAccent)),
    //   ],
    // );
  }
}
