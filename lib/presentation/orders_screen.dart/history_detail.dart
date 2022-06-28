import 'package:eatbay/widgets/big_text.dart';
import 'package:eatbay/widgets/small_text.dart';
import 'package:flutter/material.dart';

class HistoryDetailPage extends StatelessWidget {
  const HistoryDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Summary"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BigText(text: "Old Madras Bites"),
              const Text("48, Enfield Avenue 3rd Street, Ambedkar Salai, Chennai"),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                SmallText(text: "This order was delivered"),
                TextButton(onPressed: (){}, child: const Text("Buy Again")),
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: 'Your Order'),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("PineApple juice X 2"),
                  const Text("₹80"),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Orange juice X 2"),
                  const Text("₹80"),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  const Text("Items in total"),
                  const Text("₹160"),
                ],
              ),
              Row(
                children: [const Text("Delivery Charge"), const Text("₹20")],
              ),
              const Divider(),
              Row(
                children: [const Text("Grand Total"), const Text("₹180")],
              ),
              const Divider(),
              BigText(
                text: "Order Details",
              ),
              const Divider(),
              SmallText(text: "Order Number"),
              const Text("1054555"),
            ],
          ),
        ),
      ),
    );
  }
}
