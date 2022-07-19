import 'package:eatbay/controllers/auth_controller/auth_controller.dart';
import 'package:eatbay/views/address_page/address_select_section.dart';
import 'package:eatbay/views/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            topProfilePic(),
            ProfileTiles(icon: Icons.person, text: "Rohith", onClick: () {}),
            ProfileTiles(icon: Icons.phone, text: "9568254895", onClick: () {}),
            ProfileTiles(icon: Icons.mail, text: "asd@dsd.com", onClick: () {}),
            ProfileTiles(
                icon: Icons.location_on,
                text: "Fill Address",
                onClick: () {
                  Get.to(()=>SelectAddressScreen());
                }),
            ProfileTiles(
                icon: Icons.feedback, text: "Complaints", onClick: () {}),
            ProfileTiles(
              icon: Icons.exit_to_app,
              text: "Logout",
              onClick: () {
                AuthController.instance.logout();
              },
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  SizedBox topProfilePic() {
    return SizedBox(
      height: 150,
      width: 150,
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 70,
            child: Icon(
              Icons.person,
              size: 100,
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_a_photo_rounded,
                    size: 40,
                  )))
        ],
      ),
    );
  }
}
