import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiapp/Auth/utils_class.dart';
import 'package:sushiapp/config/provider_models/userprovider.dart';

import 'forgot_pass_word.dart';

class Loginpage extends StatefulWidget {
  final VoidCallback onClickedSignup;
  const Loginpage({super.key, required this.onClickedSignup});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final formkey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Log in to your food',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              const SizedBox(
                height: 30,
              ),
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
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Password',
                      fillColor: Colors.black,
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
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FogotPasswordPage())),
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      color: Colors.black),
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
                    text: 'No account?',
                    children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedSignup,
                          text: 'Sign Up',
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
                onPressed: () {
                  signin();
                },
                child: const Text(
                  'sign in',
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

  Future signin() async {
    final isvalid = formkey.currentState!.validate();
    if (!isvalid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: ((context) => const Center(
              child: CircularProgressIndicator(),
            )));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      if (!mounted) return;
      Navigator.of(context).popUntil((route) => route.isFirst);
      Provider.of<UserP>(context, listen: false).userId =
          FirebaseAuth.instance.currentUser!.uid;
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
      Navigator.pop(context);
    }
  }
}
