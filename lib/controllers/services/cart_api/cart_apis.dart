import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatbay/controllers/cart_controller.dart';
import 'package:eatbay/models/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

late Map<String, dynamic> _data;
late Map<String, dynamic> _product;

//fetch all cart product with logined user and checked
checkCartIsEmpty() async {
  Stream<QuerySnapshot<Map<String, dynamic>>> temp;
  temp = FirebaseFirestore.instance
      .collection('cartproducts')
      .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
  var data = await temp.first;
  if (data.docs.isEmpty) {
    return true;
  } else {
    return false;
  }
}

checkProductIsExist(String prodId) async {
  final cartController = Get.put(CartController());
  Stream<QuerySnapshot<Map<String, dynamic>>> temp =
      FirebaseFirestore.instance.collection('cartproducts').snapshots();
  QuerySnapshot<Map<String, dynamic>> data = await temp.first;
  var docs = data.docs;
  var withProdIdList = docs.map((e) {
    if (e.data()['product']['id'] == prodId) {
      return e;
    }
  }).toList();
  if (withProdIdList.isEmpty) {
    return false;
  } else {
    cartController.currentCartProduct =
        Cart.fromJson(withProdIdList[0]!.data());
    log(cartController.currentCartProduct.id);
    return true;
  }
}
