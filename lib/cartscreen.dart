import 'package:flutter/material.dart';
import 'widgets/animationbuilder.dart';
import 'widgets/cartItem.dart';
import 'widgets/button.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<Cart>(context, listen: false).totalnumbervariabel();
    final double widthSize = MediaQuery.of(context).size.width;
    final double hightSize = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(hightSize / 10),
          child: AppBar(
            elevation: 0,
            title: const Center(
                child: Text(
              'Cart',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            )),
            // backgroundColor: Colors.white,
            // actions: [
            // Animationbuilder(
            //   child: IconButton(
            //       onPressed: () {
            //         Navigator.pop(context);
            //       },
            //       icon: const Icon(
            //         Icons.search,
            //         color: Colors.black,
            //       )),
            // ),
            // Animationbuilder(
            //   child: IconButton(
            //       onPressed: () {
            //         Navigator.pop(context);
            //       }
            //       // showSearch(context: context, delegate: Mysearch)
            //       ,
            //       icon: const Icon(
            //         Icons.menu,
            //         color: Colors.black,
            //       )),
            // )
            // ],
            leading: Animationbuilder(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            ),
            backgroundColor: Colors.white,
          ),
        ),
        body: Column(
          children: [
            const Expanded(
              child: SizedBox(child: cartItem()),
            ),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: widthSize / 15),
                    child: const Text('     Total',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: widthSize / 15),
                    child: Text(
                        '\$${double.parse(((Provider.of<Cart>(context).totalpriceofcart)).toStringAsFixed(2))}     ',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: hightSize / 40, top: 25),
              child: const ButtonWidget(text: 'Payment'),
            )
          ],
        ));
  }
}
