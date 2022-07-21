import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatbay/models/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  bool isLoading = false;
  RxList<Cart> cartProducts = RxList<Cart>([]);
  late Cart currentCartProduct;
  var temperory = 0.obs;
  final firebaseInstance = FirebaseFirestore.instance;


  @override
  onInit() {
    if (FirebaseAuth.instance.currentUser != null) {
      cartProducts.bindStream(getCartProducts());
      debounce(temperory, (value) {
        updateData(value);
      });
    }
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

  incrementCount(Cart cart) {
    cart.quantity++;
    cart.totalPrice = cart.quantity * cart.product.price;
    temperory.value = cart.quantity;
    update();
  }

  decrementCount(Cart cart) {
    if (cart.quantity > 1) {
      cart.quantity--;
      cart.totalPrice = cart.quantity * cart.product.price;
    } else {
      Get.snackbar("title", "Cannot be less than 1");
    }
    update();
  }

  updateData(value){
    print(value);
     final doc = firebaseInstance
            .collection('cartproducts')
            .doc(currentCartProduct.id);
        doc.update({
          'quantity':
              value,
        });
        print('Done');
  }
}
