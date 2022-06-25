import 'package:eatbay/core/colors.dart';
import 'package:eatbay/widgets/big_text.dart';
import 'package:flutter/material.dart';

import '../../widgets/icon_text_filed.dart';
import '../../widgets/signin_button.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text("Add Address"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //map section
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          //button row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              addressIcon(icon: Icons.home, color: AppColors.mainColor),
              addressIcon(icon: Icons.work),
              addressIcon(icon: Icons.location_on),
            ],
          ),
          //Input field
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: "Dellivery Address"),
                const SizedBox(height: 10,),
                IconTextFiield(icon: Icons.location_on, hintText: "Address"),
                BigText(text: "Contact Person Name"),
                const SizedBox(height: 10,),
                IconTextFiield(icon: Icons.person, hintText: "Name"),
                BigText(text: "Contact Person Number"),
                const SizedBox(height: 10,),
                IconTextFiield(icon: Icons.phone, hintText: "Phone Number"),
              ],
            ),
          ),
          //submit button
          LoginButton(
            text: "Save Address",
            textSize: 20,
          ),
        ],
      )),
    );
  }

  Container addressIcon({required IconData icon, Color color = Colors.grey}) {
    return Container(
      height: 50,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}
