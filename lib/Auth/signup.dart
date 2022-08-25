import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sushiapp/Auth/utils_class.dart';

class SignUpwidget extends StatefulWidget {
  final VoidCallback onClickedSignIn;
  const SignUpwidget({super.key, required this.onClickedSignIn});

  @override
  State<SignUpwidget> createState() => _SignUpwidgetState();
}

class _SignUpwidgetState extends State<SignUpwidget> {
  final email = TextEditingController();
  final password = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double hightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(
                height: hightSize / 3,
              ),
              const Text(
                'Log in to your food',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              const SizedBox(
                height: 30,
              ),
              // Image.asset(
              //   'Assets/img.png',
              //   height: hightSize / 5,
              //   width: hightSize / 5,
              // ),
              Row(
                children: [
                  SizedBox(
                    width: widthSize / 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 4.0,
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.only(
                          right: widthSize * 0.25,
                          left: widthSize * 0.25,
                          top: hightSize * 0.02,
                          bottom: hightSize * 0.02),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          'Assets/google.png',
                          height: hightSize / 30,
                          width: hightSize / 30,
                        ),
                        SizedBox(
                          width: widthSize / 30,
                        ),
                        const Text(
                          'login with Google',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: hightSize / 20,
              ),

              SizedBox(
                width: widthSize / 1.2,
                child: TextFormField(
                  controller: email,
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Email',
                      labelStyle: const TextStyle(fontSize: 20)),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: widthSize / 1.2,
                child: TextFormField(
                  controller: password,
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Password',
                      labelStyle: const TextStyle(fontSize: 20)),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length < 6
                      ? 'Enter min. 6 characters   '
                      : null,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    text: 'Already have an account?',
                    children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedSignIn,
                          text: 'Sign In',
                          style: const TextStyle(
                              decoration: TextDecoration.underline))
                    ]),
              ),
              SizedBox(
                height: hightSize / 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.only(
                      right: widthSize * 0.1,
                      left: widthSize * 0.1,
                      top: hightSize * 0.02,
                      bottom: hightSize * 0.02),
                ),
                onPressed: signup,
                child: const Text(
                  'sign up',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              SizedBox(
                height: hightSize / 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future signup() async {
    final isvalid = formkey.currentState!.validate();
    if (!isvalid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: ((context) => const Center(
              child: CircularProgressIndicator(),
            )));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      if (!mounted) return;
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
      Navigator.pop(context);
    }
  }
}
