import 'package:eatbay/controllers/address/address_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressInput extends StatelessWidget {
  final bool obscuredText;
  final IconData icon;
  final String hintText;
  AddressInput({
    Key? key,
    required this.hintText,
    required this.icon,
    this.obscuredText = false,
  }) : super(key: key);

  final addressPickerController = Get.put(AddressPickerController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10.0),
      child: TextFormField(
        obscureText: obscuredText,
        controller: addressPickerController.contactPersonController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: hintText,
        ),
      ),
    );
  }
}
