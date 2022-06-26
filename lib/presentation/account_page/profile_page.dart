import 'package:eatbay/core/colors.dart';
import 'package:eatbay/widgets/big_text.dart';
import 'package:flutter/material.dart';

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
            _profileIconText(icon: Icons.person, text: "Rohith"),
            _profileIconText(icon: Icons.phone, text: "9568254895"),
            _profileIconText(icon: Icons.mail, text: "asd@dsd.com"),
            _profileIconText(icon: Icons.location_on, text: "Fill Address"),
            _profileIconText(icon: Icons.feedback, text: "None"),
            _profileIconText(icon: Icons.exit_to_app, text: "Logout"),
          ],
        ),
      ),
    );
  }

  Container _profileIconText(
      {required IconData icon,
      required String text,
      Color color = AppColors.mainColor}) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 10,
          left: 10,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 30,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 20),
            BigText(text: text),
          ],
        ),
      ),
    );
  }
}
