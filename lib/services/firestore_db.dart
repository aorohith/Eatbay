import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatbay/controllers/address/address_controller.dart';
import 'package:eatbay/controllers/cart_controller.dart';
import 'package:eatbay/controllers/home_controller.dart';
import 'package:eatbay/models/address_model.dart';
import 'package:eatbay/models/cart_model.dart';
import 'package:eatbay/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirestoreDB{
  // final addressController = Get.put(AddressController());
  // final cartController = Get.put(CartController());
  // final homeController = Get.put(HomeController());


  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

   Stream<List<Product>> getProducts() {
    // homeController.isLoading = true;
    Stream<List<Product>> temp;
    temp = FirebaseFirestore.instance.collection('productlist').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());
    // homeController.isLoading = false;
    return temp;
  }
  
  Stream<List<AddressModel>> getAddress() {
    // addressController.isLoading = true;
    Stream<List<AddressModel>> temp;
    temp = _firebaseFirestore.collection('addresses').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => AddressModel.fromJson(doc.data()))
            .toList());
    // addressController.isLoading = false;
    return temp;
  }

  Stream<List<Cart>> getCartProducts() {
    // cartController.isLoading = true;
    var temp;
    temp = FirebaseFirestore.instance
        .collection('cartproducts')
        .where('user_id', isEqualTo: _firebaseAuth.currentUser!.uid)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Cart.fromJson(doc.data())).toList());
    // cartController.isLoading = false;
    return temp;
  }
  
}