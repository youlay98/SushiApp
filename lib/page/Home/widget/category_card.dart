import 'package:flutter/material.dart';
import 'package:sushiapp/Models/category_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushiapp/config/provider_models/itemsfromcategory.dart';
import 'package:provider/provider.dart';
import '../../../Animation/animationbuilder.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isSelected = false;

  List<Category> category = [
    const Category(name: 'All', id: 1),
    const Category(name: 'sushi', id: 2),
    const Category(name: 'Rameon', id: 3),
    const Category(name: 'Kimchi', id: 4),
    const Category(name: 'karoania', id: 5),
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: FractionallySizedBox(
        heightFactor: 0.5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          itemBuilder: (context, index) => buildCategories(index),
        ),
      ),
    );
  }

  buildCategories(index) {
    return Animationbuilder(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
          Provider.of<Itemfromcategory>(context, listen: false)
              .listen(category[index].name);
          // Provider.of<Itemfromcategory>(context, listen: false).value =
          //     Provider.of<Itemfromcategory>(context, listen: false)
          //         .list(category[index].name);
        },
        child: SizedBox(
          // color: Colors.black,
          width: MediaQuery.of(context).size.width * 0.25,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                category[index].name,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: selectedIndex == index
                          ? null
                          : Colors.grey.withOpacity(0.5)),
                ),
              )),
              Text(
                '.',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      height: 0.32,
                      color: selectedIndex == index
                          ? Colors.black.withOpacity(1)
                          : Colors.black.withOpacity(0)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
