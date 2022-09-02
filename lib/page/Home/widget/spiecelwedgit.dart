import 'package:flutter/material.dart';

import '../../../Models/menuitem_model.dart';

class SpecialWedgit extends StatelessWidget {
  final menuitem l;
  const SpecialWedgit({super.key, required this.l});

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double hightSize = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(right: widthSize * 0.05),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          margin: const EdgeInsets.only(bottom: 6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          width: widthSize * 0.93,
          height: hightSize * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(
                flex: 2,
              ),
              SizedBox(width: widthSize * 0.2, child: Image.asset(l.image)),
              const Spacer(
                flex: 1,
              ),
              Column(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  const Text(
                    'Only today 20% OFF!',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(l.name,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: widthSize * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(r'$8.50',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 20,
                                decoration: TextDecoration.lineThrough)),
                        Text(r'$7,45', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
              const Spacer(
                flex: 6,
              ),
              const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
                // size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
