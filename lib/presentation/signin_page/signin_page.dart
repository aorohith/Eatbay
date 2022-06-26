import 'package:eatbay/core/colors.dart';
import 'package:eatbay/presentation/signup_page.dart/signup.dart';
import 'package:eatbay/widgets/big_text.dart';
import 'package:eatbay/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/icon_text_filed.dart';
import '../../widgets/signin_button.dart';
import '../admin/admin_signin_page/admin_signin_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
            IconTextFiield(icon: Icons.email, hintText: "Email"),
            IconTextFiield(icon: Icons.password, hintText: "Password"),
            LoginButton(
              text: "Sign In",
              onClick: () {
                Get.to(AdminSignInPage());
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallText(
                  text: "Don't have any account?",
                  size: 18,
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(SignupPage());
                    },
                    child: BigText(text: " Create")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
