import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatbay/controllers/address/address_controller.dart';
import 'package:eatbay/controllers/cart_controller.dart';
import 'package:eatbay/models/orders.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  final cartController = Get.find<CartController>();
  final addressController = Get.find<AddressController>();
  var isLoading = false.obs;

  var orders = <Order>[].obs;

  addSuccessOrder() async {
    Order order = Order(
      amount: cartController.cartGrandTotal.value,
      cartProducts: cartController.cartProducts.toList(),
      dateTime: DateTime.now(),
      paymentType: 'paypal',
      status: 'ordered',
      address: addressController.selectedAddress,
    );
    isLoading.value = true;
    // try {
      final doc = FirebaseFirestore.instance.collection('orders').doc();
      order.id = doc.id;
      final jsonData = order.toJson();
      log("$jsonData");

      await doc.set(jsonData);
      log("============================d;f;adfadfdf;ds==");

    // } catch (e) {
      // Get.snackbar("There is an error occured", "");
    // }
    isLoading.value = false;
  }
}
