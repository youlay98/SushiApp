import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:sushiapp/Auth/utils_class.dart';
import 'package:sushiapp/secondroute.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerfied = false;
  bool canResendEmail = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    isEmailVerfied = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerfied) {
      sendVerificationEmail();
    }
    timer =
        Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double hightSize = MediaQuery.of(context).size.height;
    return isEmailVerfied
        ? const seconderoute()
        : Scaffold(
            appBar: AppBar(
              title: const Text(
                'verify your email',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'A verification email has been sent to your email.',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.only(
                          right: widthSize * 0.1,
                          left: widthSize * 0.1,
                          top: hightSize * 0.02,
                          bottom: hightSize * 0.02),
                    ),
                    onPressed: canResendEmail ? sendVerificationEmail : null,
                    icon: const Icon(Icons.email_outlined),
                    label: const Text(
                      'resent email',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.only(
                          right: widthSize * 0.1,
                          left: widthSize * 0.1,
                          top: hightSize * 0.02,
                          bottom: hightSize * 0.02),
                    ),
                    onPressed: () => FirebaseAuth.instance.signOut(),
                    icon: const Icon(Icons.email_outlined),
                    label: const Text(
                      'cancel',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerfied = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerfied) timer?.cancel();
  }
}
