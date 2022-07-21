import 'package:eatbay/controllers/cart_controller.dart';
import 'package:eatbay/models/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

checkUserCartIsEmpty(Cart cartObj) async {
  final cartController = Get.put(CartController());
  final fireAuth = FirebaseAuth.instance.currentUser;

  try {
    if (fireAuth != null) {
      var contain = cartController.cartProducts.value
          .where((element) => element.product.id == cartObj.product.id)
          .toList();
      if (contain.isEmpty) {
        return true;
      } else {
        cartController.currentCartProduct = contain.first;
        return false;
      }
    }
  } catch (e) {
    Get.snackbar("Error occured", e.toString());
  }
}
