import 'package:flutter/material.dart';

Widget botaoCustomizado(String label, IconData icon) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white),
      color: Colors.deepOrangeAccent,
      borderRadius: BorderRadius.circular(50),
    ),
    width: 350,
    height: 50,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Icon(icon, color: Colors.white),
          ),
        ),
        SizedBox(width: 8),
        Center(
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    ),
  );
}
