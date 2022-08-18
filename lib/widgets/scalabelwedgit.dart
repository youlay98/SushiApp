import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sushiapp/Models/cartinitemModel.dart';
import 'package:sushiapp/cart.dart';

// ignore: camel_case_types
class slidablewedgit extends StatelessWidget {
  final Widget child;
  final Cartinitem l;
  // final int index;

  const slidablewedgit({
    super.key,
    required this.child,
    required this.l,
    // required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {
          Provider.of<Cart>(context, listen: false).delet(l.id);
        }),
        extentRatio: 0.2,
        children: [
          SlidableAction(
            onPressed: (context) =>
                {Provider.of<Cart>(context, listen: false).delet(l.id)},
            borderRadius: BorderRadius.circular(20.0),
            backgroundColor: const Color.fromARGB(255, 230, 180, 176),
            foregroundColor: Colors.white,
            icon: Icons.delete_forever_rounded,
          ),
        ],
      ),
      key: ObjectKey(l),
      child: child,
    );
  }
}
