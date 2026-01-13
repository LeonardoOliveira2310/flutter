import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.blueAccent)),
      home: const MyHomePage(title: 'AppBar Legal'),
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
  final listaNomes = [
    'Cuca',
    'Dona Benta',
    'Saci Pererê',
    'Visconde de Sabugosa',
    'Narizinho',
  ];

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),

      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.person),
          title: Text(listaNomes[index]),
          trailing: Container(
            width: 60,
            child: Row(
              children: [
                Icon(Icons.edit),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    print("deletando");
                  },
                  child: Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ),
        itemCount: listaNomes.length,
      ),
      // Column(
      //   children: [
      //     Text(
      //       "Meus dois containers vermelho",
      //       style: TextStyle(color: Colors.red),
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Container(width: 80, height: 80, color: Colors.red),
      //         SizedBox(width: 12),
      //         Container(width: 80, height: 80, color: Colors.red),
      //       ],
      //     ),
      //     SizedBox(height: 50),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Icon(Icons.access_alarm, size: 60, color: Colors.blue),
      //         Icon(Icons.person, size: 60, color: Colors.red),
      //       ],
      //     ),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
