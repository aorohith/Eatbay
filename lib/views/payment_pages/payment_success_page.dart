import 'package:eatbay/views/widgets/big_text.dart';
import 'package:eatbay/views/widgets/core/colors.dart';
import 'package:eatbay/views/widgets/rectangle_button.dart';
import 'package:flutter/material.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({Key? key}) : super(key: key);

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
