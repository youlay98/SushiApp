import 'package:flutter/material.dart';
import 'Models/menuitem_model.dart';

class Cart extends ChangeNotifier {
  List<menuitem> l = menuitem.piecesushi;
  deletitem(int index) {
    l.removeAt(index);
    notifyListeners();
  }
}
