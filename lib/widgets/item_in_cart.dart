// ignore: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiapp/Models/menuitem_model.dart';
import 'package:sushiapp/cart.dart';
import 'scalabelwedgit.dart';

// ignore: camel_case_types, must_be_immutable
class listtilecart extends StatefulWidget {
  List<menuitem> l;
  // final Function(bool c) onDismissed1;
  int index;
  listtilecart({super.key, required this.index, required this.l});

  @override
  State<listtilecart> createState() => _ListtilecartState();
}

class _ListtilecartState extends State<listtilecart> {
  @override
  Widget build(BuildContext context) {
    int itemnuber = Provider.of<Cart>(context).numberofitem[widget.index];
    bool clr = false;
    final v = ValueNotifier<double>(0.0);
    double heightsize = MediaQuery.of(context).size.height;
    double widthsize = MediaQuery.of(context).size.width;

    return Material(
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: SizedBox(
          height: heightsize / 6,
          width: 20,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            shadowColor: Colors.white,
            child: slidablewedgit(
              index: widget.index,
              l: widget.l[widget.index],
              child: Center(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
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
                            child: Image.asset(
                              widget.l[widget.index].image,
                              height: heightsize / 8,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(widget.l[widget.index].name,
                                style: TextStyle(
                                    fontSize:
                                        (widthsize * heightsize) * 0.00006,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              '\$${double.parse(((Provider.of<Cart>(
                                context,
                              ).priceofitem[widget.index])).toStringAsFixed(2))}',
                              style: TextStyle(
                                  fontSize: (widthsize * heightsize) * 0.00007,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   width: widthsize / 2.8,
                    // ),,
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Provider.of<Cart>(context, listen: false)
                                .reduction(widget.index);
                          },
                          child: Container(
                            width: heightsize / 25,
                            height: heightsize / 25,
                            // padding: const EdgeInsets.all(0.01),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                            ),
                            child: const Center(
                                child: Text(
                              "-",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 26,
                                height: 1,
                              ),
                            )),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            '${Provider.of<Cart>(context, listen: false).numberofitem[widget.index]}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Provider.of<Cart>(context, listen: false)
                                .increment(widget.index);
                          },
                          child: Container(
                            width: heightsize / 25,
                            height: heightsize / 25,
                            // padding: const EdgeInsets.all(0.01),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.black,
                            ),
                            child: Center(
                                child: Text(
                              "+",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                height: heightsize / 700,
                              ),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
