import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Frases do dia",
      home: Container(
        color: Colors.white,
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                // Ação ao pressionar o botão
                debugPrint('Botão pressionado!');
              },
              child: Text(
                'Clique aqui',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
      // home: Row(
      //   children: [
      //     Text('Texto 1'),
      //     Text('Texto 2'),
      //     Text('Texto 3'),
      //     Text('Texto 4'),
      //   ],
      // ),
    ),
  );
}
