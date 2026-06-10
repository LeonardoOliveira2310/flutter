import 'package:flutter/material.dart';
import 'package:flutter_playground/textos_customizados.dart';
import 'botoes_customizados.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool alterado = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.deepOrangeAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "lib/assets/tinder.png",
                fit: BoxFit.cover,
                width: 250,
              ),

              Text(
                "By tapping Create Account or Sign, you agree to our",
                style: TextStyle(color: Colors.white),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textoCustomizado("Terms."),
                    Text(
                      " Learn how we process your data in our",
                      style: TextStyle(color: Colors.white),
                    ),
                    textoCustomizado(" Privacy"),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textoCustomizado("Police"),
                  Text(" and", style: TextStyle(color: Colors.white)),
                  textoCustomizado(" Cookies Policy"),
                ],
              ),

              SizedBox(height: 20),
              botaoCustomizado("SIGN IN WITH APPLE", Icons.apple),
              SizedBox(height: 5),
              botaoCustomizado("SIGN IN WITH FACEBOOK", Icons.facebook),
              SizedBox(height: 5),
              botaoCustomizado("SIGN IN WITH PHONE NUMBER", Icons.message),
              SizedBox(height: 30),
              Text(
                "Trouble Signing in?",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 50),
              Switch(
                value: alterado,
                onChanged: (bool value) {
                  setState(() {
                    alterado = !alterado;
                  });
                },
              ),
              SizedBox(height: 10),
              Text(
                'Save Login',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
