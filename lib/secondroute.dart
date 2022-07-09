import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'widgets/category_card.dart';
import 'widgets/itemes.dart';
import 'itemsfromcategory.dart';
import 'widgets/spieceloffer.dart';
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
    return ChangeNotifierProvider(
      create: (_) => Itemfromcategory(),
      child: MaterialApp(
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(hightSize / 10),
            child: AppBar(
              elevation: 0,
              // backgroundColor: Colors.white,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }
                    // showSearch(context: context, delegate: Mysearch)
                    ,
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }
                    // showSearch(context: context, delegate: Mysearch)
                    ,
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ))
              ],
              leading: Padding(
                  padding: EdgeInsets.only(
                      left: widthSize / 30,
                      top: hightSize / 100,
                      bottom: hightSize / 100),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                  )),
              backgroundColor: Colors.white,
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
                Text(
                  '  what would you \n  like to order',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 30),
                  ),
                ),
                SizedBox(height: hightSize / 13),
                const CategoryCard(),
                // const Categoryy()
                const itemescateg(),
                Padding(
                  padding: EdgeInsets.only(left: widthSize / 30),
                  child: Text(
                    'Special for you',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: hightSize / 30,
                ),
                const SpicelOffer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
