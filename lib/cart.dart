import 'package:flutter/material.dart';

import 'Models/menuitem_model.dart';

class Cart extends ChangeNotifier {
  List<menuitem> l = [];
  List<int> numberofitem = [];
  List<double> priceofitem = [];
  double totalpriceofcart = 0.0;

  deletitem(int index) {
    l.removeAt(index);
    numberofitem.removeAt(index);
    pricetotlaofcartf();
    notifyListeners();
  }

  increment(int index) {
    numberofitem[index]++;
    priceofitem[index] = l[index].price * numberofitem[index];
    pricetotlaofcartf();
    notifyListeners();
  }

  reduction(int index) {
    if (numberofitem[index] != 1) {
      numberofitem[index]--;
      priceofitem[index] = l[index].price * numberofitem[index];
      pricetotlaofcartf();
      notifyListeners();
    }
    return 0;
  }

  additem(menuitem m, int itemnumber) {
    for (int i = 0; i < l.length; i++) {
      if (identical(l[i], m)) return 0;
    }
    l.add(m);
    numberofitem.add(itemnumber);
    priceofitem.add(m.price * itemnumber);
    pricetotlaofcartf();
    notifyListeners();
  }

  addItemfromDetailPage(menuitem m, int itemnumber) {
    for (int i = 0; i < l.length; i++) {
      if (identical(l[i], m)) {
        numberofitem[i] = itemnumber;
        priceofitem[i] = l[i].price * numberofitem[i];
        pricetotlaofcartf();
        notifyListeners();
        return 0;
        // 22.65
      }
    }
    additem(m, itemnumber);
    notifyListeners();
  }
  // 9.3

  priceofitemfunc(int index) {
    priceofitem[index] = l[index].price * numberofitem[index];
  }

  pricetotlaofcartf() {
    totalpriceofcart = 0.0;
    for (int i = 0; i < l.length; i++) {
      totalpriceofcart = totalpriceofcart + priceofitem[i];
    }
  }
}
