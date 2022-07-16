import 'package:flutter/material.dart';
import 'secondroute.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // ignore: non_constant_identifier_names
  double _Opacity = 1.0;
  // with SingleTickerProviderStateMixin {
  // late final AnimationController _controller;
  // late final Animation<double> _animation = CurvedAnimation(
  //   parent: _controller,
  //   curve: Curves.easeInQuart,
  // );
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  void dispose() {
    super.dispose();
  }

  bool play = false;
  @override
  Widget build(BuildContext context) {
    // _controller.forward();
    final double widthSize = MediaQuery.of(context).size.width;
    final double hightSize = MediaQuery.of(context).size.height;

    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 245, 245),
      body: Container(
          color: const Color.fromARGB(255, 250, 248, 248),
          width: widthSize,
          height: hightSize,
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              AnimatedPositioned(
                bottom: play ? hightSize : hightSize * 0.42,
                right: widthSize * 0.2,
                curve: Curves.easeInQuart,
                duration: const Duration(milliseconds: 1000),
                child: AnimatedOpacity(
                    curve: Curves.easeInQuart,
                    duration: const Duration(milliseconds: 900),
                    opacity: _Opacity,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'Assets/sushi2.png',
                        height: hightSize / 1.7,
                        // width: widthSize * 0.8,
                        // height: play ? 0 : hightSize * 0.6,
                      ),
                    )),
              ),

              AnimatedPositioned(
                  curve: Curves.easeInQuart,
                  duration: const Duration(milliseconds: 1000),
                  bottom: play ? 0 : hightSize * 0.1,
                  left: widthSize * 0.09,
                  right: widthSize * 0.09,
                  child: AnimatedOpacity(
                    curve: Curves.easeInQuart,
                    duration: const Duration(milliseconds: 900),
                    opacity: _Opacity,
                    child: Align(
                      child: Image.asset(
                        'Assets/img.png',
                        width: widthSize * 0.3,
                        height: hightSize * 0.4,
                      ),
                    ),
                  )),
              AnimatedPositioned(
                curve: Curves.easeInQuart,
                duration: const Duration(milliseconds: 1000),
                left: widthSize * 0.3,
                top: play ? hightSize : hightSize * 0.84,
                child: AnimatedOpacity(
                  curve: Curves.easeInQuart,
                  duration: const Duration(milliseconds: 900),
                  opacity: _Opacity,
                  child: const Text(
                    'the best fresh sushi delivered ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              AnimatedPositioned(
                  curve: Curves.easeInQuart,
                  duration: const Duration(milliseconds: 1000),
                  left: widthSize * 0.35,
                  top: play ? hightSize : hightSize * 0.86,
                  child: AnimatedOpacity(
                    curve: Curves.easeInQuart,
                    duration: const Duration(milliseconds: 900),
                    opacity: _Opacity,
                    child: const Text(
                      ' straight to your door',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
              AnimatedPositioned(
                curve: Curves.easeInQuart,
                duration: const Duration(milliseconds: 1000),
                bottom: play ? 0 : hightSize * 0.02,
                right: widthSize * 0.09,
                left: widthSize * 0.09,
                child: AnimatedOpacity(
                  curve: Curves.easeInQuart,
                  duration: const Duration(milliseconds: 900),
                  opacity: _Opacity,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        padding: EdgeInsets.only(
                            right: widthSize * 0.1,
                            left: widthSize * 0.1,
                            top: hightSize * 0.02,
                            bottom: hightSize * 0.02),
                      ),
                      onPressed: () {
                        Timer(const Duration(milliseconds: 500), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const seconderoute()),
                          );
                          setState(() {
                            play = !play;
                            _Opacity = 1;
                          });
                        });
                        setState(() {
                          play = !play;
                          _Opacity = 0;
                        });
                      },
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
              )
              // Positioned(
              //     child: Align(
              //   alignment: Alignment.topCenter,
              //   child: AnimatedAlign(
              //     // alignment: Alignment(x,y),
              //     duration: const Duration(seconds: 1),
              //     child: Container(
              //       color: Colors.white,
              //       width: 40,
              //       height: 100,
              //     ),
              //   ),
              // )
              //     // child: Image.asset('Assets/sushi.png')
              //     ),
            ],
          )),
    ));
  }
}
