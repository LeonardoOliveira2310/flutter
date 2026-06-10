import 'package:flutter/material.dart';
import 'package:flutter_animation/shape_animation.dart';

class AnimationTeste extends StatefulWidget {
  const AnimationTeste({super.key});

  @override
  State<AnimationTeste> createState() => _AnimationTesteState();
}

class _AnimationTesteState extends State<AnimationTeste> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Desafio do Botão Flutuante")),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsetsGeometry.all(30),
      child: AnimatedAlign(
        curve: Curves.bounceInOut,
        duration: Duration(milliseconds: 330),
        alignment: isAnimated ? Alignment.bottomRight : Alignment.topCenter,
        child: ShapeWidget(
          shape: isAnimated
              ? Circle(size: 100, color: Colors.blueAccent)
              : Rectangle(
                  height: 100,
                  width: 200,
                  borderRadius: 20,
                  color: Colors.redAccent,
                ),
          onTap: () {
            setState(() {
              isAnimated = !isAnimated;
            });
          },
        ),
      ),
    );
  }
}

class ShapeWidget extends StatelessWidget {
  final Shape shape;
  final void Function() onTap;
  const ShapeWidget({super.key, required this.shape, required this.onTap});

  @override
  Widget build(Object context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: Duration(microseconds: 330),
        height: shape.height,
        width: shape.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(shape.borderRadius),
          color: shape.color,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(2, 4),
            ),
          ],
        ),
      ),
    );
  }
}
