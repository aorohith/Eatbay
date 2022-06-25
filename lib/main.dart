import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/address_page/address_page.dart';
import 'presentation/orders_screen.dart/orders_screen.dart';

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
        primarySwatch: Colors.blue,
      ),
      home:  AddressPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


