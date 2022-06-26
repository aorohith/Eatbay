import 'package:eatbay/presentation/signup_page.dart/signup.dart';
import 'package:eatbay/widgets/big_text.dart';
import 'package:eatbay/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/colors.dart';
import '../../../widgets/icon_text_filed.dart';
import '../../../widgets/signin_button.dart';
import '../dahboard_page/admin_dashboard_page.dart';

class AdminSignInPage extends StatelessWidget {
  const AdminSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://thumbs.dreamstime.com/b/food-delivery-logo-food-delivery-logo-vector-template-157000359.jpg',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Welcome Back Chief.!!",
              style: TextStyle(color: AppColors.mainColor, fontSize: 25),
            ),
            SizedBox(
              height: 30,
            ),
            IconTextFiield(icon: Icons.email, hintText: "Admin Email"),
            IconTextFiield(icon: Icons.password, hintText: "Password"),
            LoginButton(
              text: "Sign In",
              onClick: () {
                Get.to(AdminDashboardPage());
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallText(
                  text: "Contact Team",
                  size: 18,
                ),
                BigText(text: " Forgot?")
              ],
            )
          ],
        ),
      ),
    );
  }
}
