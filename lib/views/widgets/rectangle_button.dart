import 'package:eatbay/views/payment_pages/payment_success_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'big_text.dart';

class RectangleButton extends StatelessWidget {
  BuildContext context;
  String text;
  Color bgColor;
  Color textColor;
  Callback onClick;

  RectangleButton({
    Key? key,
    required this.text,
    this.bgColor = const Color(0xFF42A5F5),
    this.textColor = const Color(0xffffffff),
    required this.context,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: bgColor),
        onPressed: onClick,
        child: BigText(
          text: text,
          color: textColor,
        ),
      ),
    );
  }
}
