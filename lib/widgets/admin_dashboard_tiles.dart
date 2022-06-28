import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../core/colors.dart';
import 'big_text.dart';

class AdminDashboardTile extends StatelessWidget {
  IconData icon;
  String text;
  Callback onClick;
  Color color;
  String trailingText;
  AdminDashboardTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClick,
    this.color = AppColors.mainColor,
    this.trailingText = "₹60L",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 10,
            left: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: color,
                    radius: 30,
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 20),
                  BigText(text: text),
                ],
              ),
              Text(
                trailingText,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
