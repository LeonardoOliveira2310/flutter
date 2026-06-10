import 'package:flutter/material.dart';

class HomeScroll extends StatefulWidget {
  const HomeScroll({super.key});

  @override
  State<HomeScroll> createState() => _HomeScrollState();
}

class _HomeScrollState extends State<HomeScroll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Container(height: 50, width: double.infinity, color: Colors.red),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(width: 50, color: Colors.red),
                  SizedBox(width: 5),
                  Container(width: 50, color: Colors.blue),
                  SizedBox(width: 5),
                  Container(width: 50, color: Colors.black),
                  SizedBox(width: 5),
                  Container(width: 50, color: Colors.black),
                  SizedBox(width: 5),
                  Container(width: 50, color: Colors.black),
                  SizedBox(width: 5),
                  Container(width: 50, color: Colors.black),
                  SizedBox(width: 5),
                  Container(width: 50, color: Colors.black),
                  SizedBox(width: 5),
                  Container(width: 50, color: Colors.black),
                  SizedBox(width: 5),
                  Container(width: 50, color: Colors.blue),
                  SizedBox(width: 5),
                  Container(width: 50, color: Colors.red),
                ],
              ),
            ),

            SizedBox(height: 5),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.yellow,
            ),
            SizedBox(height: 5),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.yellow,
            ),
            SizedBox(height: 5),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.yellow,
            ),
            SizedBox(height: 5),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
