import 'package:flutter/material.dart';

class Login1 extends StatelessWidget {
  const Login1({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(children: [Background(), CustomCard(), BotaoLogin()]),
    );
  }
}

class BotaoLogin extends StatelessWidget {
  const BotaoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentGeometry.xy(0, 0.76),
          child: GestureDetector(
            onTap: () {
              //Navigator.pushNamed(context, '/home');
              Navigator.pushReplacementNamed(context, '/imcPage');
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              width: 255,
              height: 55,
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentGeometry.xy(0, 0.5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            width: 350,
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Center(child: Text('LOGIN', style: TextStyle(fontSize: 20))),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 16,
                    vertical: 3,
                  ),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'my@mail.com'),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 16,
                    vertical: 3,
                  ),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your password', // The hint text
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment(0, 0),
              colors: <Color>[
                Color.fromARGB(255, 78, 53, 192),
                Colors.blueAccent,
              ],
            ),
          ),
          width: 500,
          height: 365,
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 70,
              child: Icon(
                Icons.house_rounded,
                size: 100,
                color: Colors.blueAccent,
                shadows: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          color: Colors.white,
          width: 500,
          height: 365,
          child: Align(
            alignment: AlignmentGeometry.xy(0, 0.77),
            child: Text(
              "FORGOT PASSWORD?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
