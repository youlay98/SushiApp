import 'package:cloud_firestore/cloud_firestore.dart';

class Cartinitem {
  int numbertotal = 0;
  double pricetotal = 0.0;
  String name = '';
  double price = 0.0;
  String image = '';
  String id = '';
  String foodId = '';
  String userId = '';
  Cartinitem(
      {required this.name,
      required this.price,
      required this.image,
      required this.numbertotal,
      required this.pricetotal,
      required this.id,
      required this.foodId,
      required this.userId});

  factory Cartinitem.fromfirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    final id2 = snapshot.id;
    return Cartinitem(
      name: data?['name'],
      price: data?['price'],
      image: data?['image'],
      numbertotal: data?['totalnumber'],
      pricetotal: data?['totalprice'],
      id: id2,
      userId: data?['userId'],
      foodId: data?['foodId'],
    );
  }
}
