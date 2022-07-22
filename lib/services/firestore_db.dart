import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatbay/models/address_model.dart';
import 'package:eatbay/models/cart_model.dart';
import 'package:eatbay/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDB{


  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

   Stream<List<Product>> getProducts() {
    Stream<List<Product>> temp;
    temp = FirebaseFirestore.instance.collection('productlist').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());
    return temp;
  }
  
  Stream<List<AddressModel>> getAddress() {
    Stream<List<AddressModel>> temp;
    temp = _firebaseFirestore.collection('addresses').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => AddressModel.fromJson(doc.data()))
            .toList());
    return temp;
  }

  Stream<List<Cart>> getCartProducts() {
    var temp;
    temp = FirebaseFirestore.instance
        .collection('cartproducts')
        .where('user_id', isEqualTo: _firebaseAuth.currentUser!.uid)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Cart.fromJson(doc.data())).toList());
    return temp;
  }
  
}