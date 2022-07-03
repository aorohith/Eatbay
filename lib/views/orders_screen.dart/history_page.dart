import 'package:eatbay/views/widgets/big_text.dart';
import 'package:eatbay/views/widgets/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'history_detail.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.separated(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: (){
                    
                  },
                  child: SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(
                                text: "01/05/2022 01:21 PM",
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://img.freepik.com/free-photo/big-hamburger-with-double-beef-french-fries_252907-8.jpg?w=2000'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Total"),
                              SizedBox(
                                height: 5,
                              ),
                              BigText(text: "1 Item"),
                              SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Get.to(HistoryDetailPage());
                                },
                                child: Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border:
                                          Border.all(color: AppColors.mainColor)),
                                  child: Center(
                                    child: Text(
                                      "Order Details",
                                      style: TextStyle(
                                        color: AppColors.mainColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ]),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
              thickness: 2,
            ),
          ),
        ),
      ),
    );
  }
}
