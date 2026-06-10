import 'package:flutter/material.dart';

class Login2 extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(
        builder: (context, constraint) {
          return Stack(children: [Background(), BodyWidget()]);
        },
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
      width: mediaQuery.size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: mediaQuery.size.height * 0.3),
          CustomCard(),
          SizedBox(height: 30),
          Text(
            "FORGOT PASSWORD?",
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 300,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            height: 225,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  offset: Offset(0, 1.5),
                  blurRadius: 5,
                  spreadRadius: 3,
                  blurStyle: BlurStyle.normal,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 46,
              width: 230,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Text("LOGIN", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 1],
                colors: [Colors.blue, Color.fromARGB(255, 63, 16, 166)],
              ),
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
                child: Container(
                  width: mediaQuery.size.height * 0.14,
                  height: mediaQuery.size.height * 0.14,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.home,
                    color: Colors.blue,
                    size: mediaQuery.size.height * 0.07,
                  ),
                ),
              ),
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
