import 'package:eatbay/views/account_page/profile_page.dart';
import 'package:eatbay/views/signin_page/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser); //manual casting
    _user.bindStream(auth.userChanges());
    ever(_user, initialScreen);//fire data(_user) change will trigger initialscreen function
  }

  initialScreen(User? user) {
    if (user == null) {
      return SignInPage();
    }else{
      return ProfilePage();//we can also pass the data of user using user object
    }
  }

  void register(String email, password) async{
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar('User', "message",
      snackPosition: SnackPosition.BOTTOM,
      titleText: Text("Account creation failed"),
      messageText: Text(e.toString())
      );
    }
  }
  void signin(String email, password) async{
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar('About Login', "Login message",
      snackPosition: SnackPosition.BOTTOM,
      titleText: Text("Login failed"),
      messageText: Text(e.toString())
      );
    }
  }
  void logout(){
    auth.signOut();
  }
}
