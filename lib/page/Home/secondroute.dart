import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widget/category_card.dart';
import 'widget/itemes.dart';
import 'widget/spieceloffer.dart';
import '../../Animation/animationbuilder.dart';
import '../../Globalwidgets/notificationwedgit.dart';
// import 'test.dart';

// ignore: camel_case_types
class seconderoute extends StatefulWidget {
  const seconderoute({Key? key}) : super(key: key);

  @override
  State<seconderoute> createState() => _seconderouteState();
}

// ignore: camel_case_types
class _seconderouteState extends State<seconderoute> {
  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double hightSize = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(hightSize / 10),
          child: Padding(
            padding: EdgeInsets.only(top: hightSize / 50),
            child: AppBar(
              elevation: 0,
              // backgroundColor: Colors.white,
              actions: [
                Animationbuilder(
                  child: IconButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        // Navigator.pop(context);
                      },
                      icon: const Icon(Icons.search,
                          color: Colors.black, size: 30)),
                ),
                Animationbuilder(
                  child: const Notiffication(),
                )
              ],
              leading: Animationbuilder(
                child: Padding(
                    padding: EdgeInsets.only(
                        left: widthSize / 30,
                        top: hightSize / 100,
                        bottom: hightSize / 100),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                    )),
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Animationbuilder(
                child: Text(
                  '  What would you \n  like to order?',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: (widthSize * hightSize) * 0.00012),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
                width: widthSize,
              ),
              const CategoryCard(),
              Animationbuilder(child: const itemescateg()),
              Padding(
                padding:
                    EdgeInsets.only(left: widthSize / 8, top: hightSize / 30),
                child: Animationbuilder(
                  child: Text(
                    'Special for you',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 23),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: hightSize / 80,
              ),
              const SpicelOffer()
            ],
          ),
        ),
      ),
    );
  }
}
