import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:sushiapp/config/provider_models/userprovider.dart';
import '../../Models/menuitem_model.dart';

class Cart extends ChangeNotifier {
  List<menuitem> l = [];
 
  // bool isexistincart = false;
  List<int> numberofitem = [];
  List<double> priceofitem = [];
  double totalpriceofcart = 0.0;
  bool visibl = false;
  int notificationnumber = 0;
  late Stream<QuerySnapshot<Map<String, dynamic>>> value;

  listen(BuildContext context) {
    value = fetchcart(context);
    notifyListeners();
  }

 

  

  checkItemIfExistInCart(String id, BuildContext context) async {
    bool isexistincart = false;

    await FirebaseFirestore.instance
        .collection('itemsincart')
        .where("userId",
            isEqualTo: Provider.of<UserP>(context, listen: false).userId)
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

  totalnumbervariabel() async {
    totalpriceofcart = await calculatetotalprice();
    notifyListeners();
  }

  calculatetotalprice() async {
    double c = 0.0;
    await FirebaseFirestore.instance
        .collection('itemsincart')
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        c = c + doc['totalprice'];
      }
    });
    return c;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchcart(BuildContext context) {
    return FirebaseFirestore.instance
        .collection('itemsincart')
        .where("userId",
            isEqualTo: Provider.of<UserP>(context, listen: false).userId)
        .snapshots();
  }

  Future<String> downloadFromFirebase(String s) async {
    Reference ref = FirebaseStorage.instance.ref().child(s);
    String myUrl = await ref.getDownloadURL();
    return myUrl.toString();
  }

  add(menuitem cartinitem, BuildContext context) async {
    if (await checkItemIfExistInCart(cartinitem.id, context) == false) {
      notificationnumber++;
      notifyListeners();
      await FirebaseFirestore.instance.collection('itemsincart').add({
        'name': cartinitem.name,
        'image': cartinitem.image,
        'totalnumber': 1,
        'price': cartinitem.price,
        'totalprice': cartinitem.price,
        'foodId': cartinitem.id,
        'userId': FirebaseAuth.instance.currentUser!.uid
      });
      await totalnumbervariabel();
    } else {
      const snackBar = SnackBar(
        content: Text('this item already exist in Cart'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      notifyListeners();
    }
  }

  Future<void> delet(String id) async {
    await FirebaseFirestore.instance.collection('itemsincart').doc(id).delete();
  }

  updateitemincart(String id, double totalprice, int numbtotal) async {
    final sfDocRef =
        FirebaseFirestore.instance.collection('itemsincart').doc(id);
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      // final snapshot = await transaction.get(sfDocRef);

      // final numbtotal = snapshot.get("totalnumber") + 1;
      // final totalprice = snapshot.get("price") * numbtotal;
      transaction.update(sfDocRef, {"totalnumber": numbtotal});
      transaction.update(sfDocRef, {"totalprice": totalprice});
    });
    await totalnumbervariabel();
  }

  incrimentv(String id, double totalprice, int numbtotal) {
    final sfDocRef =
        FirebaseFirestore.instance.collection('itemsincart').doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      final snapshot = await transaction.get(sfDocRef);

      final numbtotal = snapshot.get("totalnumber") + 1;
      final totalprice = snapshot.get("price") * numbtotal;
      transaction.update(sfDocRef, {"totalnumber": numbtotal});
      transaction.update(sfDocRef, {"totalprice": totalprice});
    });
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
  }

  numberandvisbility() {
    notificationnumber = 0;
    visibl = false;
    notifyListeners();
  }

  getcollectionid(String s) async {
    String? collctionId;
    await FirebaseFirestore.instance
        .collection('itemsincart')
        .where('foodId', isEqualTo: s)
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      for (var element in value.docs) {
        collctionId = element.id;
      }
    });
    return collctionId;
  }

  addItemfromDetailPage(
    menuitem cartinitem,
    BuildContext context,
    int totalnumber,
    double pricetotal,
  ) async {
    if (await checkItemIfExistInCart(cartinitem.id, context) == true) {
      String s = await getcollectionid(cartinitem.id);
      await FirebaseFirestore.instance.collection('itemsincart').doc(s).update({
        'name': cartinitem.name,
        'image': cartinitem.image,
        'totalnumber': totalnumber,
        'price': cartinitem.price,
        'totalprice': pricetotal,
        'foodId': cartinitem.id,
        'userId': FirebaseAuth.instance.currentUser!.uid
      });
    } else {
      await FirebaseFirestore.instance.collection('itemsincart').add({
        'name': cartinitem.name,
        'image': cartinitem.image,
        'totalnumber': totalnumber,
        'price': cartinitem.price,
        'totalprice': pricetotal,
        'foodId': cartinitem.id,
        'userId': FirebaseAuth.instance.currentUser!.uid
      });
      notificationnumber++;
      notifyListeners();
    }
    totalnumbervariabel();
  }

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
