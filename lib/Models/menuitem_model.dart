import 'package:equatable/equatable.dart';
// import 'package:sushiapp/Models/category_model.dart';
import 'ingredients.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types, must_be_immutable
class menuitem extends Equatable {
  final String name;
  String? category;
  final String id;
  final String description;
  final double price;
  final String image;
  // List<Ingredient> l;
  menuitem({
    required this.name,
    this.category,
    required this.id,
    required this.description,
    required this.price,
    required this.image,
  });

  Stream collectionStream =
      FirebaseFirestore.instance.collection('foods').snapshots();
  Stream documentStream =
      FirebaseFirestore.instance.collection('foods').doc().snapshots();

  Stream<List<menuitem>> readdata() => collectionStream
      .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

  final docRef = FirebaseFirestore.instance.collection("cities").doc("SF");
//    // ignore: empty_constructor_bodies
//    FirebaseFirestore.instancethis.name, this.id, this.description, this.price, this.image.collection("cities").doc("SF").get().then(
//   (DocumentSnapshot doc) {
//     final data = doc.data() as Map<String, dynamic>;
//     // ...
//   },
//   onError: (e) => print("Error getting document: $e"),
// ) {
//   throw UnimplementedError();
// }

  factory menuitem.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    final id2 = snapshot.id;
    return menuitem(
        category: data?['Category'],
        name: data?['name'],
        id: id2,
        description: data?['description'],
        price: data?['price'],
        image: data?['image']);
  }

  @override
  List<Object> get props => [name, id];

  static List<menuitem> piecesushi = [
    menuitem(
      name: 'Kamikazi Salmon',
      id: '',
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/piecesushi.png',
      // l: [
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      // ],
    ),
    menuitem(
      name: 'Kamikazi Salmon',
      id: '1',
      description: 'jkdfiejlkjsdfj',
      price: 2.55,
      image: 'Assets/piecesushi.png',
      // l: [
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      // ],
    ),
    menuitem(
      name: 'Kamikazi Salmon',
      id: '1',
      description: 'jkdfiejlkjsdfj',
      price: 3.55,
      image: 'Assets/piecesushi.png',
      // l: [
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      // ],
    ),
    menuitem(
      name: 'Kamikazi Salmon',
      id: '1',
      description: 'jkdfiejlkjsdfj',
      price: 4.55,
      image: 'Assets/piecesushi.png',
      // l: [
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      // ],
    ),
    menuitem(
      name: 'Kamikazi Salmon',
      id: '1',
      description: 'jkdfiejlkjsdfj',
      price: 5.55,
      image: 'Assets/piecesushi.png',
      // l: [
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      // ],
    ),
    menuitem(
      name: 'Kamikazi Salmon',
      id: '1',
      description: 'jkdfiejlkjsdfj',
      price: 6.55,
      image: 'Assets/piecesushi.png',
      // l: [
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      // ],
    ),
    menuitem(
      name: 'Kamikazi Salmon',
      id: '1',
      description: 'jkdfiejlkjsdfj',
      price: 7.55,
      image: 'Assets/piecesushi.png',
      // l: [
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      // ],
    ),
  ];

  static List<menuitem> supe = [
    menuitem(
      name: 'supe',
      id: '1',
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/supe.JPG',
      // l: [
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      // ],
    ),
    menuitem(
      name: 'supe',
      id: '1',
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/supe.JPG',
      // l: [
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      // ],
    ),
    menuitem(
      name: 'supe',
      id: '1',
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/supe.JPG',
      // l: [
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      // ],
    ),
    menuitem(
      name: 'supe',
      id: '1',
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/supe.JPG',
      // l: [
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      // ],
    ),
    menuitem(
      name: 'supe',
      id: '1',
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/supe.JPG',
      // l: [
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      // ],
    ),
    menuitem(
      name: 'supe',
      id: '1',
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/supe.JPG',
      // l: [
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      // ],
    ),
  ];

  static List<menuitem> kimich = [
    menuitem(
      name: 'kimich',
      id: '1',
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/kimchi.jpg',
      // l: [
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      // ],
    ),
    menuitem(
      name: 'kimich',
      id: '1',
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/kimchi.jpg',
      // l: [
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      // ],
    ),
    menuitem(
      name: 'kimich',
      id: '1',
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/kimchi.jpg',
      // l: [
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      // ],
    ),
    menuitem(
      name: 'kimich',
      id: '1',
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/kimchi.jpg',
      // l: [
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      // ],
    ),
    menuitem(
      name: 'kimich',
      id: '1',
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/kimchi.jpg',
      // l: [
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      // ],
    ),
    menuitem(
      name: 'kimich',
      id: '1',
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/kimchi.jpg',
      // l: [
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //   Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      // ],
    ),
  ];

  static fromJson(Map<String, dynamic> data) {}
}
