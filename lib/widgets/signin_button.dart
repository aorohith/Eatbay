import 'package:flutter/material.dart';

import '../core/colors.dart';

class LoginButton extends StatelessWidget {
  String text;
   LoginButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.mainColor,
      ),
      child:  Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
