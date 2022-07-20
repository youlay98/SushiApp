import 'package:flutter/material.dart';
import 'package:sushiapp/Models/category_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushiapp/itemsfromcategory.dart';
import 'package:provider/provider.dart';
import 'animationbuilder.dart';

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
    const Category(name: 'All3', id: 4),
    const Category(name: 'All3', id: 4),
    const Category(name: 'All3', id: 4),
    const Category(name: 'All3', id: 4),
    const Category(name: 'All3', id: 4),
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 31.5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) => buildCategories(index),
      ),
    );
  }

  buildCategories(index) {
    return Animationbuilder(
      child: GestureDetector(
        child: SizedBox(
          // color: Colors.black,
          height: 50,
          width: MediaQuery.of(context).size.width * 0.3,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                category[index].name,
                style: GoogleFonts.roboto(
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
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 40,
                      height: 0.2,
                      color: selectedIndex == index
                          ? Colors.black.withOpacity(1)
                          : Colors.black.withOpacity(0)),
                ),
              )
            ],
          ),
        ),
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
          Provider.of<Itemfromcategory>(context, listen: false)
              .changecategory(selectedIndex);
        },
      ),
    );
  }
}
