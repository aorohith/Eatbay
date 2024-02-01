import 'package:eatbay/models/address_model.dart';
import 'package:eatbay/models/cart_model.dart';

class OrderModel {
  String id;
  double amount;
  List<Cart> cartProducts;
  DateTime dateTime;
  String paymentType;
  String status;
  AddressModel address;

  OrderModel({
    this.id = '',
    required this.amount,
    required this.cartProducts,
    required this.dateTime,
    required this.paymentType,
    required this.status,
    required this.address,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'amount': amount,
        'cart_products': cartProducts.map((cart) => cart.toJson()).toList(),
        'date_time': dateTime,
        'payment_type': paymentType,
        'status': status,
        'address': address.toJson(),
      };

  static OrderModel fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'],
        amount: json['amount'],
        cartProducts: (json['cart_products'] as List<Cart>?)
                ?.map((e) => Cart.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
        dateTime: json['date_time'],
        paymentType: json['payment_type'],
        status: json['status'],
        address: AddressModel.fromJson(json['address']),
      );
}
