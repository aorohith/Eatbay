import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatbay/models/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  bool isLoading = false;
  RxList<Cart> cartProducts = RxList<Cart>([]);

  @override
  void onInit() {
    cartProducts.bindStream(getCartProducts());
    super.onInit();
  }

  Stream<List<Cart>> getCartProducts() {
    isLoading = true;
    var temp;
    temp = FirebaseFirestore.instance
        .collection('cartproducts')
        .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Cart.fromJson(doc.data())).toList());
    isLoading = false;
    update();
    return temp;
  }
}
