import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatbay/models/cart_model.dart';
import 'package:eatbay/services/firestore_db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  bool isLoading = false;
  RxList<Cart> cartProducts = RxList<Cart>([]);
  late Cart currentCartProduct;
  var temperory = 0.obs;
  final firebaseInstance = FirebaseFirestore.instance;
  var cartGrandTotal=0.0.obs;

  @override
  onInit() {
    if (FirebaseAuth.instance.currentUser != null) {
      try {
      isLoading = true;
        cartProducts.bindStream(FirestoreDB().getCartProducts());
      } catch (e) {
        Get.snackbar("Error", "An error Occured ${e.toString()}");
      }
    }
      isLoading = false;
    super.onInit();
  }


  initialGrandTotal() {
    cartProducts.map((element) {
      cartGrandTotal.value =
          cartGrandTotal.value + element.quantity * element.product.price;
    });
     update();
  }

  incrementCount(Cart cart) {
    currentCartProduct = cart;
    cart.quantity++;
    cart.totalPrice = cart.quantity * cart.product.price;
    temperory.value = cart.quantity;
    cartGrandTotal.value = cartGrandTotal.value + cart.product.price;
    // debounce(temperory, (value) {
    //   updateData(value);
    // });
    update();
  }

  decrementCount(Cart cart) {
    currentCartProduct = cart;
    if (cart.quantity > 1) {
      cart.quantity--;
      cart.totalPrice = cart.quantity * cart.product.price;
      temperory.value = cart.quantity;
      cartGrandTotal.value = cartGrandTotal.value - cart.product.price;
      // debounce(temperory, (value) {
      //   updateData(value);
      // });
    } else {
      Get.snackbar("title", "Cannot be less than 1");
    }

    update();
  }

  getCartTotal() {
    cartProducts.value.map((e) {
      cartGrandTotal.value=  cartGrandTotal.value + e.quantity * e.product.price;
    });
  }

  updateData(value) {
    final doc =
        firebaseInstance.collection('cartproducts').doc(currentCartProduct.id);
    doc.update({
      'quantity': value,
      'total_price': currentCartProduct.totalPrice
    });
    print('Done');
  }
 
}
