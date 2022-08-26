// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import 'package:sushiapp/cart.dart';
import '../../../Models/cartinitemmodel.dart';
import '../../Home/widget/item_in_cart.dart';
import '../../../Animation/animationbuilder.dart';

// ignore: camel_case_types
class cartItem extends StatefulWidget {
  const cartItem({super.key});

  @override
  State<cartItem> createState() => _CartItemState();
}

class _CartItemState extends State<cartItem> {
  late Stream<QuerySnapshot<Map<String, dynamic>>> value;
  @override
  void initState() {
    value = FirebaseFirestore.instance
        .collection('itemsincart')
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    super.initState();
    // Provider.of<Cart>(context, listen: false).fetchcart();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // List<menuitem> l = Provider.of<Cart>(context).l;

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: value,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.05,
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: ((context, index) {
                        Cartinitem cartinitem = Cartinitem.fromfirestore(
                            snapshot.data!.docs[index]);
                        return Animationbuilder(
                            child: listtilecart(
                          l: cartinitem,
                          key: UniqueKey(),
                        ));
                      }),
                    ),
                  ),
                ],
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  // dismissiableitem(BuildContext context, index, bool c) {
  //   setState(() {
  //     l.removeAt(index);
  //   });
  // }
}
