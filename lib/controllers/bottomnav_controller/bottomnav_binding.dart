import 'package:eatbay/controllers/auth_controller/auth_controller.dart';
import 'package:eatbay/controllers/bottomnav_controller/bottomnav_controller.dart';
import 'package:eatbay/controllers/cart_controller.dart';
import 'package:eatbay/controllers/home_controller.dart';
import 'package:eatbay/controllers/orders_controller.dart';
import 'package:get/instance_manager.dart';

class BottomnavBinding extends Bindings{
  @override
  void dependencies() {//dependencys are the controllers created for other pages
    Get.lazyPut<BottomnavController>(() => BottomnavController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<OrdersController>(() => OrdersController());
    Get.lazyPut<CartController>(() => CartController());
    // Get.lazyPut<AuthController>(() => AuthController());

  }

}