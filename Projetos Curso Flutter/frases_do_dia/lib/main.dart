import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Frases do dia",
      home: Container(
        color: Colors.white,
        child: Column(
          children: [
            Text(
              'A certificação de metodologias que nos auxiliam a lidar com o desafiador cenário globalizado talvez venha a ressaltar a relatividade dos relacionamentos verticais entre as hierarquias.',
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                letterSpacing: 2,
                wordSpacing: 2,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
                decorationColor: Colors.greenAccent,
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
