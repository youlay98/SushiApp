import 'package:flutter/material.dart';
import 'package:sushiapp/config/provider_models/cart.dart';
import 'package:sushiapp/page/Cart/cartscreen.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

class Notiffication extends StatefulWidget {
  const Notiffication({super.key});

  @override
  State<Notiffication> createState() => _NotifficationState();
}

class _NotifficationState extends State<Notiffication> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Provider.of<Cart>(context, listen: false).numberandvisbility();

          Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 2000),
                pageBuilder: (_, __, ___) => const CartScreen()),
          );
        }
        // showSearch(context: context, delegate: Mysearch)
        ,
        icon: Badge(
            showBadge: Provider.of<Cart>(
                          context,
                        ).notificationnumber >
                        0 ||
                    Provider.of<Cart>(context, listen: false).visibl
                ? true
                : false,
            badgeContent: Text(
              '${Provider.of<Cart>(
                context,
              ).notificationnumber}',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            child: const Icon(Icons.shopping_cart,
                color: Colors.black, size: 30)));
  }
}
