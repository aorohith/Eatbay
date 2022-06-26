import 'package:eatbay/core/colors.dart';
import 'package:eatbay/widgets/small_text.dart';
import 'package:flutter/material.dart';
import '../../widgets/big_text.dart';
import '../../widgets/rectangle_button.dart';
import 'payment_success_page.dart';

class PaypalLoginScreen extends StatelessWidget {
  const PaypalLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paypal"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/05/26/09/37/paypal-784404__480.png"),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.remove_red_eye)),
              ),
              SizedBox(
                height: 40,
              ),
              RectangleButton(text: "Login", context: context),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Forgot password?",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SmallText(
                text: "or",
                size: 18,
              ),
              const SizedBox(
                height: 30,
              ),
              RectangleButton(
                  text: "Create an Account",
                  bgColor: const Color.fromARGB(255, 231, 230, 230),
                  textColor: Colors.black,
                  context: context),
            ],
          ),
        ),
      ),
    );
  }
}
