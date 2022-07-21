import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatbay/controllers/cart_controller.dart';
import 'package:eatbay/controllers/services/cart_api/cart_apis.dart';
import 'package:eatbay/models/cart_model.dart';
import 'package:eatbay/models/product_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final cartController = Get.put(CartController());

  var isLoading = false;
  RxList<Product> products = RxList<Product>([]);
  var quantity = 1.obs;
  final firebaseInstance = FirebaseFirestore.instance;
  

  @override
  void onInit() {
    products.bindStream(getProducts());
    super.onInit();
  }

  Stream<List<Product>> getProducts() {
    isLoading = true;
    Stream<List<Product>> temp;
    temp = FirebaseFirestore.instance.collection('productlist').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());
    isLoading = false;
    update();
    return temp;
  }

//add product from popular detail section
  addToCart(Cart cart) async {
    isLoading = true;
    // try {
    //check product is in collection or not? true return when empty
    // await checkWholeCartIsEmpty();
    //check cart is empty or not for the current user also return true when empty
    bool isEmpty = await checkUserCartIsEmpty(cart);
    // log(isEmpty.toString());
    if (isEmpty) {
      final doc = firebaseInstance.collection('cartproducts').doc();
      cart.id = doc.id;
      final json = cart.toJson();
      await doc.set(json);
      Get.snackbar(
        "Hurray!!",
        "Product Added to cart",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      log("Already exist");
      final doc = firebaseInstance
          .collection('cartproducts')
          .doc(cartController.currentCartProduct.id);
      doc.update({
        'quantity': cart.quantity + cartController.currentCartProduct.quantity,
      });
      Get.snackbar(
        "Hurray!!",
        "Product Added to cart",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    // } catch (exception) {
    //   Get.snackbar(
    //     "title",
    //     exception.toString(),
    //     snackPosition: SnackPosition.BOTTOM,
    //   );
    //   log(exception.toString());
    // }
    isLoading = false;
    update();
  }
}
