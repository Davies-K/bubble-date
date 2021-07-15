import 'dart:math';
import 'dart:math' as math;
import 'package:bubble/Material%20Sphere/shadow.dart';
import 'package:bubble/Values/values.dart';
import 'package:flutter/cupertino.dart';

import '../blendmask.dart';
import 'sphere_density.dart';

class MaterialBall extends StatefulWidget {
  final double ballSize;
  AnimationController controller;
  //final Animation animation;
  final String color;
  MaterialBall(
      {Key? key,
      required this.ballSize,
      required this.controller,
      required this.color})
      : super(key: key);

  @override
  _MaterialBallState createState() => _MaterialBallState();
}

class _MaterialBallState extends State<MaterialBall>
    with SingleTickerProviderStateMixin {
  static const lightSource = Offset(0, -0.75);
  int max = 15;
  int min = 10;
  int randomNumber = 0;
  late Animation animation;

  @override
  void initState() {
    randomNumber = min + Random().nextInt(max - min);

    this.widget.controller = AnimationController(
        vsync: this, duration: Duration(seconds: 30 + randomNumber));

    this.widget.controller.forward();

    animation = Tween(
      begin: 0.0,
      end: math.pi * 20,
    ).animate(CurvedAnimation(
      parent: this.widget.controller,
      curve: SineCurve(),
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: this.widget.controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(
              0.0,
              animation.value,
            ),
            child: SphereDensity(
                lightSource: lightSource,
                diameter: widget.ballSize,
                color: widget.color),
          );
        });
  }
}
