import 'package:flutter/material.dart';
import 'widgets/animationbuilder.dart';
import 'widgets/cartItem.dart';

class cartscreen extends StatelessWidget {
  const cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double hightSize = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(hightSize / 10),
          child: AppBar(
            elevation: 0,
            // backgroundColor: Colors.white,
            actions: [
              Animationbuilder(
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
              ),
              Animationbuilder(
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }
                    // showSearch(context: context, delegate: Mysearch)
                    ,
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    )),
              )
            ],
            leading: Animationbuilder(
              child: Padding(
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
              height: 200,
            )
          ],
        ));
  }
}
