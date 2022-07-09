import 'package:flutter/cupertino.dart';
import 'Models/menuitem_model.dart';

class Itemfromcategory extends ChangeNotifier {
  List<menuitem> l = (menuitem.piecesushi + menuitem.supe)..shuffle();

  changecategory(int i) {
    switch (i) {
      case 0:
        {
          l = (menuitem.piecesushi + menuitem.supe)..shuffle();
          notifyListeners();
        }
        break;
      case 1:
        {
          l = menuitem.supe;
          notifyListeners();
        }
        break;
      case 2:
        {
          l = menuitem.kimich;
          notifyListeners();
        }
        break;
      case 3:
        {
          l = menuitem.piecesushi;
          notifyListeners();
        }
        break;
      case 4:
        {
          l = menuitem.supe;
          notifyListeners();
        }
        break;
      case 5:
        {
          l = menuitem.supe;
          notifyListeners();
        }
        break;
      case 6:
        {
          l = menuitem.supe;
          notifyListeners();
        }
        break;
      case 7:
        {
          l = menuitem.supe;
          notifyListeners();
        }
        break;
      default:
    }
  }
}
