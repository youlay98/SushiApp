import 'dart:async';

import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  // final Widget? s;
  final Future<String>? f;
  const MyWidget({super.key, required this.f});

  @override
  Widget build(BuildContext context) {
    double widthsize = MediaQuery.of(context).size.width;
    return FutureBuilder<String>(
        future: f,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color.fromARGB(255, 232, 222, 222),
                ),
                width: widthsize / 4,
                height: widthsize / 4,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2, bottom: 2),
                    child: Image.network(snapshot.data!, fit: BoxFit.cover),
                  ),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}

// class MyWidget2 extends StatefulWidget {
//   const MyWidget2({super.key});

//   @override
//   State<MyWidget2> createState() => _MyWidget2State();
// }

// class _MyWidget2State extends State<MyWidget2> {
//   @override
//   initState() {
//     super.initState();
//   }

//   jusstst() {
//     setState(() {});
//   }

//   List<menuitem> supe = [];
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Scaffold(
//         body: Center(
//           child: StreamBuilder(
//               stream:
//                   FirebaseFirestore.instance.collection('foods').snapshots(),
//               builder: (context,
//                   AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 if (snapshot.hasData) {
//                   return SizedBox(
//                       height: MediaQuery.of(context).size.height / 3,
//                       child: CarouselSlider.builder(
//                         itemCount: snapshot.data!.docs.length,
//                         itemBuilder: (context, index, realIdx) {
//                           menuitem s = menuitem
//                               .fromFirestore(snapshot.data!.docs[index]);
//                           return ItemWidget(index: index, supe: s);
//                         },
//                         options: CarouselOptions(
//                             enlargeCenterPage: true,
//                             viewportFraction: 0.58,
//                             enlargeStrategy: CenterPageEnlargeStrategy.height),
//                       ));
//                 }

//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }),
//         ),
//         appBar: AppBar(actions: [
//           IconButton(
//               onPressed: () {
//                 // setState(() {});

//                 // Provider.of<Itemfromcategory>(context, listen: false).mystream =
//                 //     Provider.of<Itemfromcategory>(context, listen: false)
//                 //         .list('test');
//               },
//               icon: const Icon(Icons.search, color: Colors.black, size: 30)),
//         ]),
//       ),
//     );
//   }
// }

// class ItemWidget extends StatelessWidget {
//   final int index;
//   final menuitem supe;
//   const ItemWidget({super.key, required this.index, required this.supe});

//   @override
//   Widget build(BuildContext context) {
//     double hightSize = MediaQuery.of(context).size.height;
//     double widthSize = MediaQuery.of(context).size.width;
//     return FutureBuilder<String>(
//         future: downloadFromFirebase(supe.image),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Container(
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.grey.withOpacity(0.08),
//                       blurRadius: 10,
//                       offset: const Offset(0, 10)),
//                 ],
//                 borderRadius: BorderRadius.circular(30.0),
//               ),
//               width: MediaQuery.of(context).size.width * 0.5,
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                   left: 8,
//                   right: 8,
//                 ),
//                 child: Column(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(
//                           widthSize * 0.01), // Image border
//                       child: SizedBox.fromSize(
//                         size: Size.fromRadius(
//                             (widthSize * hightSize) * 0.00017), // Image radius
//                         child: Hero(
//                           tag: 'img-${supe.image}$index',
//                           child: GestureDetector(
//                             onTap: () {
//                               // Navigator.push(
//                               //   context,
//                               //   PageRouteBuilder(
//                               //       transitionDuration:
//                               //           const Duration(milliseconds: 2000),
//                               //       pageBuilder: (_, __, ___) =>
//                               //           detail(m: supe[index], index: index)),
//                               // );
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.only(top: 9),
//                               child: Image.network(snapshot.data!,
//                                   fit: BoxFit.cover),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: hightSize / 30,
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Text(
//                             supe.name,
//                             style: GoogleFonts.inter(
//                               textStyle: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: (widthSize * hightSize) * 0.00006,
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: hightSize / 100,
//                     ),
//                     Expanded(
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               "\$${supe.price}",
//                               style: GoogleFonts.inter(
//                                 textStyle: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: (widthSize * hightSize) * 0.00006,
//                                   height: 0.2,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Provider.of<Cart>(context, listen: false)
//                                   .additem(supe, 1, context);
//                             },
//                             child: Padding(
//                               padding:
//                                   EdgeInsets.only(bottom: hightSize * 0.02),
//                               child: Container(
//                                 width: widthSize / 14,
//                                 height: widthSize / 14,
//                                 // padding: const EdgeInsets.all(0.01),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Colors.black,
//                                 ),
//                                 child: Align(
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     "+",
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize:
//                                             (hightSize * widthSize) * 0.00007),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           }
//           if (snapshot.hasError) {
//             return const Center(
//               child: Text('something wrong with image to load'),
//             );
//           }
//           if (!snapshot.hasData) {
//             const Center(
//               child: Text('waiting for data....'),
//             );
//           }
//           return const Center(child: CircularProgressIndicator());
//         });
//   }

//   Future<String> downloadFromFirebase(String s) async {
//     Reference ref = FirebaseStorage.instance.ref().child(s);
//     String myUrl = await ref.getDownloadURL();
//     return myUrl.toString();
//   }
// }

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: FutureBuilder<String>(
//           future: downloadFromFirebase(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Center(
//                   child: Container(
//                 height: 200,
//                 width: 200,
//                 color: Colors.amber,
//                 child: Image.network(snapshot.data!),
//               ));
//             }
//             if (!snapshot.hasData) {
//               return Container(
//                 color: Colors.red,
//                 child: const Center(child: CircularProgressIndicator()),
//               );
//             }
//             return Container(
//               color: Colors.amber,
//               child: const Center(child: CircularProgressIndicator()),
//             );
//           }),
//     );
//   }

//   Future<String> downloadFromFirebase() async {
//     Reference ref = FirebaseStorage.instance.ref().child("PngItem_1219528.png");
//     String myUrl = await ref.getDownloadURL();
//     print('${myUrl.toString()}just testttttttttttttttttt');
//     return myUrl.toString();
//   }
// }
