import 'package:flutter/material.dart';
import 'package:sushiapp/Models/ingredients.dart';
import 'animationbuilder.dart';

// ignore: must_be_immutable, camel_case_types
class ingredientdetail extends StatefulWidget {
  List<Ingredient> ingredient;
  ingredientdetail({Key? key, required this.ingredient}) : super(key: key);

  @override
  State<ingredientdetail> createState() => _ingredientdetailState();
}

// ignore: camel_case_types
class _ingredientdetailState extends State<ingredientdetail> {
  @override
  Widget build(BuildContext context) {
    double hightSize = MediaQuery.of(context).size.height;
    double widthSize = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: widthSize / 10, top: hightSize / 35),
      child: SizedBox(
        height: hightSize / 2.4,
        width: widthSize / 5,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: widget.ingredient.length,
            itemBuilder: (context, index) =>
                ingredientmethoddetail(index, hightSize, widthSize)),
      ),
    );
  }

  ingredientmethoddetail(int index, double hightSize, double widthSize) {
    return Padding(
      padding: EdgeInsets.only(top: hightSize / 35, left: 5, right: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              // spreadRadius: 2,
              blurRadius: 4,
              // changes position of shadow
            ),
          ],
        ),
        height: hightSize / 10,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40), // Image border
              child: SizedBox.fromSize(
                size: Size.fromRadius(
                    (widthSize * hightSize) * 0.00007), // Image radius
                child: Animationbuilder(
                  child: Image.asset(widget.ingredient[index].img,
                      fit: BoxFit.cover
                      // width: 200,
                      ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Animationbuilder(
              child: Text(
                widget.ingredient[index].nam,
                style: TextStyle(
                    fontSize: (widthSize * hightSize) * 0.00004,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
