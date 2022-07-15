// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:eatbay/controllers/cart_controller.dart';
// import 'package:get/get.dart';

// abstract class CartApi {
//   checkCartItemExists();
//   checkCartIsEmpty();
//   addToCart();
// }

// class CartPageApi extends CartApi {
//   final cartController = Get.put(CartController());
//   @override
//    checkCartIsEmpty() {
//     FirebaseFirestore.instance
//         .collection('cartproducts')
//         .snapshots()
//         .listen((event) {
//       if (event.size == 0) {
//         cartController.isInCart = true;
//       } else {
//         cartController.isInCart = false;
//       }
//     });
//   }

//   @override
//   addToCart() {
//     // TODO: implement addToCart
//     throw UnimplementedError();
//   }

//   @override
//   checkCartItemExists() {
//     // TODO: implement checkCartItemExists
//     throw UnimplementedError();
//   }
// }
