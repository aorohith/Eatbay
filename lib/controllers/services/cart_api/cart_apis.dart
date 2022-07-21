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
    var prodIds =
        cartController.cartProducts.value.map((e) => e.product.id).toList();
    // if(prodIds.contains(cartObj.product.id)){
    //   return false;
    // }else{
    //   return true;
    // }

    var contain = cartController.cartProducts.value
        .where((element) => element.product.id == cartObj.product.id)
        .toList();
    //value exists
    if (contain.isEmpty) {
      return true;
    } else {
      cartController.currentCartProduct = contain.first;
      return false;
    }

    // if (fireAuth != null) {
    //   Stream<QuerySnapshot<Map<String, dynamic>>> temp =
    //       FirebaseFirestore.instance.collection('cartproducts').snapshots();
    //   QuerySnapshot<Map<String, dynamic>> data = await temp.first;
    //   var docs = data.docs;
    //   if (docs[0].data().values.isEmpty) {//check all collection is empty or not
    //     return true;
    //   } else {
    //     var userCartList = docs.map((e) {
    //       if (e.data()['user_id'] == fireAuth.uid) {//select user cart products
    //         return e;
    //       }
    //     }).toList();
    //     if (userCartList[0] == null) {//sure, user dont have any product in cart
    //       return true;
    //     } else {
    //       var a = userCartList.map((value) {
    //         if (value != null) {
    //           Cart cart = Cart.fromJson(value.data());
    //           if (cart.product.id == cartObj.product.id) {//check the product id with fetched cart product
    //             cartController.currentCartProduct = cart;
    //             return cart;
    //           }
    //           }
    //         }
    //       ).toSet().toList();
    //       log("=================$a");
    //       return false;
    //     }
    //   }
    // }
  }
}
