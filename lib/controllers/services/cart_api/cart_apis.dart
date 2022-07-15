import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatbay/controllers/cart_controller.dart';
import 'package:eatbay/models/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

late Map<String, dynamic> _data;
late Map<String, dynamic> _product;

checkCartIsEmpty() async {
  final cartController = Get.put(CartController());
  Stream<QuerySnapshot<Map<String, dynamic>>> temp;
  temp = FirebaseFirestore.instance
      .collection('cartproducts')
      .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
  var data =  await temp.first;
  if (data.docs.isEmpty) {
    return true;
  } else {
    return false;
  }
  // List<Cart> result = data
  //   ..map((snapshot) => snapshot.docs.map((doc) {
  //         var d = Cart.fromJson(doc.data());
  //         if (d.product.id == userId) {
  //           return ;
  //         }
  //       }).toList());
  // if (result.isEmpty) {
  //   return true;
  // } else {
  //   return false;
  // }

  // var temp = FirebaseFirestore.instance.collection('cartproducts').snapshots();
  // var data = await temp.first;
  // if (data.size == 0) {
  //   return true;
  // } else {
  //   var tt = data.docs.map((e) {
  //     Cart obj = Cart.fromJson(e.data());
  //   }).toList();
  //   print(tt);
  // }
  // .listen((event) {
  //   print(event);

  // if (event.size == 0) {
  //   log("=================");

  // } else {
  //   event.docs.map((e) {
  //   _data = e.data();

  //   if (_data['user_id'] == userId){

  //     cartController.isCartEmpty = false;
  //   }
  // });
  // }
  // }
  // );
}

checkProductIsExist(String prodId) async {
  final cartController = Get.put(CartController());
  FirebaseFirestore.instance
      .collection('cartproducts')
      .snapshots()
      .listen((event) {
    event.docs.map((e) {
      _data = e.data();
      _product = _data['product'] as Map<String, dynamic>;
      if (_product['id'] == prodId) {
        cartController.isInCart = true;
      }
    });
  });
}
