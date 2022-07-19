import 'package:flutter/material.dart';
import 'package:sushiapp/Models/category_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushiapp/itemsfromcategory.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard>
    with TickerProviderStateMixin {
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

  late final AnimationController _controller, _cntropacity;

  late final Animation<double> _animation, animationopacity;
  @override
  void initState() {
    super.initState();
    _cntropacity = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    animationopacity = Tween(begin: 0.0, end: 1.0).animate(_cntropacity);
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _animation = Tween(begin: 200.0, end: 0.0).animate(_controller);
    _controller.forward();
    _cntropacity.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _cntropacity.dispose();
    super.dispose();
  }

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
    return AnimatedBuilder(
      animation: _animation,
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
      builder: (
        BuildContext context,
        Widget? child,
      ) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: FadeTransition(opacity: animationopacity, child: child),
        );
      },
    );
  }
}
