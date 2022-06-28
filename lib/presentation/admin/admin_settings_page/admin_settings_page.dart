import 'package:eatbay/core/colors.dart';
import 'package:eatbay/presentation/admin/admin_pending_orders/admin_pending_orders_page.dart';
import 'package:eatbay/presentation/admin/complaint_ticket/complaint_ticket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/profile_tile.dart';
import '../add_product_page.dart/add_product_page.dart';
import '../delivery_locations/delivery_locations.dart';

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
            ProfileTiles(icon: Icons.add, text: "Add Product", onClick: () {
              Get.to(AddProductPage());
            }),
            ProfileTiles(
                icon: Icons.pending, text: "Orders Pending", onClick: () {
                  Get.to(PendingOrdersPage());
                }),
            ProfileTiles(icon: Icons.done, text: "Delivered", onClick: () {}),
            ProfileTiles(
                icon: Icons.location_on,
                text: "Delivery Locations",
                onClick: () {
                  Get.to(DeliveryLocationPage());
                }),
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
