import 'package:sushiapp/Auth/loginpage.dart';
import 'package:sushiapp/Auth/signup.dart';
import 'package:flutter/material.dart';

class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  bool islogin = true;

  @override
  Widget build(BuildContext context) {
    return islogin
        ? Loginpage(onClickedSignup: toggel)
        : SignUpwidget(
            onClickedSignIn: toggel,
          );
  }

  void toggel() => setState(() => islogin = !islogin);
}
