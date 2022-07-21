import 'package:eatbay/controllers/auth_controller/auth_controller.dart';
import 'package:eatbay/controllers/cart_controller.dart';
import 'package:get/get.dart';

class BottomnavController extends GetxController{
  AuthController authController = Get.put(AuthController());
  CartController cartController = Get.put(CartController());
  var selectedIndex = 0;

  void changeIndex(int index){
    selectedIndex = index;
    if(index==2){
      cartController.initialGrandTotal();
    }
    update();
  }
}