import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatbay/models/cart_model.dart';
import 'package:eatbay/services/cart_apis.dart';
import 'package:eatbay/services/firestore_db.dart';
import 'package:eatbay/views/cart/widgets/cart_delete_popup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  bool isLoading = false;
  RxList<Cart> cartProducts = RxList<Cart>([]);
  late Cart currentCartProduct; //latest updated cart value is here
  var temperory = 0.obs;
  final firebaseInstance = FirebaseFirestore.instance;
  var cartGrandTotal = 0.0.obs;

  @override
  onInit() {
    if (FirebaseAuth.instance.currentUser != null) {
      try {
        isLoading = true;
        cartProducts.bindStream(FirestoreDB().getCartProducts());
      } catch (e) {
        Get.snackbar("Error", "An error Occured ${e.toString()}");
      }
      isLoading = false;
    }
    super.onInit();
  }

  grandTotalUpdate() {
    log(cartProducts.value[0].totalPrice.toString());
    cartProducts.value.map((e) {
      log(e.product.id);
      cartGrandTotal.value =
          cartGrandTotal.value + (e.quantity * e.product.price);
    });
    log(cartGrandTotal.value.toString());
  }

  incrementCount(Cart cart) {
    currentCartProduct = cart;
    cart.quantity++;
    cart.totalPrice = cart.totalPrice + cart.product.price;
    temperory.value = cart.quantity;
    cartGrandTotal.value = cartGrandTotal.value + cart.product.price;
    // debounce(temperory, (value) {
    //   updateData(value);
    // });
    update();
  }

  decrementCount(Cart cart) {
    currentCartProduct = cart;
    if (cart.quantity > 1) {
      cart.quantity--;
      cart.totalPrice = cart.quantity * cart.product.price;
      temperory.value = cart.quantity;
      cartGrandTotal.value = cartGrandTotal.value - cart.product.price;
      // debounce(temperory, (value) {
      //   updateData(value);
      // });
    } else {
      cartGrandTotal.value = cartGrandTotal.value - cart.product.price;
      getDialogue();
    }

    update();
  }

  getCartTotal() {
    cartGrandTotal.value = 0;
    for (Cart cart in cartProducts) {
      cartGrandTotal.value =
          cartGrandTotal.value + cart.quantity * cart.product.price;
    }
    log(cartGrandTotal.value.toString());
  }

  updateData(value) {
    final doc =
        firebaseInstance.collection('cartproducts').doc(currentCartProduct.id);
    doc.update(
        {'quantity': value, 'total_price': currentCartProduct.totalPrice});
  }

  deleteCartData() {
    try {
      deleteCartProduct(currentCartProduct.id);
      update();
    } catch (e) {
      print(e);
    }
  }
}
