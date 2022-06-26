import 'package:eatbay/core/colors.dart';
import 'package:eatbay/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../widgets/profile_tile.dart';
import '../address_page/address_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 80,
              child: Icon(
                Icons.person,
                size: 100,
              ),
            ),
            ProfileTiles(icon: Icons.person, text: "Rohith", onClick: () {}),
            ProfileTiles(icon: Icons.phone, text: "9568254895", onClick: () {}),
            ProfileTiles(icon: Icons.mail, text: "asd@dsd.com", onClick: () {}),
            ProfileTiles(
                icon: Icons.location_on,
                text: "Fill Address",
                onClick: () {
                  Get.to(AddressPage());
                }),
            ProfileTiles(icon: Icons.feedback, text: "None", onClick: () {}),
            ProfileTiles(
                icon: Icons.exit_to_app, text: "Logout", onClick: () {}),
          ],
        ),
      ),
    );
  }
}
