import 'package:eatbay/controllers/cart_controller.dart';
import 'package:eatbay/models/cart_model.dart';
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

  final cartController = Get.put(CartController());
  final currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Stack(
            children: [
              Column(
                children: [
                  _topButtons(),
                  listTiles(),
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.red,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  listTiles() {
    // final cartController = Get.put(CartController());

    if (cartController.isLoading) {
      return CircularProgressIndicator();
    } else {
      return Expanded(
        child: currentUser == null
            ? Center(
                child: Text(
                "Please Login for Cart",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ))
            : GetBuilder<CartController>(
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
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://t4.ftcdn.net/jpg/04/36/36/57/360_F_436365754_z3i5Es0sFmZuLY6GZIzdiU01v9HqpGZe.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
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
                    style: TextStyle(
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

  Padding _topButtons() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        left: 20,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundButton(
              icon: Icons.arrow_back_ios_new,
              color: AppColors.mainColor,
              onClick: () {}),
          RoundButton(
              icon: Icons.home, color: AppColors.mainColor, onClick: () {}),
        ],
      ),
    );
  }
}
