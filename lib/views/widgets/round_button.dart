import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class RoundButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Color iconColor;
  final Callback onClick;

  const RoundButton({
    super.key,
    this.color = const Color(0xffffffff),
    required this.icon,
    this.iconColor = Colors.white,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: color,
      child: IconButton(
        onPressed: onClick,
        icon: Icon(icon, color: iconColor),
        splashRadius: 30,
      ),
    );
  }
}
