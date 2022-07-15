import 'package:flutter/material.dart';
import 'Models/menuitem_model.dart';
import 'widgets/ingrediantlistview.dart';

// ignore: camel_case_types
class detail extends StatefulWidget {
  final menuitem m;
  const detail({Key? key, required this.m}) : super(key: key);

  @override
  State<detail> createState() => _detailState();
}

// ignore: camel_case_types
class _detailState extends State<detail> {
  int valure = 1;
  bool clr = false;
  double v = 0.0;
  @override
  initState() {
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
        child: AppBar(
          elevation: 0,
          // backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                }
                // showSearch(context: context, delegate: Mysearch)
                ,
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                }
                // showSearch(context: context, delegate: Mysearch)
                ,
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ))
          ],
          leading: Padding(
              padding: EdgeInsets.only(
                  left: widthSize / 30,
                  top: hightSize / 100,
                  bottom: hightSize / 100),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              )),
          backgroundColor: Colors.white,
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'data',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Row(
              children: [
                ingredientdetail(ingredient: widget.m.l),
                SizedBox(width: MediaQuery.of(context).size.width / 3.5),
                Expanded(
                  child: Image.asset(
                    widget.m.image,
                    height: 200,
                  ),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(left: 60.0, top: 2),
                child: Image.asset('Assets/Icons/arrow.png', height: 20)),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 5),
                  child: SizedBox(
                    // color: Colors.amber,
                    width: 200,
                    child: Text(
                      '\$$v',
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                    height: 49,
                    width: 140,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 26,
                        ),
                        GestureDetector(
                          child: Text(
                            '-',
                            style: TextStyle(
                                fontSize: 30,
                                color: clr ? Colors.black : Colors.grey),
                          ),
                          onTap: () {
                            setState(() {
                              if (valure > 1) {
                                valure = valure - 1;
                                v = double.parse(((widget.m.price * valure))
                                    .toStringAsFixed(2));
                                if (valure == 1) {
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
                              child: Text('$valure',
                                  style: const TextStyle(fontSize: 20)),
                            )),
                        GestureDetector(
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Expanded(
                                child:
                                    Text('+', style: TextStyle(fontSize: 30))),
                          ),
                          onTap: () {
                            setState(() {
                              valure = valure + 1;
                              v = double.parse(((widget.m.price * valure))
                                  .toStringAsFixed(2));
                              clr = true;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Description',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Stack(
  
                children:const [
                   Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                        'This sample shows how to display a Divider between an orange and blue box inside a column. The Divider is 20 logical pixels in height and contains a vertically centered black line that is 5 logical pixels thick. The black line is indented by 20 logical pixels.'),
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
