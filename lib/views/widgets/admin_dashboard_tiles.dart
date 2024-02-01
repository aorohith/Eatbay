import 'package:eatbay/views/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class AdminDashboardTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Callback onClick;
  final Color color;
  final String trailingText;
  const AdminDashboardTile({
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
        height: 50,
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
                  const SizedBox(width: 20),
                  Text(text,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                ],
              ),
              Text(
                trailingText,
                style: const TextStyle(
                  fontSize: 20,
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
