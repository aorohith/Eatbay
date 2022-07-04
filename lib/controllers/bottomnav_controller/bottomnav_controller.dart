import 'package:eatbay/controllers/auth_controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class BottomnavController extends GetxController{
  AuthController authController = Get.put(AuthController());
  var selectedIndex = 0;

  void changeIndex(int index){
    selectedIndex = index;
    update();
  }
}