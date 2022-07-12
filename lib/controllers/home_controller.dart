import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatbay/models/cart_model.dart';
import 'package:eatbay/models/product_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = false;
  RxList<Product> products = RxList<Product>([]);
  var quantity = 1.obs;
  final firebaseInstance = FirebaseFirestore.instance;

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

//add product from popular detail section
  addToCart(Cart cart) async{
    isLoading = true;
    try {
      final docUser = firebaseInstance.collection('cartproducts').doc();
      cart.id = docUser.id;
      final json = cart.toJson();
      var response = await docUser.set(json);
      Get.snackbar(
        "title",
        "Product Added",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (exception) {
      Get.snackbar(
        "title",
        exception.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isLoading = false;
    update();
  }
  sample(){
    final docUser = firebaseInstance.collection('cartproducts').doc();
    print(docUser.snapshots());
  }
}
