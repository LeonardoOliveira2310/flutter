import 'package:flutter/material.dart';
import 'package:flutter_animation/login1.dart';

//import 'package:flutter_animation/scroll_view.dart';

void main() {
  //runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Login2()));
  //runApp(MaterialApp(debugShowCheckedModeBanner: false, home: CarouselExampleApp()));
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      // routes: <String, WidgetBuilder>{
      //   '/': (context) => Login1(),
      //   '/home': (context) => HomePage(),
      //   '/details': (context) => DetailsPage(),
      //   '/imcPage': (context) => ImcPage(),
      // },
      home: Login1(),
    ),
  );
}
