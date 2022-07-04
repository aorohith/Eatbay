import 'package:eatbay/controllers/auth_controller/auth_controller.dart';
import 'package:eatbay/views/auth_pages/signup_page.dart/signup.dart';
import 'package:eatbay/views/widgets/big_text.dart';
import 'package:eatbay/views/widgets/core/constant.dart';
import 'package:eatbay/views/widgets/icon_text_filed.dart';
import 'package:eatbay/views/widgets/signin_button.dart';
import 'package:eatbay/views/widgets/signup_or_signin_with.dart';
import 'package:eatbay/views/widgets/small_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
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
            h30,
            IconTextFiield(
              icon: Icons.email,
              hintText: "Email",
              controller: emailController,
            ),
            IconTextFiield(
              icon: Icons.password,
              hintText: "Password",
              controller: passwordController,
              obscureText: true,
            ),
            LoginButton(
              text: "Sign In",
              onClick: () {
                AuthController.instance.signin(
                  emailController.text,
                  passwordController.text,
                  FirebaseAuth.instance.currentUser,
                );
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
            ),
            h30,
            AuthWithButton(),
          ],
        ),
      ),
    );
  }
}
