// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiapp/cart.dart';
// import 'package:sushiapp/cart.dart';
import '../Models/cartinitemModel.dart';
import 'item_in_cart.dart';
import 'animationbuilder.dart';

// ignore: camel_case_types
class cartItem extends StatefulWidget {
  const cartItem({super.key});

  @override
  State<cartItem> createState() => _cartItemState();
}

class _cartItemState extends State<cartItem> {
  @override
  void initState() {
    super.initState();
    Provider.of<Cart>(context, listen: false).listen();
  }

  @override
  Widget build(BuildContext context) {
    // List<menuitem> l = Provider.of<Cart>(context).l;
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream:
            FirebaseFirestore.instance.collection('itemsincart').snapshots(),
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
                        // print('cart:  ${cartinitem.name}');
                        // return Container(
                        //   color: Colors.amber,
                        // );
                        return Animationbuilder(
                            child: listtilecart(l: cartinitem));
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
