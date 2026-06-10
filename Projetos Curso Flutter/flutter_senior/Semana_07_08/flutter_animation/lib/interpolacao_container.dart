import 'package:flutter/material.dart';

class InterpolacaoContainer extends StatefulWidget {
  const InterpolacaoContainer({super.key});

  @override
  State<InterpolacaoContainer> createState() => _InterpolacaoContainerState();
}

class _InterpolacaoContainerState extends State<InterpolacaoContainer>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  late final AnimationController controller;
  late final Animation<double> sizeAnimation;
  late final Animation<double> borderAnimation;
  late final Animation<double> textAnimation;
  late final Animation<double> progressAnimation;
  late final Animation<Color?> colorAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    controller.addListener(() {
      setState(() {});
    });
    textAnimation = Tween<double>(begin: 1, end: 0).animate(controller);
    progressAnimation = Tween<double>(begin: 0, end: 1).animate(controller);

    sizeAnimation = Tween<double>(begin: 300, end: 70).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.bounceOut,
        reverseCurve: Curves.ease,
      ),
    );
    borderAnimation = Tween<double>(begin: 15, end: 40).animate(controller);
    colorAnimation = ColorTween(
      begin: Colors.blueAccent,
      end: Colors.redAccent,
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: GestureDetector(
          onTap: () {
            controller.isCompleted
                ? controller.reverse()
                : controller.forward();
          },
          child: Container(
            height: 70,
            width: sizeAnimation.value,
            decoration: BoxDecoration(
              color: colorAnimation.value,
              borderRadius: BorderRadius.circular(borderAnimation.value),
            ),
            alignment: Alignment.center,
            child: Stack(
              children: [
                Opacity(
                  opacity: progressAnimation.value,
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                Opacity(
                  opacity: textAnimation.value,
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
