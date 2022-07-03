import 'package:eatbay/views/widgets/big_text.dart';
import 'package:eatbay/views/widgets/core/colors.dart';
import 'package:eatbay/views/widgets/icon_text_filed.dart';
import 'package:eatbay/views/widgets/signin_button.dart';
import 'package:eatbay/views/widgets/small_text.dart';
import 'package:flutter/material.dart';

class AdminSignInPage extends StatelessWidget {
  AdminSignInPage({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            IconTextFiield(
                icon: Icons.email,
                hintText: "Admin Email",
                controller: emailController),
            IconTextFiield(
              icon: Icons.password,
              hintText: "Password",
              controller: passwordController,
            ),
            LoginButton(
              text: "Sign In",
              onClick: () {
                // Get.to(AdminDashboardPage());
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
