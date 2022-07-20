import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatbay/models/address_model.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  RxList<AddressModel> address = RxList<AddressModel>([]);
  bool isLoading = false;

  List<String> addressType = [
    'Home','Work','Hotel','Other'
  ];
  String currentDropdown = 'Home';
  int newSelectedIndex = 0;
  int prevSelectedIndex = 1;

  changeDropdown(String value){
    currentDropdown = value;
    update();
  }

  @override
  void onReady() {
    address.bindStream(getAddress());
    super.onReady();
  }

  Stream<List<AddressModel>> getAddress() {
    isLoading = true;
    Stream<List<AddressModel>> temp;
    temp = FirebaseFirestore.instance.collection('addresses').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => AddressModel.fromJson(doc.data()))
            .toList());
            log(temp.toString());
    isLoading = false;
    update();
    return temp;
  }
}
