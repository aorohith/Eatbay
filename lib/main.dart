import 'package:eatbay/controllers/bottomnav_controller/bottomnav_binding.dart';
import 'package:eatbay/views/bottom_nav_bar/bottom_nav.dart';
import 'package:eatbay/views/widgets/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: AppColors.mainColor,
          centerTitle: true,
        ),
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => BottomNavScreen(),
          binding: BottomnavBinding(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
