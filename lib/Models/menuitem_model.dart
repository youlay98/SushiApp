import 'package:equatable/equatable.dart';

// ignore: camel_case_types
class menuitem extends Equatable {
  final String name;
  final int id;
  final String description;
  final double price;
  final String image;
  const menuitem(
      {required this.name,
      required this.id,
      required this.description,
      required this.price,
      required this.image});

  @override
  List<Object> get props => [name, id];

  static List<menuitem> piecesushi = [
    const menuitem(
        name: 'Kamikazi Salmon',
        id: 1,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/piecesushi.png'),
    const menuitem(
        name: 'Kamikazi Salmon',
        id: 1,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/piecesushi.png'),
    const menuitem(
        name: 'Kamikazi Salmon',
        id: 1,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/piecesushi.png'),
    const menuitem(
        name: 'Kamikazi Salmon',
        id: 1,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/piecesushi.png'),
    const menuitem(
        name: 'Kamikazi Salmon',
        id: 1,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/piecesushi.png'),
    const menuitem(
        name: 'Kamikazi Salmon',
        id: 1,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/piecesushi.png'),
    const menuitem(
        name: 'Kamikazi Salmon',
        id: 1,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/piecesushi.png'),
  ];

  static List<menuitem> supe = [
    const menuitem(
        name: 'supe',
        id: 2,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/supe.JPG'),
    const menuitem(
        name: 'supe',
        id: 2,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/supe.JPG'),
    const menuitem(
        name: 'supe',
        id: 2,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/supe.JPG'),
    const menuitem(
        name: 'supe',
        id: 2,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/supe.JPG'),
    const menuitem(
        name: 'supe',
        id: 2,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/supe.JPG'),
    const menuitem(
        name: 'supe',
        id: 2,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/supe.JPG'),
  ];

  static List<menuitem> kimich = [
    const menuitem(
        name: 'kimich',
        id: 3,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/kimchi.jpg'),
    const menuitem(
        name: 'kimich',
        id: 3,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/kimchi.jpg'),
    const menuitem(
        name: 'kimich',
        id: 3,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/kimchi.jpg'),
    const menuitem(
        name: 'kimich',
        id: 3,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/kimchi.jpg'),
    const menuitem(
        name: 'kimich',
        id: 3,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/kimchi.jpg'),
    const menuitem(
        name: 'kimich',
        id: 3,
        description: 'jkdfiejlkjsdfj',
        price: 1.55,
        image: 'Assets/kimchi.jpg'),
  ];
}
