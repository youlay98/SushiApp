import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sushiapp/Models/menuitem_model.dart';
import 'package:sushiapp/cart.dart';

// ignore: camel_case_types
class slidablewedgit extends StatelessWidget {
  final Widget child;
  final menuitem l;
  final int index;

  const slidablewedgit({
    super.key,
    required this.child,
    required this.l,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {
          Provider.of<Cart>(context, listen: false).deletitem(index);
        }),
        extentRatio: 0.2,
        children: [
          SlidableAction(
            onPressed: (context) =>
                {Provider.of<Cart>(context, listen: false).deletitem(index)},
            borderRadius: BorderRadius.circular(20.0),
            backgroundColor: const Color.fromARGB(255, 230, 180, 176),
            foregroundColor: Colors.white,
            icon: Icons.delete_forever_rounded,
            // child: Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   width: 60,
            //   height: 60,
            //   child: const Icon(
            //     Icons.delete_forever,
            //     size: 50,
            //   ),
            // ),
          ),
        ],
      ),
      key: ObjectKey(l),
      child: child,
    );
  }
}
