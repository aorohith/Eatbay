import 'package:eatbay/core/colors.dart';
import 'package:eatbay/presentation/bottom_nav_bar/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          
          color: AppColors.mainColor,
          centerTitle: true,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
