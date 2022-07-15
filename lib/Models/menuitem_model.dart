import 'package:equatable/equatable.dart';
import 'ingredients.dart';

// ignore: camel_case_types, must_be_immutable
class menuitem extends Equatable {
  final String name;
  final int id;
  final String description;
  final double price;
  final String image;
  List<Ingredient> l;
  menuitem(
      {required this.name,
      required this.id,
      required this.description,
      required this.price,
      required this.image,
      required this.l});

  @override
  List<Object> get props => [name, id];

  static List<menuitem> piecesushi = [
    menuitem(
      name: 'Kamikazi Salmon',
      id: 1,
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/piecesushi.png',
      l: [
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      ],
    ),
    menuitem(
      name: 'Kamikazi Salmon',
      id: 1,
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/piecesushi.png',
      l: [
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      ],
    ),
    menuitem(
      name: 'Kamikazi Salmon',
      id: 1,
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/piecesushi.png',
      l: [
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      ],
    ),
    menuitem(
      name: 'Kamikazi Salmon',
      id: 1,
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/piecesushi.png',
      l: [
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      ],
    ),
    menuitem(
      name: 'Kamikazi Salmon',
      id: 1,
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/piecesushi.png',
      l: [
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      ],
    ),
    menuitem(
      name: 'Kamikazi Salmon',
      id: 1,
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/piecesushi.png',
      l: [
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      ],
    ),
    menuitem(
      name: 'Kamikazi Salmon',
      id: 1,
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/piecesushi.png',
      l: [
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      ],
    ),
  ];

  static List<menuitem> supe = [
    menuitem(
      name: 'supe',
      id: 2,
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/supe.JPG',
      l: [
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      ],
    ),
    menuitem(
      name: 'supe',
      id: 2,
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/supe.JPG',
      l: [
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      ],
    ),
    menuitem(
      name: 'supe',
      id: 2,
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/supe.JPG',
      l: [
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      ],
    ),
    menuitem(
      name: 'supe',
      id: 2,
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/supe.JPG',
      l: [
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      ],
    ),
    menuitem(
      name: 'supe',
      id: 2,
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/supe.JPG',
      l: [
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      ],
    ),
    menuitem(
      name: 'supe',
      id: 2,
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/supe.JPG',
      l: [
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      ],
    ),
  ];

  static List<menuitem> kimich = [
    menuitem(
      name: 'kimich',
      id: 3,
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/kimchi.jpg',
      l: [
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      ],
    ),
    menuitem(
      name: 'kimich',
      id: 3,
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/kimchi.jpg',
      l: [
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      ],
    ),
    menuitem(
      name: 'kimich',
      id: 3,
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/kimchi.jpg',
      l: [
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      ],
    ),
    menuitem(
      name: 'kimich',
      id: 3,
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/kimchi.jpg',
      l: [
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      ],
    ),
    menuitem(
      name: 'kimich',
      id: 3,
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/kimchi.jpg',
      l: [
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      ],
    ),
    menuitem(
      name: 'kimich',
      id: 3,
      description: 'jkdfiejlkjsdfj',
      price: 1.55,
      image: 'Assets/kimchi.jpg',
      l: [
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
        Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      ],
    ),
  ];
}
