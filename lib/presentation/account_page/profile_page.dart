import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
             SizedBox(
              height: 150,
              width: 150,
               child: Stack(
                 children: [
                   CircleAvatar(
                    radius: 70,
                    child: Icon(
                      Icons.person,
                      size: 100,
                    ),
                         ),
                         Align(
                alignment: Alignment.bottomRight,
                child: IconButton(onPressed: (){}, icon: Icon(Icons.add_a_photo_rounded,size: 40,)))
                 ],
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
            ProfileTiles(icon: Icons.feedback, text: "Complaints", onClick: () {}),
            ProfileTiles(
                icon: Icons.exit_to_app, text: "Logout", onClick: () {},color: Colors.red,),
          ],
        ),
      ),
    );
  }
}
