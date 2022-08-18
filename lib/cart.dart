import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sushiapp/Models/cartinitemModel.dart';
import 'Models/menuitem_model.dart';

class Cart extends ChangeNotifier {
  List<menuitem> l = [];
  // bool isexistincart = false;
  List<int> numberofitem = [];
  List<double> priceofitem = [];
  double totalpriceofcart = 0.0;
  bool visibl = false;
  int notificationnumber = 0;
  late Stream<QuerySnapshot<Map<String, dynamic>>> value;

  listen() {
    value = fetchcart();
    notifyListeners();
  }

  checkItemIfExistInCart(String id) async {
    bool isexistincart = false;
    await FirebaseFirestore.instance
        .collection('itemsincart')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if (doc["foodId"] == id) {
          isexistincart = true;
          break;
        }
      }
    });
    return isexistincart;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchcart() {
    return FirebaseFirestore.instance.collection('itemsincart').snapshots();
  }

  Future<String> downloadFromFirebase(String s) async {
    Reference ref = FirebaseStorage.instance.ref().child(s);
    String myUrl = await ref.getDownloadURL();
    return myUrl.toString();
  }

  add(menuitem cartinitem, BuildContext context) async {
    if (await checkItemIfExistInCart(cartinitem.id) == false) {
      notificationnumber++;
      notifyListeners();
      await FirebaseFirestore.instance.collection('itemsincart').add({
        'name': cartinitem.name,
        'image': cartinitem.image,
        'totalnumber': 1,
        'price': cartinitem.price,
        'totalprice': cartinitem.price,
        'foodId': cartinitem.id
      }).catchError((error) => print("Failed to add user: $error"));
    } else {
      const snackBar = SnackBar(
        content: Text('this item already exist in Cart'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      notifyListeners();
    }
  }

  Future<void> delet(String id) async {
    return FirebaseFirestore.instance
        .collection('itemsincart')
        .doc(id)
        .delete();
  }

  incrimentv(String id) {
    final sfDocRef =
        FirebaseFirestore.instance.collection('itemsincart').doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      final snapshot = await transaction.get(sfDocRef);

      final numbtotal = snapshot.get("totalnumber") + 1;
      final totalprice = snapshot.get("price") * numbtotal;
      transaction.update(sfDocRef, {"totalnumber": numbtotal});
      transaction.update(sfDocRef, {"totalprice": totalprice});
    });
    // .update({"totalnumber": FieldValue.increment(-1)});
  }

  reductionv(String id) {
    final sfDocRef =
        FirebaseFirestore.instance.collection('itemsincart').doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      final snapshot = await transaction.get(sfDocRef);
      if (snapshot.get("totalnumber") > 1) {
        final numbtotal = snapshot.get("totalnumber") - 1;
        final totalprice = snapshot.get("price") * numbtotal;
        transaction.update(sfDocRef, {"totalnumber": numbtotal});
        transaction.update(sfDocRef, {"totalprice": totalprice});
      }
    });
    // .update({"totalnumber": FieldValue.increment(-1)});
  }

  deletitem(int index) {
    l.removeAt(index);
    numberofitem.removeAt(index);
    priceofitem.removeAt(index);
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

  numberandvisbility() {
    notificationnumber = 0;
    visibl = false;
    notifyListeners();
  }

  additem(menuitem m, int itemnumber, BuildContext context) {
    for (int i = 0; i < l.length; i++) {
      if (l[i].price == m.price && l[i].name == m.name) {
        return 0;
      }
    }
    l.add(m);
    numberofitem.add(itemnumber);
    priceofitem.add(m.price * itemnumber);
    pricetotlaofcartf();
    notificationnumber++;
    visibl = true;
    final snackBar = SnackBar(
      content: Text('${m.price} added to cart'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    notifyListeners();
  }

  addItemfromDetailPage(menuitem m, int itemnumber, BuildContext context) {
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
    additem(m, itemnumber, context);
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
