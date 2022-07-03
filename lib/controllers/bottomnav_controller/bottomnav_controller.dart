import 'package:get/state_manager.dart';

class BottomnavController extends GetxController{
  var selectedIndex = 0;

  void changeIndex(int index){
    selectedIndex = index;
    update();
  }
}