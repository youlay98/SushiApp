import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sushiapp/Auth/authpage.dart';
import 'package:sushiapp/Auth/verify_email_page.dart';

class Loginandsigninpage extends StatelessWidget {
  const Loginandsigninpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const VerifyEmailPage();
              } else {
                return const Authpage();
              }
            }),
      ),
    );
  }
}
