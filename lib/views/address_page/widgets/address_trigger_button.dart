import 'package:eatbay/controllers/address/address_controller.dart';
import 'package:eatbay/controllers/address/address_picker_controller.dart';
import 'package:eatbay/views/address_page/widgets/address_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class AddressTriggerButton extends StatelessWidget {
  Callback onClick;
  String text;
  AddressTriggerButton({
    Key? key,
    required this.onClick,
    required this.text,
  }) : super(key: key);

  final addressPickerController = Get.put(AddressPickerController());
  final addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: onClick,
        child: Text(text),
      ),
    );
  }
}

addressBottomSheet() {
  final addressController = Get.put(AddressController());
  final addressPickerController = Get.put(AddressPickerController());
  Get.bottomSheet(
    isScrollControlled: true,
    Container(
        width: double.infinity,
        height: 350,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Enter Complete Address",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Row(
                children: [
                  const Text("Select Address Type *  "),
                  DropdownButton(
                    items: addressController.addressType.map(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      addressController.changeDropdown(value.toString());
                      Get.back();
                    },
                    value: addressController.currentDropdown,
                  ),
                ],
              ),

              // Row(
              //   children: List.generate(
              //     4,
              //     (index) => Padding(
              //       padding: const EdgeInsets.all(4.0),
              //       child: GestureDetector(
              //         onTap: (){
              //         if(addressController.newSelectedIndex == addressController.prevSelectedIndex){
              //         }
              //         },
              //         child: Container(
              //           height: 25,
              //           width: 50,
              //           decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(10),
              //             border: Border.all(color: Colors.red),
              //           ),
              //           child: Text(addressController.addressType[index]),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              AddressInput(
                icon: Icons.person,
                hintText: "Name",
                controller: addressPickerController.contactPersonController,
              ),
              AddressInput(
                icon: Icons.phone,
                hintText: "Phone",
                controller: addressPickerController.phoneController,
                keyboardType: TextInputType.number,
              ),
              AddressInput(
                icon: Icons.home,
                hintText: "Address",
                controller: addressPickerController.addressController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: AddressTriggerButton(
                  onClick: () {
                    addressPickerController.addAddress();
                  },
                  text: "Add Address",
                ),
              )
            ],
          ),
        )),
  );
}
