

import 'package:eatbay/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

 getDialogue(){
  final cartController = Get.find<CartController>();
  Get.defaultDialog(
        title: "Are you sure to delete?",
        middleText: '',
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              cartController.deleteCartData();
              Get.back();
              Get.snackbar("Product delted from Cart", '');
            },
            child: Text("Delete"),
          ),
        ],
      );
 }