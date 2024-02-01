import 'package:eatbay/controllers/bottom_nav_controller/bottom_nav_controller.dart';
import 'package:eatbay/views/auth_pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import '../cart/cart_screen.dart';
import '../home/main_food_page.dart';
import '../orders_screen.dart/orders_screen.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(builder: (controller) {
      return Scaffold(
        body: Center(
            child: IndexedStack(
          index: controller.selectedIndex,
          children: [
            const MainFoodPage(),
            const OrdersPage(),
            CartScreen(),
            AuthPage()
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.offline_pin_sharp),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: controller.selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (index) => controller.changeIndex(index),
        ),
      );
    });
  }
}
