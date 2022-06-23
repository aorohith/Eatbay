import 'package:eatbay/core/dimensions.dart';
import 'package:eatbay/widgets/big_text.dart';
import 'package:eatbay/widgets/button_text.dart';
import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';
import '../../widgets/stack_button.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.red,
            height: Dimensions.screenHeight,
            child: Column(
              children: [
                Container(
                  height: 350,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://www.hungryforever.com/wp-content/uploads/2015/11/feature-image-gulab-jamun-1280x720.jpg",
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
          //top buttons
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StackButton(icon: Icons.arrow_back_ios_new),
                StackButton(icon: Icons.shopping_cart),
              ],
            ),
          ),
          //center descriptioin
          Align(
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
                    //stars section
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              color: AppColors.mainColor,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(text: '4.5'),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(text: "1255 comments"),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Icon and text section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                          icon: Icons.circle,
                          iconColor: Colors.orange,
                          text: 'Normal',
                        ),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          iconColor: Colors.green,
                          text: '5 km',
                        ),
                        IconAndTextWidget(
                          icon: Icons.timelapse,
                          iconColor: Colors.red,
                          text: '42min',
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    BigText(text: "Inroduce"),
                    const SizedBox(
                      height: 15,
                    ),
                    const Expanded(
                      child: SizedBox(
                        child: Text(
                          "Typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),

                    
                  ],
                ),
              ),
            ),
          ),
          Align(
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
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text(
                                      '+',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text("1", style: TextStyle(fontSize: 20)),
                                    Text('-', style: TextStyle(fontSize: 25)),
                                  ]),
                            ),
                            Container(
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.mainColor,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    CommonButtonText(text: "₹199"),
                                    CommonButtonText(text: "Add to Cart")
                                  ],
                                ))
                          ],
                        ),
                      ),
          )
        ],
      ),
    );
  }
}
