import 'package:eatbay/views/account_page/profile_page.dart';
import 'package:eatbay/views/auth_pages/signin_page/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  //if user blocked by the admin then user should be logged out from any page
  void initial() async {
    _user = Rx<User?>(auth.currentUser); //manual casting
    _user.bindStream(auth.userChanges());
    ever(_user,
        initialScreen); //fire data(_user) change will trigger initialscreen function
  }

  initialScreen(User? user) {
    if (user == null) {
      return SignInPage();
    } else {
      return ProfilePage(); //we can also pass the data of user using user object
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      update();
    } catch (e) {
      Get.snackbar('User', "message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Account creation failed"),
          messageText: Text(e.toString()));
    }
  }

  void signin(String email, password, User? user) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      update();
    } catch (e) {
      Get.snackbar('About Login', "Login message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Login failed"),
          messageText: Text(e.toString()));
    }
  }

  signinWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>['email']).signIn();

    //obtail auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    //create new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    // Get.offAll(BottomNavScreen());
    update();
  }

  signinWithFacebook() async {
    try {
      // Trigger the sign-in flow
      await FacebookAuth.instance.login().then((value) async {
        // Create a credential from the access token
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(value.accessToken!.token);
        // Once signed in, return the UserCredential
        await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
      });
    } catch (e) {}
  }

  void logout() {
    GoogleSignIn().disconnect();
    auth.signOut();
    update();
  }
}
