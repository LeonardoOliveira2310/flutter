import 'package:flutter/material.dart';

Widget textoCustomizado(String label) {
  return Text(
    label,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      decoration: TextDecoration.underline,
      decorationColor: Colors.white,
      decorationThickness: 2,
    ),
  );
}
