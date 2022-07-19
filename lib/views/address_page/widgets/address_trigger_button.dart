import 'package:eatbay/controllers/address/address_controller.dart';
import 'package:eatbay/views/address_page/widgets/address_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressTriggerButton extends StatelessWidget {
  AddressTriggerButton({Key? key}) : super(key: key);

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
        onPressed: () async {
          addressBottomSheet();
        },
        child: const Text(
          'Enter Complete Addresses',
        ),
      ),
    );
  }

  addressBottomSheet() {
    Get.bottomSheet(
      Container(
          width: double.infinity,
          height: 350,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter Complete Address",
                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                ),
                Divider(),
                Text("Save Address as *"),
                Row(
                  children: List.generate(
                    4,
                    (index) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: (){
                        if(addressController.newSelectedIndex == addressController.prevSelectedIndex){
                          
                        }
                        },
                        child: Container(
                          height: 25,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.red),
                          ),
                          child: Text(addressController.addressType[index]),
                        ),
                      ),
                    ),
                  ),
                ),
                AddressInput(
                  icon: Icons.person,
                  hintText: "Name",
                ),
                AddressInput(
                  icon: Icons.person,
                  hintText: "Phone",
                ),
                AddressInput(
                  icon: Icons.person,
                  hintText: "Address",
                ),
              ],
            ),
          )),
    );
  }
}
