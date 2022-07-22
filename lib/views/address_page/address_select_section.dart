import 'package:eatbay/controllers/address/address_controller.dart';
import 'package:eatbay/models/address_model.dart';
import 'package:eatbay/views/address_page/pick_location.dart';
import 'package:eatbay/views/payment_pages/payment_method.dart';
import 'package:eatbay/views/widgets/address_icons.dart';
import 'package:eatbay/views/core/colors.dart';
import 'package:eatbay/views/core/constant.dart';
import 'package:eatbay/views/widgets/signin_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectAddressScreen extends StatelessWidget {
  SelectAddressScreen({Key? key}) : super(key: key);
  final addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Address"),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => PickLocationScreen());
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // topAddressTypeButton(),
              h20,
              Obx(() => Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => selectAddressCards(
                        index: index,
                        address: addressController.address[index],
                      ),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: addressController.address.length,
                    ),
                  )),
              h20,
              LoginButton(
                  text: "Select",
                  onClick: () {
                    Get.to(() => PaymentMethodScreen());
                  })
            ],
          ),
        ),
      ),
    );
  }

  Row topAddressTypeButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AddressIcons(
          icon: Icons.home,
          color: AppColors.mainColor,
        ),
        AddressIcons(icon: Icons.location_on),
        AddressIcons(icon: Icons.work),
      ],
    );
  }

  GestureDetector selectAddressCards({
    required AddressModel address,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        addressController.selectAddress(
          index: index,
          address: address,
        );
      },
      child: Obx(() => Card(
            color: addressController.selectedIndex.value == index
                ? AppColors.mainColor
                : const Color(0xffffffff),
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.contactPerson,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(address.phone),
                    Text(
                      address.address,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
