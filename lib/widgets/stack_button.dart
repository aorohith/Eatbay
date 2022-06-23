import 'package:flutter/material.dart';

class StackButton extends StatelessWidget {
  Color color;
  IconData icon;

  StackButton({
    Key? key,
    this.color = const Color(0xffffffff),
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: color,
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon),
        splashRadius: 30,
      ),
    );
  }
}
