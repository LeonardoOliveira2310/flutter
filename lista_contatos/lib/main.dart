import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Contatos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: ListaContatos(
        contatos: [
          'Cuca',
          'Dona Benta',
          'Saci Pererê',
          'Visconde de Sabugosa',
          'Narizinho',
        ],
      ),
    );
  }
}

class ListaContatos extends StatelessWidget {
  ListaContatos({required this.contatos});
  final List<String> contatos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.contact_phone),
        centerTitle: true,
        title: Text("Lista de Contatos"),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (BuildContext context, int index) =>
            LinhaContato(contato: contatos[index]),
      ),
    );
  }
}

class LinhaContato extends StatelessWidget {
  const LinhaContato({required this.contato});
  final String contato;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person_outline),
      title: Text(contato),
      trailing: Container(
        width: 60,
        child: Row(
          children: [Icon(Icons.edit), SizedBox(width: 10), Icon(Icons.delete)],
        ),
      ),
    );
  }
}
