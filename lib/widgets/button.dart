import 'package:flutter/material.dart';

class buttonwidget extends StatelessWidget {
  final String text;
  const buttonwidget({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double hightSize = MediaQuery.of(context).size.height;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadowColor: Colors.grey,
        elevation: 20,
        primary: Colors.black,
        padding: EdgeInsets.only(
            right: widthSize * 0.3,
            left: widthSize * 0.3,
            top: hightSize * 0.03,
            bottom: hightSize * 0.03),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }
}
