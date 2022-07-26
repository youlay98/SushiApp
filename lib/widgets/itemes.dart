import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:sushiapp/Models/menuitem_model.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:sushiapp/cart.dart';
// import 'package:sushiapp/detail.dart';
import 'package:sushiapp/itemsfromcategory.dart';
import 'category_widget.dart';
// `import 'animationbuilder.dart';

// ignore: camel_case_types
class itemescateg extends StatelessWidget {
  const itemescateg({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    List<menuitem> supe = Provider.of<Itemfromcategory>(context).l;
    return SizedBox(
        height: MediaQuery.of(context).size.height / 2.5,
        child: CarouselSlider.builder(
          itemCount: supe.length,
          itemBuilder: (context, index, realIdx) =>
              itemwidget(index: index, supe: supe),
          options: CarouselOptions(
              enlargeCenterPage: true,
              viewportFraction: 0.6,
              enlargeStrategy: CenterPageEnlargeStrategy.height),
        ));
  }

  // Categorieswidget(int index, List<menuitem> supe) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       boxShadow: [
  //         BoxShadow(
  //             color: Colors.grey.withOpacity(0.2),
  //             blurRadius: 10,
  //             offset: const Offset(0, 10)),
  //       ],
  //       borderRadius: BorderRadius.circular(30.0),
  //       color: Colors.white,
  //     ),
  //     width: MediaQuery.of(context).size.width * 0.5,
  //     child: Padding(
  //       padding: const EdgeInsets.only(
  //         left: 8,
  //         right: 8,
  //       ),
  //       child: Column(
  //         children: [
  //           ClipRRect(
  //             borderRadius: BorderRadius.circular(20), // Image border
  //             child: SizedBox.fromSize(
  //               size: const Size.fromRadius(60), // Image radius
  //               child: Hero(
  //                 tag: 'img-${supe[index].image}$index',
  //                 child: GestureDetector(
  //                   onTap: () {
  //                     Navigator.push(
  //                       context,
  //                       PageRouteBuilder(
  //                           transitionDuration:
  //                               const Duration(milliseconds: 2000),
  //                           pageBuilder: (_, __, ___) =>
  //                               detail(m: supe[index], index: index)),
  //                     );
  //                   },
  //                   child: Image.asset(supe[index].image, fit: BoxFit.cover
  //                       // width: 200,
  //                       ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           // Image.asset(supe[index].image, height: 145, fit: BoxFit.cover
  //           //     // width: 200,
  //           //     ),
  //           const SizedBox(
  //             height: 30,
  //           ),
  //           Row(
  //             children: [
  //               Text(
  //                 supe[index].name,
  //                 style: GoogleFonts.roboto(
  //                   textStyle: const TextStyle(
  //                     fontWeight: FontWeight.w400,
  //                     fontSize: 15,
  //                     height: 0.2,
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           Expanded(
  //             child: Row(
  //               children: [
  //                 Text(
  //                   "\$${supe[index].price}",
  //                   style: GoogleFonts.roboto(
  //                     textStyle: const TextStyle(
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: 20,
  //                       height: 0.2,
  //                     ),
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   width: 100,
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(bottom: 5),
  //                   child: GestureDetector(
  //                     onTap: () {
  //                       Provider.of<Cart>(context).additem(supe[index], 1);
  //                     },
  //                     child: Container(
  //                       width: 33,
  //                       height: 33,
  //                       padding: const EdgeInsets.all(0.01),
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(30.0),
  //                         color: Colors.black,
  //                       ),
  //                       child: const Center(
  //                           child: Text(
  //                         "+",
  //                         style: TextStyle(color: Colors.white, fontSize: 30),
  //                       )),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
