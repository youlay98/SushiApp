import 'package:flutter/material.dart';
import 'package:sushiapp/Models/menuitem_model.dart';
import 'package:sushiapp/detail.dart';
import 'package:provider/provider.dart';
import 'package:sushiapp/cart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushiapp/itemsfromcategory.dart';

class ItemWidget extends StatefulWidget {
  final int index;
  final menuitem supe;
  const ItemWidget({super.key, required this.index, required this.supe});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<Itemfromcategory>(context, listen: false)
        .imagedown(widget.supe.image);
  }

  @override
  Widget build(BuildContext context) {
    double hightSize = MediaQuery.of(context).size.height;
    double widthSize = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 10)),
        ],
        borderRadius: BorderRadius.circular(30.0),
      ),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(widthSize * 0.01), // Image border
              child: SizedBox.fromSize(
                size: Size.fromRadius(
                    (widthSize * hightSize) * 0.00017), // Image radius
                child: FutureBuilder<String>(
                    future:
                        Provider.of<Itemfromcategory>(context, listen: false)
                            .img,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Hero(
                          tag: 'img-${widget.supe.image}${widget.index}',
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 2000),
                                    pageBuilder: (_, __, ___) => detail(
                                        m: widget.supe, index: widget.index)),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 9),
                              child: Image.network(snapshot.data!,
                                  fit: BoxFit.cover),
                            ),
                          ),
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    }),
              ),
            ),
            SizedBox(
              height: hightSize / 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.supe.name,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: (widthSize * hightSize) * 0.00006,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: hightSize / 100,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "\$${widget.supe.price}",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: (widthSize * hightSize) * 0.00006,
                          height: 0.2,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<Cart>(context, listen: false)
                          .add(widget.supe, context);
                      // Provider.of<Cart>(context, listen: false)
                      //     .totalnumbervariabel();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: hightSize * 0.02),
                      child: Container(
                        width: widthSize / 14,
                        height: widthSize / 14,
                        // padding: const EdgeInsets.all(0.01),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "+",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: (hightSize * widthSize) * 0.00007),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
