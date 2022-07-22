import 'package:eatbay/controllers/bottomnav_controller/bottomnav_controller.dart';
import 'package:eatbay/views/bottom_nav_bar/bottom_nav.dart';
import 'package:eatbay/views/widgets/big_text.dart';
import 'package:eatbay/views/core/colors.dart';
import 'package:eatbay/views/widgets/rectangle_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSuccessPage extends StatelessWidget {
  PaymentSuccessPage({Key? key}) : super(key: key);

  final bottomController = Get.find<BottomnavController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 40,
                    ),
                    backgroundColor: AppColors.mainColor,
                  ),
                  BigText(text: "The order placed Successfully"),
                  RectangleButton(
                    text: "Back to Home",
                    context: context,
                    bgColor: AppColors.mainColor,
                    onClick: () {
                      Get.to(() => BottomNavScreen());
                      bottomController.selectedIndex = 1;
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
