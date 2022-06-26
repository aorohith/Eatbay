import 'package:eatbay/core/colors.dart';
import 'package:eatbay/presentation/admin/complaint_ticket/complaint_ticket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/profile_tile.dart';

class AdminSettingsPage extends StatelessWidget {
  const AdminSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ProfileTiles(icon: Icons.add, text: "Add Product", onClick: () {}),
            ProfileTiles(
                icon: Icons.pending, text: "Orders Pending", onClick: () {}),
            ProfileTiles(icon: Icons.done, text: "Delivered", onClick: () {}),
            ProfileTiles(
                icon: Icons.location_on,
                text: "Delivery Locations",
                onClick: () {}),
            ProfileTiles(
              icon: Icons.feedback,
              text: "Feedbacks",
              onClick: () {
                Get.to(AdminComplaintPage());
              },
            ),
            ProfileTiles(
              icon: Icons.exit_to_app,
              text: "Logout",
              onClick: () {},
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
