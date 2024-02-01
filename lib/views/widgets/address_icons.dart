import 'package:flutter/material.dart';

class AddressIcons extends StatelessWidget {
  final IconData icon;
  final Color color;

  const AddressIcons({
    Key? key,
    required this.icon,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}