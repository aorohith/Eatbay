import 'package:eatbay/views/widgets/address_icons.dart';
import 'package:eatbay/views/widgets/core/colors.dart';
import 'package:eatbay/views/widgets/core/constant.dart';
import 'package:eatbay/views/widgets/signin_button.dart';
import 'package:flutter/material.dart';

class SelectAddressScreen extends StatelessWidget {
  const SelectAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Address"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              topAddressTypeButton(),
              h20,
              selectAddressCards(),
              selectAddressCards(color: AppColors.mainColor),
              selectAddressCards(),
              selectAddressCards(),
              h20,
              LoginButton(text: "Select", onClick: () {})
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
                AddressIcons(icon: Icons.home,color: AppColors.mainColor,),
                AddressIcons(icon: Icons.location_on),
                AddressIcons(icon: Icons.work),
              ],
            );
  }

  Card selectAddressCards({Color color = Colors.white}) {
    return Card(
      color: color,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: double.infinity,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Achu\n9562802748\nHouse no 10, No 20 Street,Chengannur",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
