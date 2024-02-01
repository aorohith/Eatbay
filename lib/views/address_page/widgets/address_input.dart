import 'package:eatbay/controllers/address/address_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressInput extends StatelessWidget {
  final TextEditingController controller;
  final bool obscuredText;
  final IconData icon;
  final String hintText;
  final TextInputType keyboardType;

  AddressInput(
      {super.key, required this.hintText,
      required this.icon,
      this.obscuredText = false,
      required this.controller,
      this.keyboardType = TextInputType.name});

  final addressPickerController = Get.put(AddressPickerController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        obscureText: obscuredText,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: hintText,
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
