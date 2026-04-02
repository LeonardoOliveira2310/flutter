import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Frases do dia",
      home: Column(
        children: [
          Text('Texto 1'),
          Text('Texto 2'),
          Text('Texto 3'),
          Text('Texto 4'),
        ],
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
