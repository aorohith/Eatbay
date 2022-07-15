import 'package:eatbay/models/product_model.dart';

class Cart {
  String id;
  final Product product;
  int quantity;
  final String userId;
  final double totalPrice;

  Cart({
    this.id = '',
    required this.product,
    required this.quantity,
    required this.userId,
    required this.totalPrice,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product.toJson(),
        'quantity': quantity,
        'user_id': userId,
        'total_price': totalPrice,
      };

  static Cart fromJson(Map<String, dynamic> json) => Cart(
        id: json['id'],
        product: Product.fromJson(json['product']),
        quantity: json['quantity'],
        userId: json['user_id'],
        totalPrice: json['total_price'],
      );
}
