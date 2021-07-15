import 'dart:async';
import 'package:bubble/Constants/constants.dart';
import 'package:bubble/Material%20Sphere/sphere_ball.dart';
import 'package:bubble/Values/values.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CubeMobileView extends StatefulWidget {
  @override
  _CubeMobileViewState createState() => _CubeMobileViewState();
}

class _CubeMobileViewState extends State<CubeMobileView>
    with SingleTickerProviderStateMixin {
  late List<GlobalKey<_CubeMobileViewState>> keys;
  late AnimationController _controller;
  late Animation animation;

  int rangeIndex = 0;
  List<String> colorRange = [
    "f6dee6",
    "E2DDF7",
    "CAE5E4",
    "F6D9DE",
    "CFE3ED",
    "CCE6CD",
    "D6E0F5",
    "D5E5C7",
    "F8D9E2"
  ];
  void startTimer() {
    Timer.periodic(Duration(seconds: 2), (Timer t) {
      print('changing color');
      if (rangeIndex == colorRange.length) {
        rangeIndex = 0;
      }
      setState(() {
        backgroundColor = colorRange[rangeIndex];
      });
      rangeIndex += 1;
    });
  }

  @override
  void initState() {
    startTimer();

    keys = List.generate(20, (_) => GlobalKey<_CubeMobileViewState>());
    print(keys);

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4000));
    _controller.addListener(() {});

    // animation = Tween(
    //   begin: 0.0,
    //   end: math.pi * 20,
    // ).animate(_controller)
    //   ..addListener(() {
    //     setState(() {});
    //   });

    _controller.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        _controller.reset();
      } else if (state == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //background color change
        AnimatedContainer(
            height: double.infinity,
            duration: Duration(seconds: 1),
            color: HexColor.fromHex(backgroundColor)),

        //Shadow
        // Positioned(
        //     top: 230,
        //     left: 80,
        //     right: 80,
        //     child: Transform(
        //       transform: Matrix4.identity()..rotateX(math.pi / 2.2),
        //       origin: Offset(0, Utils.screenWidth * 0.5),
        //       child: Container(
        //         alignment: Alignment.center,
        //         width: Utils.screenWidth * 0.8,
        //         height: Utils.screenWidth * 0.8,
        //         decoration: BoxDecoration(
        //             // color: Colors.black,
        //             shape: BoxShape.circle,
        //             boxShadow: [
        //               BoxShadow(
        //                   blurRadius: 40, color: Colors.grey.withOpacity(0.50))
        //             ]),
        //       ),
        //     )),

        // Positioned(
        //     top: 200,
        //     left: 80,
        //     right: 80,
        //     child: Container(
        //         //color: Colors.yellow,
        //         alignment: Alignment.center,
        //         // width: Utils.screenWidth * 0.1,
        //         height: Utils.screenHeight * 0.5,
        //         child: Stack(alignment: Alignment.center,
        //             //we need 3 stacks
        //             children: [
        //               //last layered stack
        //               Positioned(
        //                 top: 0,
        //                 child: Container(
        //                     // color: Colors.green,
        //                     // alignment: Alignment.center,
        //                     height: Utils.screenHeight * 0.25,
        //                     width: Utils.screenHeight * 0.3,
        //                     child: Stack(children: [
        //                       Positioned(
        //                         child: MaterialBall(
        //                           color: "BDD8EE",
        //                           controller: _controller,
        //                           key: keys[0],
        //                           ballSize: 25,
        //                         ),
        //                       ),
        //                       Positioned(
        //                         bottom: 0,
        //                         right: 0,
        //                         child: MaterialBall(
        //                           color: "#f035e0",
        //                           controller: _controller,
        //                           key: keys[1],
        //                           ballSize: 10,
        //                         ),
        //                       ),
        //                       Positioned(
        //                         bottom: 2,
        //                         right: 33,
        //                         child: MaterialBall(
        //                           color: "#4287f5",
        //                           controller: _controller,
        //                           key: keys[2],
        //                           ballSize: 20,
        //                         ),
        //                       ),
        //                       Positioned(
        //                         bottom: 0,
        //                         right: 75,
        //                         child: MaterialBall(
        //                           color: "#4287f5",
        //                           controller: _controller,
        //                           key: keys[3],
        //                           ballSize: 20,
        //                         ),
        //                       )
        //                     ])),
        //               ),

        //               //middle Stack
        //               Positioned(
        //                 top: 10,
        //                 child: Container(
        //                     //color: Colors.blue,
        //                     alignment: Alignment.center,
        //                     height: Utils.screenHeight * 0.25,
        //                     width: Utils.screenHeight * 0.3,
        //                     child: Stack(children: [
        //                       Positioned(
        //                         left: 50,
        //                         child: MaterialBall(
        //                             color: "#35cef0",
        //                             controller: _controller,
        //                             key: keys[4],
        //                             ballSize: 15),
        //                       ),
        //                       Positioned(
        //                         left: 20,
        //                         right: 20,
        //                         child: MaterialBall(
        //                             color: "BDD8EE",
        //                             controller: _controller,
        //                             key: keys[10],
        //                             ballSize: 25),
        //                       ),
        //                       Positioned(
        //                         left: 20,
        //                         bottom: 3,
        //                         child: MaterialBall(
        //                             color: "#35cef0",
        //                             controller: _controller,
        //                             key: keys[11],
        //                             ballSize: 15),
        //                       ),
        //                       Positioned(
        //                         top: 20,
        //                         right: 20,
        //                         child: MaterialBall(
        //                             color: "#35cef0",
        //                             controller: _controller,
        //                             key: keys[12],
        //                             ballSize: 15),
        //                       ),
        //                       Positioned(
        //                         bottom: 0,
        //                         left: 40,
        //                         child: MaterialBall(
        //                             color: "BDD8EE",
        //                             controller: _controller,
        //                             key: keys[13],
        //                             ballSize: 15),
        //                       ),
        //                       Positioned(
        //                         top: 0,
        //                         bottom: 59,
        //                         child: MaterialBall(
        //                             color: "#35cef0",
        //                             controller: _controller,
        //                             key: keys[14],
        //                             ballSize: 15),
        //                       ),
        //                     ])),
        //               ),

        //               //first Stack
        //               Positioned(
        //                 top: 30,
        //                 bottom: 0,
        //                 child: Container(
        //                     // color: Colors.red,
        //                     //alignment: Alignment.center,
        //                     height: Utils.screenHeight * 0.25,
        //                     width: Utils.screenHeight * 0.3,
        //                     child: Stack(children: [
        //                       Positioned(
        //                         child: MaterialBall(
        //                             color: "#f035e0",
        //                             controller: _controller,
        //                             key: keys[5],
        //                             ballSize: 20),
        //                       ),
        //                       Positioned(
        //                         child: MaterialBall(
        //                             color: "#f035e0",
        //                             controller: _controller,
        //                             key: keys[6],
        //                             ballSize: 20),
        //                       ),
        //                       Positioned(
        //                         bottom: 35,
        //                         right: 65,
        //                         child: MaterialBall(
        //                             color: "#f035e0",
        //                             controller: _controller,
        //                             key: keys[7],
        //                             ballSize: 20),
        //                       ),
        //                       Positioned(
        //                         bottom: 35,
        //                         right: 25,
        //                         child: MaterialBall(
        //                             color: "#f035e0",
        //                             controller: _controller,
        //                             key: keys[8],
        //                             ballSize: 25),
        //                       ),
        //                       Positioned(
        //                         bottom: 30,
        //                         right: 5,
        //                         child: MaterialBall(
        //                             color: "#f035e0",
        //                             controller: _controller,
        //                             key: keys[9],
        //                             ballSize: 25),
        //                       ),
        //                     ])),
        //               )
        //             ]))),

        Positioned(
            top: 50,
            right: 30,
            child: ActionChip(
                backgroundColor: Colors.white,
                label: const Text(
                  'Skip',
                ),
                onPressed: () {
                  print(
                      'If you stand for nothing, Burr, what’ll you fall for?');
                })),

        Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: Container(

                //padding: EdgeInsets.all(20),
                // margin: EdgeInsets.all(20),
                height: 80,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text("Ok, got it",
                        style: AppStyles.bottomLinkTextStyle)))),

        Positioned(
            bottom: 300,
            left: 20,
            right: 20,
            child: Container(
                child: Center(
                    child: Column(
              children: [
                Text("Track your work.", style: AppStyles.brandTextStyle),
                Text("Get results.", style: AppStyles.brandTextStyle),
              ],
            ))))
      ],
    ));
  }
}
