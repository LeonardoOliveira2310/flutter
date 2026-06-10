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
    //Exemplo de ListView.separated
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://picsum.photos/200?random=$index',
              ),
            ),
            title: Text("Contato $index"),
            subtitle: Text("Telefone: (11)9999-000$index"),
          );
        },
      ),
    );
    //Exemplo de ListView.Builder
    // return Scaffold(
    //   body: ListView.builder(
    //     itemCount: 20,
    //     itemBuilder: (context, index) {
    //       return ListTile(
    //         leading: CircleAvatar(
    //           backgroundImage: NetworkImage(
    //             'https://picsum.photos/200?random=$index',
    //           ),
    //         ),
    //         title: Text("Contato $index"),
    //         subtitle: Text("Telefone: (11)9999-000$index"),
    //       );
    //     },
    //   ),
    // );
    //Exemplo simples de uma List.build
    // return Scaffold(
    //   body: ListView.builder(
    //     itemBuilder: (context, index) {
    //       return ListTile(
    //         title: Text("Item $index"),

    //         leading: Icon(Icons.star),
    //         subtitle: Text("Descrição do item $index"),
    //       );
    //     },
    //   ),
    // );
  }
}
