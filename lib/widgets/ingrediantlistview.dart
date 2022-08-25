import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:sushiapp/Models/ingredients.dart';
import 'animationbuilder.dart';

// ignore: must_be_immutable, camel_case_types
class ingredientdetail extends StatefulWidget {
  String id;
  ingredientdetail({Key? key, required this.id}) : super(key: key);

  @override
  State<ingredientdetail> createState() => _ingredientdetailState();
}

// ignore: camel_case_types
class _ingredientdetailState extends State<ingredientdetail> {
  Future<QuerySnapshot<Map<String, dynamic>>>? v;
  @override
  void initState() {
    super.initState();
    v = FirebaseFirestore.instance
        .collection('foods')
        .doc(widget.id)
        .collection('Ingrediant')
        .get();
  }

  @override
  Widget build(BuildContext context) {
    double hightSize = MediaQuery.of(context).size.height;
    double widthSize = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: widthSize / 10, top: hightSize / 35),
      child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: v,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                height: hightSize / 2.4,
                width: widthSize / 5,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      Ingredient ing =
                          Ingredient.fromFirestore(snapshot.data!.docs[index]);
                      return ingredientmethoddetail(ing, hightSize, widthSize);
                    }),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }

  ingredientmethoddetail(Ingredient ing, double hightSize, double widthSize) {
    return Padding(
      padding: EdgeInsets.only(top: hightSize / 35, left: 5, right: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              // spreadRadius: 2,
              blurRadius: 4,
              // changes position of shadow
            ),
          ],
        ),
        height: hightSize / 10,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40), // Image border
              child: SizedBox.fromSize(
                size: Size.fromRadius(
                    (widthSize * hightSize) * 0.00007), // Image radius
                child: Animationbuilder(
                  child: FutureBuilder<String>(
                      future: downloadFromFirebase(ing.img),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Image.network(snapshot.data!, fit: BoxFit.cover
                              // width: 200,
                              );
                        }
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text('there is an erorr'),
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      }),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Animationbuilder(
              child: Text(
                ing.nam,
                style: TextStyle(
                    fontSize: (widthSize * hightSize) * 0.00004,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<String> downloadFromFirebase(String s) async {
    Reference ref = FirebaseStorage.instance.ref().child(s);
    String myUrl = await ref.getDownloadURL();
    return myUrl.toString();
  }
}
