import 'package:eatbay/controllers/auth_controller/auth_controller.dart';
import 'package:eatbay/views/widgets/big_text.dart';
import 'package:eatbay/views/widgets/icon_text_filed.dart';
import 'package:eatbay/views/widgets/signin_button.dart';
import 'package:eatbay/views/widgets/signup_or_signin_with.dart';
import 'package:eatbay/views/widgets/small_text.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            IconTextField(
              icon: Icons.email,
              hintText: "Email",
              controller: emailController,
            ),
            IconTextField(
              icon: Icons.password,
              hintText: "Password",
              controller: passwordController,
              obscureText: true,
            ),
            IconTextField(
                icon: Icons.perm_phone_msg_rounded,
                hintText: "Phone",
                controller: emailController),
            IconTextField(
                icon: Icons.person,
                hintText: "Name",
                controller: emailController),
            LoginButton(
              text: "Sign UP",
              onClick: () {
                AuthController.instance.register(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const BigText(
              text: "Have an account?",
              size: 20,
            ),
            const SizedBox(
              height: 30,
            ),
            SmallText(
              text: "Sign up using one of the following methods",
              size: 16,
            ),
            const SizedBox(
              height: 10,
            ),
            const AuthWithButton(),
          ],
        ),
      ),
    );
  }
}
