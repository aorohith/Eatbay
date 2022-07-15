import 'package:eatbay/controllers/auth_controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller.authController.initialScreen(FirebaseAuth.instance.currentUser);

    return Scaffold(
      body: GetBuilder<AuthController>(builder: (controller) {
        return controller.initialScreen(FirebaseAuth.instance.currentUser);
      }),
    );
  }
}
