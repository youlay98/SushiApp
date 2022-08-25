import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiapp/cart.dart';
import 'package:sushiapp/itemsfromcategory.dart';
import 'package:sushiapp/widgets/notificationwedgit.dart';
import 'Models/menuitem_model.dart';
import 'widgets/ingrediantlistview.dart';
import 'widgets/animationbuilder.dart';

// ignore: camel_case_types
class detail extends StatefulWidget {
  final menuitem m;
  final int index;
  const detail({Key? key, required this.m, required this.index})
      : super(key: key);

  @override
  State<detail> createState() => _detailState();
}

// ignore: camel_case_types
class _detailState extends State<detail> {
  int numberitem = 1;
  bool clr = false;
  double v = 0.0;
  Future? value;
  @override
  initState() {
    value = FirebaseFirestore.instance
        .collection('food')
        .doc(widget.m.id)
        .collection('cotegory')
        .get();
    v = widget.m.price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double hightSize = MediaQuery.of(context).size.height;
    double widthSize = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(hightSize / 10),
        child: Padding(
          padding: EdgeInsets.only(top: hightSize / 50),
          child: AppBar(
            elevation: 0,
            title: const Center(
                child: Text(
              'Detail',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 26),
            )),
            actions: [
              Animationbuilder(child: const Notiffication()),
            ],
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: (widthSize * hightSize) * 0.0001,
                )),
            backgroundColor: Colors.white,
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Animationbuilder(
              child: Padding(
                padding: EdgeInsets.only(left: widthSize / 20),
                child: Text(
                  widget.m.name,
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            ),
            Row(
              children: [
                Animationbuilder(child: ingredientdetail(id: widget.m.id)),
                SizedBox(width: widthSize / 3.5),
                Expanded(
                  child: Hero(
                    tag: 'img-${widget.m.image}${widget.m.name}',
                    child: FutureBuilder<String>(
                        future: Provider.of<Itemfromcategory>(context).img,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Image.network(
                              snapshot.data!,
                              height: (widthSize * hightSize) * 0.001,
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                  ),
                )
              ],
            ),
            Animationbuilder(
              child: Padding(
                  padding: EdgeInsets.only(left: widthSize / 6, top: 2),
                  child: Image.asset('Assets/Icons/arrow.png',
                      height: hightSize / 30)),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: widthSize / 12, top: 5),
                  child: SizedBox(
                    // color: Colors.amber,
                    width: widthSize / 2,
                    child: Animationbuilder(
                      child: Text(
                        '\$$v',
                        style: TextStyle(
                            fontSize: (widthSize * hightSize) * 0.0001,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all((widthSize * hightSize) * 0.00001),
                  child: Animationbuilder(
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              // spreadRadius: 2,
                              blurRadius: 4,
                              // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0)),
                      height: hightSize / 14,
                      width: widthSize / 3,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 26,
                          ),
                          GestureDetector(
                            child: Animationbuilder(
                              child: Text(
                                '-',
                                style: TextStyle(
                                    fontSize: (widthSize * hightSize) * 0.0001,
                                    color: clr ? Colors.black : Colors.grey),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                if (numberitem > 1) {
                                  numberitem = numberitem - 1;
                                  v = double.parse(
                                      ((widget.m.price * numberitem))
                                          .toStringAsFixed(2));
                                  if (numberitem == 1) {
                                    clr = false;
                                  }
                                }
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                              width: 40,
                              child: Center(
                                child: Animationbuilder(
                                  child: Text('$numberitem',
                                      style: const TextStyle(fontSize: 20)),
                                ),
                              )),
                          GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.all(
                                  (widthSize * hightSize) * 0.00003),
                              child: Animationbuilder(
                                child: Text('+',
                                    style: TextStyle(
                                        fontSize:
                                            (widthSize * hightSize) * 0.0001)),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                numberitem = numberitem + 1;
                                v = double.parse(((widget.m.price * numberitem))
                                    .toStringAsFixed(2));
                                clr = true;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: widthSize / 12, bottom: hightSize / 70),
              child: Animationbuilder(
                child: Text(
                  'Description',
                  style: TextStyle(
                      fontSize: (widthSize * hightSize) * 0.00007,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical, //.horizontal
                child: Padding(
                  padding: EdgeInsets.only(left: widthSize / 12),
                  child: SizedBox(
                      child: Animationbuilder(
                    child: const Text(
                      'Flutter is Google’s mobile UI open source hghdsghkdksjhfgjhdfghdfjjghdsfjh dfhkjghsjdgh gjadhlkjgh   jhdfglhdfiuh  jdfhgkjhdsfkgj hdsfkjkhgjdksfhg kjhdfkgjh dfg framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: widthSize / 7,
                  top: hightSize / 100,
                  bottom: hightSize / 25),
              child: Animationbuilder(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.grey,
                    backgroundColor: Colors.black,
                    elevation: 20,
                    padding: EdgeInsets.only(
                        right: widthSize * 0.3,
                        left: widthSize * 0.3,
                        top: hightSize * 0.02,
                        bottom: hightSize * 0.02),
                  ),
                  onPressed: () {
                    Provider.of<Cart>(context, listen: false)
                        .addItemfromDetailPage(
                            widget.m, context, numberitem, v);
                    Provider.of<Cart>(context, listen: false)
                        .totalnumbervariabel();
                  },
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
