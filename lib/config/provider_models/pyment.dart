// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sushiapp/Auth/utils_class.dart';

class Pyment extends ChangeNotifier {
  double subtotal = 0.0;
  double totale = 0.0;
  double shippingCost = 10.0;
  bool isPromoCodeActive = false;
  String? myAddris;

  calculatestotalwithshipping(BuildContext context, double ksubtotal) {
    totale = ksubtotal + shippingCost;
  }

  Future getadressfromdatabase(String usid) async {
    try {
      return await FirebaseFirestore.instance
          .collection('address')
          .where('userId', isEqualTo: usid)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          myAddris = doc['address'];
          notifyListeners();
        }
      });
    } on FirebaseException catch (e) {
      log(e.code);
    }
  }

  Future<void> codpromoactiv(String id) async {
    FirebaseFirestore.instance
        .collection('PromoCode')
        .doc(id)
        .collection('IsActive')
        .add({
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'IsUsed': false
    });
  }

  checkIfcodePromoExist(
    String s,
    BuildContext context1,
  ) async {
    bool isP = false;
    String docId = '';

    try {
      await FirebaseFirestore.instance
          .collection('PromoCode')
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          if (s == doc['name']) {
            docId = doc.id;
            isP = true;
          }
        }
      });
      if (!isP) {
        Utils.showSnackBar('The Code promo Not activated');
      } else {
        codpromoactiv(docId);
        double x = subtotal * 0.15;
        x = subtotal - x;
        calculatestotalwithshipping(context1, x);
        notifyListeners();
        Utils.showSnackBargreen('your promo Code has been activated');
      }
      // Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseException catch (e) {
      Utils.showSnackBar(e.message);
      Navigator.pop(context1);
    }
  }
}
