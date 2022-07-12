import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatbay/models/product_model.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  var isLoading = false;
  RxList<Product> products = RxList<Product>([]);

  @override
  void onInit() {
    products.bindStream(getProducts());
    super.onInit();
  }

  Stream<List<Product>> getProducts() {
    isLoading = true;
    var temp;
    temp = FirebaseFirestore.instance.collection('productlist').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());
    isLoading = false;
    update();
    return temp;
  }
}
