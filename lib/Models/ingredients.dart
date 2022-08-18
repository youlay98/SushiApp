import 'package:cloud_firestore/cloud_firestore.dart';

class Ingredient {
  String nam;
  String img;
  Ingredient({required this.nam, required this.img});

  factory Ingredient.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final ingredientdata = snapshot.data();
    return Ingredient(
      nam: ingredientdata?['name'],
      img: ingredientdata?['imag'],
    );
  }
  List<Ingredient> convert(Map<String, dynamic> m) {
    // print(m);
    List<Ingredient> L = [];
    // List<dynamic> me = m.entries.map((e) {

    //   return e.value;
    // }).toList();
    // L.add(Ingredient(nam: me[0], img: me[1]));
    return L;
  }
}
