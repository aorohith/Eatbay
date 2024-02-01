import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatbay/controllers/bottom_nav_controller/bottom_nav_controller.dart';
import 'package:eatbay/controllers/cart_controller.dart';
import 'package:eatbay/services/cart_apis.dart';
import 'package:eatbay/models/cart_model.dart';
import 'package:eatbay/models/product_model.dart';
import 'package:eatbay/services/firestore_db.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final cartController = Get.find<CartController>();
  final bottomNavController = Get.find<BottomNavController>();

  var isLoading = false;
  RxList<Product> products = RxList<Product>([]);
  var quantity = 1.obs;
  final firebaseInstance = FirebaseFirestore.instance;

  @override
  void onInit() {
    try {
      isLoading = true;
      products.bindStream(FirestoreDB().getProducts());
    } catch (e) {
      Get.snackbar("Error", "An error Occured ${e.toString()}");
    }
    isLoading = false;
    super.onInit();
  }

 

//add product from popular detail section
  addToCart(Cart cart) async {
    isLoading = true;
    try {
      bool isEmpty = await checkUserCartIsEmpty(cart);
      // log(isEmpty.toString());
      if (isEmpty) {
        final doc = firebaseInstance.collection('cartproducts').doc();
        cart.id = doc.id;
        final json = cart.toJson();
        await doc.set(json);
        Get.snackbar(
          "Hurray!!",
          "Product Added to cart",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        final doc = firebaseInstance
            .collection('cartproducts')
            .doc(cartController.currentCartProduct.id);
        doc.update({
          'quantity':
              cart.quantity + cartController.currentCartProduct.quantity,
        });
        Get.snackbar(
          "Hurray!!",
          "Product Added to cart",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (exception) {
      Get.snackbar(
        "Error occured",
        exception.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isLoading = false;
    update();
  }
}
