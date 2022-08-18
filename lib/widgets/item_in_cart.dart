// ignore: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiapp/Models/cartinitemModel.dart';
import 'package:sushiapp/cart.dart';
import 'scalabelwedgit.dart';

// ignore: camel_case_types, must_be_immutable
class listtilecart extends StatefulWidget {
  Cartinitem l;
  // final Function(bool c) onDismissed1;

  listtilecart({super.key, required this.l});

  @override
  State<listtilecart> createState() => _ListtilecartState();
}

class _ListtilecartState extends State<listtilecart> {
  Future<String>? v;
  @override
  void initState() {
    super.initState();
    v = Provider.of<Cart>(context, listen: false)
        .downloadFromFirebase(widget.l.image);
  }

  @override
  Widget build(BuildContext context) {
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
              // index: widget.index,
              l: widget.l,
              child: Center(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FutureBuilder<String>(
                        future: v,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color:
                                      const Color.fromARGB(255, 232, 222, 222),
                                ),
                                width: widthsize / 4,
                                height: widthsize / 4,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2, bottom: 2),
                                    child: Image.network(snapshot.data!,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            );
                          }
                          return const Center(
                              child: CircularProgressIndicator());
                        }),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: widthsize / 2,
                            child: Text(widget.l.name,
                                style: TextStyle(
                                    fontSize:
                                        (widthsize * heightsize) * 0.00006,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: heightsize / 70,
                          ),
                          SizedBox(
                            width: widthsize / 2,
                            child: Text(
                              '\$${double.parse(((widget.l.pricetotal)).toStringAsFixed(2))}',
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Provider.of<Cart>(context, listen: false)
                                .reductionv(widget.l.id);
                          },
                          child: Container(
                            width: widthsize / 14,
                            height: widthsize / 14,
                            // padding: const EdgeInsets.all(0.01),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                            ),
                            child: Center(
                                child: Text(
                              "-",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: (heightsize * widthsize) * 0.00009,
                                height: 1,
                              ),
                            )),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            '${widget.l.numbertotal}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Provider.of<Cart>(context, listen: false)
                                .incrimentv(widget.l.id);
                          },
                          child: Container(
                            width: widthsize / 14,
                            height: widthsize / 14,
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
                                fontSize: (heightsize * widthsize) * 0.00007,
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
