import 'package:eatbay/core/colors.dart';
import 'package:eatbay/widgets/big_text.dart';
import 'package:eatbay/widgets/circle_increase_button.dart';
import 'package:eatbay/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../../widgets/round_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              _topButtons(),
              listTiles()
            ],
          ),
        ),
      ),
    );
  }

  Expanded listTiles() {
    return Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(text: 'Chinese Burger'),
                                  SmallText(text: "Spicy"),
                                  BigText(
                                    text: '₹ 3568.0',
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
                              ),
                              const Text("1",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  )),
                              IncreaseButton(
                                icon: Icons.add,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
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
          Row(children: [
            RoundButton(
                icon: Icons.home, color: AppColors.mainColor, onClick: () {}),
            const SizedBox(width: 20),
            RoundButton(
                icon: Icons.shopping_cart,
                color: AppColors.mainColor,
                onClick: () {}),
          ]),
        ],
      ),
    );
  }
}
