import 'package:eatbay/core/colors.dart';
import 'package:eatbay/presentation/admin/admin_settings_page/admin_settings_page.dart';
import 'package:eatbay/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              BigText(
                text: "Top Sales",
                size: 22,
              ),
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://wcs.smartdraw.com/chart/img/basic-bar-graph.png?bn=15100111830"))),
              ),
              SizedBox(
                height: 10,
              ),
              _aminDashboardTiles(
                icon: Icons.swipe_up_sharp,
                text: "Total Sails",
                onClick: () {},
              ),
              SizedBox(
                height: 10,
              ),
              _aminDashboardTiles(
                icon: Icons.attach_money_rounded,
                text: "Total Profit",
                onClick: () {},
              ),
              SizedBox(
                height: 10,
              ),
              _aminDashboardTiles(
                icon: Icons.supervised_user_circle_sharp,
                text: "Total Users",
                onClick: () {},
              ),
              SizedBox(
                height: 10,
              ),
              _aminDashboardTiles(
                icon: Icons.settings,
                text: "Settings",
                trailingText: "",
                onClick: () {
                  Get.to(AdminSettingsPage());
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _aminDashboardTiles({
    required IconData icon,
    required String text,
    required Callback onClick,
    Color color = AppColors.mainColor,
    String trailingText = "₹60L",
  }) {
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
