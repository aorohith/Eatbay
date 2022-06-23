import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/recomended_detail/recomended_detail.dart';

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
      home: const RecomendDetail(),
      debugShowCheckedModeBanner: false,
    );
  }
}


