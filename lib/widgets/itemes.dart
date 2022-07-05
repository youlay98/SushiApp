import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sushiapp/Models/menuitem_model.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class itemescateg extends StatefulWidget {
  const itemescateg({Key? key}) : super(key: key);

  @override
  State<itemescateg> createState() => _itemescategState();
}

// ignore: camel_case_types
class _itemescategState extends State<itemescateg> {
  List<menuitem> supe = [
    const menuitem(
        name: 'supe',
        id: 2,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/supe.JPG'),
    const menuitem(
        name: 'supe',
        id: 2,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/supe.JPG'),
    const menuitem(
        name: 'supe',
        id: 2,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/supe.JPG'),
    const menuitem(
        name: 'supe',
        id: 2,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/supe.JPG'),
    const menuitem(
        name: 'supe',
        id: 2,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/supe.JPG'),
    const menuitem(
        name: 'supe',
        id: 2,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/supe.JPG'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.amber,
        height: MediaQuery.of(context).size.height / 2.5,
        child: CarouselSlider.builder(
          itemCount: supe.length,
          itemBuilder: (context, index, realIdx) => buildCategories(index),
          options: CarouselOptions(
              enlargeCenterPage: true,
              viewportFraction: 0.6,
              // aspectRatio: 2.5,
              enlargeStrategy: CenterPageEnlargeStrategy.height),
        ));
  }

  buildCategories(int index) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 10)),
        ],
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20), // Image border
              child: SizedBox.fromSize(
                size: const Size.fromRadius(60), // Image radius
                child: Image.asset(supe[index].image, fit: BoxFit.cover
                    // width: 200,
                    ),
              ),
            ),
            // Image.asset(supe[index].image, height: 145, fit: BoxFit.cover
            //     // width: 200,
            //     ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  supe[index].name,
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      height: 0.2,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                children: [
                  Text(
                    "\$${supe[index].price}",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        height: 0.2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Container(
                      width: 33,
                      height: 33,
                      padding: const EdgeInsets.all(0.01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.black,
                      ),
                      child: const Center(
                          child: Text(
                        "+",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}