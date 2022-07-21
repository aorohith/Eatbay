import 'package:eatbay/controllers/cart_controller.dart';
import 'package:eatbay/models/cart_model.dart';
import 'package:eatbay/views/address_page/address_select_section.dart';
import 'package:eatbay/views/widgets/big_text.dart';
import 'package:eatbay/views/widgets/circle_increase_button.dart';
import 'package:eatbay/views/widgets/core/colors.dart';
import 'package:eatbay/views/widgets/round_button.dart';
import 'package:eatbay/views/widgets/small_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final cartController = Get.find<CartController>();
  final currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    cartController.getCartTotal();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  _topButtons(),
                  listTiles(),
                  currentUser == null || cartController.cartProducts.isEmpty
                      ? const SizedBox()
                      : checkout(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _topButtons() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        left: 20,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RoundButton(
              icon: Icons.home, color: AppColors.mainColor, onClick: () {}),
        ],
      ),
    );
  }

  listTiles() {
    if (cartController.isLoading) {
      return const CircularProgressIndicator();
    } else {
      return Expanded(
        child: GetBuilder<CartController>(
          init: CartController(),
          initState: (_) {},
          builder: (cartController) {
            return ListView.builder(
              itemCount: cartController.cartProducts.length,
              itemBuilder: (context, index) {
                Cart cartProduct = cartController.cartProducts[index];
                return cartContainer(cartProduct);
              },
            );
          },
        ),
      );
    }
  }

  SizedBox cartContainer(Cart cartProduct) {
    return SizedBox(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //image container
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      cartProduct.product.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 20,
                      child: BigText(text: cartProduct.product.name),
                    ),
                    SmallText(text: "Spicy"),
                    BigText(
                      text: '₹ ${cartProduct.totalPrice}',
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IncreaseButton(
                  icon: Icons.remove,
                  onClick: () {
                    cartController.decrementCount(cartProduct);
                  },
                ),
                Text(cartProduct.quantity.toString(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                IncreaseButton(
                  onClick: () {
                    cartController.incrementCount(cartProduct);
                  },
                  icon: Icons.add,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  checkout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: 50,
          width: 100,
          child: const Center(
            child: Text(
              "Checkout",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(SelectAddressScreen());
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 50,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Center(
                child: Obx(() => Text(
                      cartController.cartGrandTotal.value.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              ),
            ),
          ),
        )
      ],
    );
  }
}
