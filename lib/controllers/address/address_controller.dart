import 'package:eatbay/models/address_model.dart';
import 'package:eatbay/services/firestore_db.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  var address = <AddressModel>[].obs;
  bool isLoading = false;
  var selectedIndex = 0.obs;
  late AddressModel selectedAddress;

  List<String> addressType = ['Home', 'Work', 'Hotel', 'Other'];

  String currentDropdown = 'Home';
  int newSelectedIndex = 0;
  int prevSelectedIndex = 1;

  @override
  void onInit() {
    try {
      isLoading = true;
      address.bindStream(FirestoreDB().getAddress());
    } catch (e) {
      Get.snackbar("Error", "An error Occured ${e.toString()}");
    }
    isLoading = false;
    selectedAddress = address.first;
    super.onInit();
  }

  changeDropdown(String value) {
    currentDropdown = value;
    update();
  }

  selectAddress({required int index, required AddressModel address}) {
    selectedIndex.value = index;
    selectedAddress = address;
  }
}
