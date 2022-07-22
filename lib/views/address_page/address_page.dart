import 'package:eatbay/controllers/address/address_picker_controller.dart';
import 'package:eatbay/views/widgets/address_icons.dart';
import 'package:eatbay/views/widgets/big_text.dart';
import 'package:eatbay/views/core/colors.dart';
import 'package:eatbay/views/widgets/icon_text_filed.dart';
import 'package:eatbay/views/widgets/signin_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pick_location.dart';

class AddressPage extends StatelessWidget {
  AddressPage({Key? key}) : super(key: key);
  final addressPickerController = Get.put(AddressPickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Address"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //map section
              topAddressMapSection(),
              //button row
              addressTypeButtons(),
              //Input field
              bottomTextFields(),
              //submit button
              LoginButton(
                text: "Save Address",
                textSize: 20,
                onClick: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding bottomTextFields() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: "Dellivery Address"),
          const SizedBox(
            height: 10,
          ),
          IconTextFiield(
              icon: Icons.location_on,
              hintText: "Address",
              controller: addressPickerController.contactPersonController),
          BigText(text: "Contact Person Name"),
          const SizedBox(
            height: 10,
          ),
          IconTextFiield(
            icon: Icons.person,
            hintText: "Name",
            controller: addressPickerController.contactPersonController,
          ),
          BigText(text: "Contact Person Number"),
          const SizedBox(
            height: 10,
          ),
          IconTextFiield(
              icon: Icons.phone,
              hintText: "Phone Number",
              controller: addressPickerController),
        ],
      ),
    );
  }

  Row addressTypeButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AddressIcons(icon: Icons.home, color: AppColors.mainColor),
        AddressIcons(icon: Icons.work),
        AddressIcons(icon: Icons.location_on),
      ],
    );
  }

  Padding topAddressMapSection() {
    return Padding(
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
    );
  }
}
