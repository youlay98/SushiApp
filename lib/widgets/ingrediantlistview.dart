import 'package:flutter/material.dart';
import 'package:sushiapp/Models/ingredients.dart';

class ingredientdetail extends StatefulWidget {
  List<Ingredient> ingredient;
  ingredientdetail({Key? key, required this.ingredient}) : super(key: key);

  @override
  State<ingredientdetail> createState() => _ingredientdetailState();
}

class _ingredientdetailState extends State<ingredientdetail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 10),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.4,
        width: MediaQuery.of(context).size.width / 7,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: widget.ingredient.length,
            itemBuilder: (context, index) => ingredientmethoddetail(index)),
      ),
    );
  }

  ingredientmethoddetail(int index) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 40, left: 5, right: 5),
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
        height: 70,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20), // Image border
              child: SizedBox.fromSize(
                size: const Size.fromRadius(20), // Image radius
                child:
                    Image.asset(widget.ingredient[index].img, fit: BoxFit.cover
                        // width: 200,
                        ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.ingredient[index].nam,
              style: const TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
