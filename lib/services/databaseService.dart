import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_demo/Utilities/authHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

late GoogleSignInAccount accountGoogle;
final refOrder = FirebaseFirestore.instance.collection('order');
final refUser = FirebaseFirestore.instance.collection('user');
final CollectionReference productsRef = FirebaseFirestore
    .instance
    .collection("Products");
FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
class DatabaseServices {


  // FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  String getUserId() {
    return _firebaseAuth.currentUser!.uid;
  }

  Future<void> addUserInfo(Map<String, Object?> map) async {
    await refUser.doc(currentUser!.uid).set(map);
  }

  Future<void> addOrder(Map<String, Object?> map, String orderId) async {
    await refOrder.doc(orderId).set(map);
  }

  Future<QuerySnapshot<Object?>> getOrders() async =>
      refOrder.get().then((QuerySnapshot snapshot) {
        return snapshot;
      });

}