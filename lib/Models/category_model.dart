import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final int id;
  const Category({required this.name, required this.id});

  @override
  List<Object> get props => [name, id];

  static List<Category> category = [
    const Category(name: 'All', id: 1),
    const Category(name: 'All', id: 2),
    const Category(name: 'All', id: 3),
    const Category(name: 'All', id: 4)
  ];
}
