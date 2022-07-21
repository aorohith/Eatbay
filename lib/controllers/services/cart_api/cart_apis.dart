import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatbay/controllers/cart_controller.dart';
import 'package:eatbay/models/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

late Map<String, dynamic> _data;
late Map<String, dynamic> _product;

//fetch all cart product with logined user and checked
// checkWholeCartIsEmpty() async {
//   Stream<QuerySnapshot<Map<String, dynamic>>> temp;
//   temp = FirebaseFirestore.instance
//       .collection('cartproducts')
//       .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//       .snapshots();
//   var data = await temp.first;
//   log(data.docs.length.toString());

//   if (data.docs.isEmpty) {

//     return true;
//   } else {
//     return false;
//   }
// }

checkUserCartIsEmpty(Cart cartObj) async {
  final cartController = Get.put(CartController());

  final fireAuth = FirebaseAuth.instance.currentUser;

  if (fireAuth != null) {
    Stream<QuerySnapshot<Map<String, dynamic>>> temp =
        FirebaseFirestore.instance.collection('cartproducts').snapshots();
    QuerySnapshot<Map<String, dynamic>> data = await temp.first;
    var docs = data.docs;
    log((docs[0].data().values.isEmpty).toString());
    if (docs[0].data().values.isEmpty) {
      return true;
    } else {
      var withProdIdList = docs.map((e) {
        if (e.data()['user_id'] == fireAuth.uid) {
          return e;
        }
      }).toList();
      if (withProdIdList[0] == null) {
        return true;
      } else {
        List<Cart?> cart = withProdIdList.map((value) {
          if (value != null) {
            Cart cart = Cart.fromJson(value.data());

            if (cart.product.id == cartObj.product.id) {
              log(cart.product.id);
              cartController.currentCartProduct = cart;
              return cart;
            }
          }
        }).toList();
        return false;
      }
    }
  }
}
