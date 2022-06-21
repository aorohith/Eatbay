import 'package:eatbay/presentation/home/food_page_body.dart';
import 'package:eatbay/widgets/big_text.dart';
import 'package:eatbay/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../../core/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 25),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: 'Location',
                          color: AppColors.mainColor,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: "City",
                              color: Colors.black,
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.mainColor),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(child: SingleChildScrollView(child: FoodPageBody())),
            
          ],
        ),
      ),
    );
  }
}
