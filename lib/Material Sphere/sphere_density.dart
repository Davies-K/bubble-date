import 'package:bubble/Values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SphereDensity extends StatefulWidget {
  final double diameter;
  final Offset lightSource;
  final String color;
  const SphereDensity(
      {Key? key,
      required this.diameter,
      required this.lightSource,
      required this.color})
      : super(key: key);

  @override
  _SphereDensityState createState() => _SphereDensityState();
}

class _SphereDensityState extends State<SphereDensity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.widget.diameter,
      height: this.widget.diameter,
      decoration: BoxDecoration(
        color: Color(0xFFe0f2f1),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
        shape: BoxShape.circle,
        // gradient: RadialGradient(
        //   center:
        //       Alignment(this.widget.lightSource.dx, this.widget.lightSource.dy),
        //   colors: [Colors.white70, Color(0xFFe0f2f1)],
        // ),
      ),
    );
  }
}
