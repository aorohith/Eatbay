import 'package:eatbay/views/widgets/big_text.dart';
import 'package:eatbay/views/widgets/button_text.dart';
import 'package:eatbay/views/widgets/core/colors.dart';
import 'package:eatbay/views/widgets/detail_image_view.dart';
import 'package:eatbay/views/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../payment_pages/payment_method.dart';

class RecomendDetail extends StatelessWidget {
  const RecomendDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        //image section
        const DetailImageSection(),
        //top buttons
        _topButtons(),
        //center descriptioin
        _bottomDescription(),
        //section of count and amount
        _countAmount(),
        //bottom count and amount section
        _bottomSection()
      ]),
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
            onClick: () {},
          ),
          RoundButton(
              icon: Icons.shopping_cart,
              color: AppColors.mainColor,
              onClick: () {}),
        ],
      ),
    );
  }

  Align _bottomDescription() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 500,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: "Biriyani",
                size: 25,
              ),
              const SizedBox(
                height: 15,
              ),
              const Expanded(
                child: SizedBox(
                  child: Text(
                    "Typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _countAmount() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 80,
          width: 300,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundButton(
                icon: Icons.remove,
                color: AppColors.mainColor,
                onClick: () {},
              ),
              const Text(
                "₹299 X 0",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RoundButton(
                icon: Icons.add,
                color: AppColors.mainColor,
                onClick: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align _bottomSection() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.bottomPriceBg,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.heart_broken,
                    color: AppColors.mainColor,
                  )),
            ),
            GestureDetector(
              onTap: (){
                Get.to(PaymentMethodScreen());
              },
              child: Container(
                height: 50,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.mainColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CommonButtonText(text: "₹199"),
                    CommonButtonText(text: "Add to Cart")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
