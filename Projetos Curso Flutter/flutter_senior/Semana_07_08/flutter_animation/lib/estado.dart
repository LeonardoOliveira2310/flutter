import 'package:flutter/material.dart';

class EstadoPage extends StatefulWidget {
  const EstadoPage({super.key});

  @override
  State<EstadoPage> createState() => _EstadoPageState();
}

class _EstadoPageState extends State<EstadoPage> {
  var counter = 0;
  var text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Image.network(
              "https://cdn.mos.cms.futurecdn.net/QmY5fRUXJEtnzhTgXLSY5A.jpg",
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  text = value;
                });
              },
            ),
            Text(text),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          counter++;
          setState(() {});
        },
      ),
    );
  }
}
