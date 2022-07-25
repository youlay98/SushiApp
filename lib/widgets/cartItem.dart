// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiapp/Models/menuitem_model.dart';
import 'package:sushiapp/cart.dart';
// import 'package:sushiapp/cart.dart';
import 'listtilforcart.dart';
import 'animationbuilder.dart';

// ignore: camel_case_types
class cartItem extends StatefulWidget {
  const cartItem({super.key});

  @override
  State<cartItem> createState() => _cartItemState();
}

// ignore: camel_case_types
class _cartItemState extends State<cartItem> {
  @override
  Widget build(BuildContext context) {
    List<menuitem> l = Provider.of<Cart>(context).l;
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
              itemCount: l.length,
              itemBuilder: ((context, index) =>
                  Animationbuilder(child: listtilecart(index: index, l: l))),
            ),
          ),
        ],
      ),
    );
  }

  // dismissiableitem(BuildContext context, index, bool c) {
  //   setState(() {
  //     l.removeAt(index);
  //   });
  // }
}
