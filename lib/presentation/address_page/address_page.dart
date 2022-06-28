import 'package:eatbay/core/colors.dart';
import 'package:eatbay/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/address_icons.dart';
import '../../widgets/icon_text_filed.dart';
import '../../widgets/signin_button.dart';
import 'pick_location.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Address"),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //map section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Get.to(PickLocationScreen());
              },
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.mainColor, width: 2),
                  image: const DecorationImage(
                      image: NetworkImage(
                        "https://d32ogoqmya1dw8.cloudfront.net/images/sp/library/google_earth/google_maps_hello_world.jpg",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          //button row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AddressIcons(icon: Icons.home, color: AppColors.mainColor),
              AddressIcons(icon: Icons.work),
              AddressIcons(icon: Icons.location_on),
            ],
          ),
          //Input field
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: "Dellivery Address"),
                const SizedBox(
                  height: 10,
                ),
                IconTextFiield(icon: Icons.location_on, hintText: "Address"),
                BigText(text: "Contact Person Name"),
                const SizedBox(
                  height: 10,
                ),
                IconTextFiield(icon: Icons.person, hintText: "Name"),
                BigText(text: "Contact Person Number"),
                const SizedBox(
                  height: 10,
                ),
                IconTextFiield(icon: Icons.phone, hintText: "Phone Number"),
              ],
            ),
          ),
          //submit button
          LoginButton(
            text: "Save Address",
            textSize: 20,
            onClick: () {},
          ),
        ],
      )),
    );
  }
}


