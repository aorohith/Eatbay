import 'package:eatbay/controllers/bottom_nav_controller/bottom_nav_controller.dart';
import 'package:eatbay/controllers/cart_controller.dart';
import 'package:eatbay/controllers/home_controller.dart';
import 'package:eatbay/controllers/orders_controller.dart';
import 'package:get/instance_manager.dart';

class BottomNavBinding extends Bindings{
  @override
  void dependencies() {//dependency are the controllers created for other pages
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<OrdersController>(() => OrdersController());
    Get.lazyPut<CartController>(() => CartController());
    // Get.lazyPut<AuthController>(() => AuthController());

  }

}