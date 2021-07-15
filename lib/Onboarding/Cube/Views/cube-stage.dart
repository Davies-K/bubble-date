import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'cube-mobile-view.dart';

class CubeStageView extends StatelessWidget {
  const CubeStageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Scaffold(body: ScreenTypeLayout(mobile: CubeMobileView()));
    });
  }
}
