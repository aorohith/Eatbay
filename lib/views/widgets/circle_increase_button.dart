import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class IncreaseButton extends StatelessWidget {
  IconData icon;
  Callback onClick;
  Color iconColor;
  IncreaseButton({
    Key? key,
    required this.icon,
    this.iconColor = Colors.black,
    required this.onClick
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Color(0xff94d500),
      child: IconButton(
        icon: Icon(
          icon,
          color: iconColor,
        ),
        onPressed: onClick,
      ),
    );
  }
}
