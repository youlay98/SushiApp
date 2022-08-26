import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final String text;
  final double? textheight;
  final double height;
  final double width;
  final double fontsize;
  const MyWidget(
      {super.key,
      required this.text,
      this.textheight,
      required this.height,
      required this.width,
      required this.fontsize});

  @override
  Widget build(BuildContext context) {
    double heightsize = MediaQuery.of(context).size.height;

    return Container(
      width: heightsize / 25,
      height: heightsize / 25,
      // padding: const EdgeInsets.all(0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.black,
      ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 26,
          height: textheight,
        ),
      )),
    );
  }
}
