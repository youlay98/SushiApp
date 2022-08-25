import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:sushiapp/Models/menuitem_model.dart';

import 'package:sushiapp/itemsfromcategory.dart';
import 'category_widget.dart';

// ignore: camel_case_types
class itemescateg extends StatefulWidget {
  const itemescateg({Key? key}) : super(key: key);
  @override
  State<itemescateg> createState() => _ItemescategState();
}

class _ItemescategState extends State<itemescateg> {
  @override
  initState() {
    super.initState();

    Provider.of<Itemfromcategory>(context, listen: false).value =
        FirebaseFirestore.instance.collection('foods').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: Provider.of<Itemfromcategory>(
          context,
        ).value,
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: CarouselSlider.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index, realIdx) {
                    menuitem s =
                        menuitem.fromFirestore(snapshot.data!.docs[index]);
                    return ItemWidget(index: index, supe: s);
                  },
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      viewportFraction: 0.58,
                      enlargeStrategy: CenterPageEnlargeStrategy.height),
                ));
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
