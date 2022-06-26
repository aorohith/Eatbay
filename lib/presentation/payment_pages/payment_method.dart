import 'package:eatbay/core/colors.dart';
import 'package:eatbay/presentation/payment_pages/paypal_login.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Patment Methods",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _paypalButton(context),
          ],
        ),
      ),
    );
  }

  GestureDetector _paypalButton(BuildContext context) {
    return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaypalLoginScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.textColor),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/05/26/09/37/paypal-784404__480.png")),
                ),
              ),
            ),
          );
  }
}
