import 'package:flutter/material.dart';
import '../Home/secondroute.dart';
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
      body: SizedBox.expand(
        child: Stack(
          // clipBehavior: Clip.hardEdge,
          children: [
            AnimatedPositioned(
              bottom: play ? hightSize : hightSize / 2.1,
              right: widthSize / 4.5,
              curve: Curves.decelerate,
              duration: const Duration(milliseconds: 1000),
              child: AnimatedOpacity(
                  curve: Curves.decelerate,
                  duration: const Duration(milliseconds: 2500),
                  opacity: _Opacity,
                  child: Container(
                    color: Colors.red,
                    width: widthSize,
                    height: hightSize,
                    child: Image.asset(
                      'Assets/sushi2.png',

                      // height: play ? 0 : hightSize * 0.6,
                    ),
                  )),
            ),

            AnimatedPositioned(
                curve: Curves.decelerate,
                duration: const Duration(milliseconds: 1000),
                top: play ? hightSize : hightSize * 0.5,
                left: widthSize * 0.09,
                right: widthSize * 0.09,
                child: AnimatedOpacity(
                  curve: Curves.decelerate,
                  duration: const Duration(milliseconds: 2500),
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
              curve: Curves.decelerate,
              duration: const Duration(milliseconds: 1000),
              left: widthSize * 0.3,
              top: play ? hightSize : hightSize * 0.84,
              child: AnimatedOpacity(
                curve: Curves.decelerate,
                duration: const Duration(milliseconds: 2500),
                opacity: _Opacity,
                child: const Text(
                  'the best fresh sushi delivered ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            AnimatedPositioned(
                curve: Curves.decelerate,
                duration: const Duration(milliseconds: 1000),
                left: widthSize * 0.35,
                top: play ? hightSize : hightSize * 0.86,
                child: AnimatedOpacity(
                  curve: Curves.decelerate,
                  duration: const Duration(milliseconds: 2500),
                  opacity: _Opacity,
                  child: const Text(
                    ' straight to your door',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
            AnimatedPositioned(
              curve: Curves.decelerate,
              duration: const Duration(milliseconds: 2000),
              top: play ? hightSize * 0.8 : hightSize * 0.9,
              right: widthSize * 0.09,
              left: widthSize * 0.09,
              child: AnimatedOpacity(
                curve: Curves.decelerate,
                duration: const Duration(milliseconds: 2500),
                opacity: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.only(
                          right: widthSize * 0.1,
                          left: widthSize * 0.1,
                          top: hightSize * 0.02,
                          bottom: hightSize * 0.02),
                    ),
                    onPressed: () {
                      setState(() {
                        play = !play;
                        _Opacity = 0;
                      });
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
            //     duration: const Duration(milliseconds: 1),
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
        ),
      ),
    ));
  }
}
