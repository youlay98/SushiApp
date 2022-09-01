import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:sushiapp/Auth/utils_class.dart';
import 'package:sushiapp/config/provider_models/pyment.dart';

ValueNotifier<double> lat = ValueNotifier(0.0);
ValueNotifier<double> lag = ValueNotifier(0.0);

class Mapp extends ChangeNotifier {
  String address = '';

  getadress(
      double lat, double long, String userID, BuildContext context) async {
    var addresses = await placemarkFromCoordinates(lat, long);
    String adrs =
        '${addresses[0].locality}  ${addresses[0].subLocality} ${addresses[1].name} ${addresses[3].street} ${addresses[4].street}';
    await setadress(adrs, lat, long, userID, context);
  }

  checkuserIdexist(String userId) async {
    bool isexist = false;
    await FirebaseFirestore.instance
        .collection('address')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        if (userId == doc['userId']) {
          isexist = true;
        }
      }
    });
    return isexist;
  }

  Future<bool> checkifadressexist(
      double mLat, double mLong, String userId) async {
    bool isexist = false;
    await FirebaseFirestore.instance
        .collection('address')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        if (mLat == doc['lat'] &&
            mLong == doc['long'] &&
            userId == doc['userId']) {
          isexist = true;
        }
      }
    });
    return isexist;
  }

  setadress(String adress, double mLat, double mLong, String usid,
      BuildContext context) async {
    // if the user and the location already exist in the Collection
    if (await checkifadressexist(mLat, mLong, usid)) {
      Utils.showSnackBar('this location already Exist ');
    } else {
      // if the user exist in the address Collection but the location is different;
      if (await checkuserIdexist(usid) &&
          !await checkifadressexist(mLat, mLong, usid)) {
        await updateAdress(await getdocId(usid), mLat, mLong);
        Utils.showSnackBargreen('The Location has been updated');
        Provider.of<Pyment>(context, listen: false).myAddris = adress;
      } else {
        await FirebaseFirestore.instance.collection('address').add(
            {'userId': usid, 'address': adress, 'lat': mLat, 'long': mLong});
        Provider.of<Pyment>(context, listen: false).myAddris = adress;

        Utils.showSnackBargreen('The Location  Added');
      }
    }
  }

  getdocId(String userId) async {
    String? collctionId;
    await FirebaseFirestore.instance
        .collection('address')
        .where('userId', isEqualTo: userId)
        .get()
        .then((value) {
      for (var element in value.docs) {
        collctionId = element.id;
      }
    });
    return collctionId;
  }

  updateAdress(String id, double mLat, double mLong) async {
    final sfDocRef = FirebaseFirestore.instance.collection('address').doc(id);
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      // final snapshot = await transaction.get(sfDocRef);

      // final numbtotal = snapshot.get("totalnumber") + 1;
      // final totalprice = snapshot.get("price") * numbtotal;
      transaction.update(sfDocRef, {"lat": mLat});
      transaction.update(sfDocRef, {"long": mLong});
    });
  }
}
