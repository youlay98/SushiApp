import 'package:flutter/material.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? e) {
    if (e == null) return null;
    final snackBar = SnackBar(
      content: Text(e),
      backgroundColor: Colors.red,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static showSnackBargreen(String? e) {
    if (e == null) return null;
    final snackBar = SnackBar(
      content: Text(e),
      backgroundColor: Colors.green,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
