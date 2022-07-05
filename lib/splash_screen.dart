import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double wightSize = MediaQuery.of(context).size.height;

    return const MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
    ));
  }
}
