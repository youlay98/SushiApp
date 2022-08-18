import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'Models/menuitem_model.dart';
import 'package:flutter/material.dart';

class Itemfromcategory extends ChangeNotifier {
  final menuitemStreamController = StreamController<List<menuitem>>();
  Stream<QuerySnapshot<Map<String, dynamic>>>? value;
  late Stream<List<menuitem>> mystream;
  Future<String>? img;

  // late Stream<List<menuitem>> value = list('test4');
  int i = 0;
  List<menuitem> l = [];

  listen(String s) {
    value = list(s);
    notifyListeners();
  }

  imagedown(String s) {
    img = downloadFromFirebase(s);
  }

  Future<String> downloadFromFirebase(String s) async {
    Reference ref = FirebaseStorage.instance.ref().child(s);
    String myUrl = await ref.getDownloadURL();
    return myUrl.toString();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> list(String s) {
    if (s == 'All') {
      return FirebaseFirestore.instance.collection('foods').snapshots();
    }

    return FirebaseFirestore.instance
        .collection('foods')
        .where('Category', isEqualTo: s)
        .snapshots();
  }
}
