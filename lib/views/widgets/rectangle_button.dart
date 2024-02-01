import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'big_text.dart';

class RectangleButton extends StatelessWidget {
  final BuildContext context;
  final String text;
  final Color bgColor;
  final Color textColor;
  final Callback onClick;

  const RectangleButton({
    super.key,
    required this.text,
    this.bgColor = const Color(0xFF42A5F5),
    this.textColor = const Color(0xffffffff),
    required this.context,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: bgColor),
        onPressed: onClick,
        child: BigText(
          text: text,
          color: textColor,
        ),
      ),
    );
  }
}
