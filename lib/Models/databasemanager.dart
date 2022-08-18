import 'package:cloud_firestore/cloud_firestore.dart';

class DatabseManger {
  final CollectionReference foodlist =
      FirebaseFirestore.instance.collection('foods');
// Stream documentStream = FirebaseFirestore.instance.collection('users').doc('ABC123').snapshots();

  // Future getfoods() async {
  //   try {

//       const citiesRef = db.collection('foods');
// const snapshot = await citiesRef.get();
// snapshot.forEach(doc => {
//   console.log(doc.id, '=>', doc.data());
// });
  //     await foodlist.doc().get().then((querySnapshot) {
  //       querySnapshot.documents.forEach((){});
  //     });
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }
}
