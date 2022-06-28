import 'package:eatbay/widgets/big_text.dart';
import 'package:eatbay/widgets/small_text.dart';
import 'package:flutter/material.dart';

class HistoryDetailPage extends StatelessWidget {
  const HistoryDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Summary"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BigText(text: "Old Madras Bites"),
              Text("48, Enfield Avenue 3rd Street, Ambedkar Salai, Chennai"),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                SmallText(text: "This order was delivered"),
                TextButton(onPressed: (){}, child: Text("Buy Again")),
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: 'Your Order'),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("PineApple juice X 2"),
                  Text("₹80"),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Orange juice X 2"),
                  Text("₹80"),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text("Items in total"),
                  Text("₹160"),
                ],
              ),
              Row(
                children: [Text("Delivery Charge"), Text("₹20")],
              ),
              Divider(),
              Row(
                children: [Text("Grand Total"), Text("₹180")],
              ),
              Divider(),
              BigText(
                text: "Order Details",
              ),
              Divider(),
              SmallText(text: "Order Number"),
              Text("1054555"),
            ],
          ),
        ),
      ),
    );
  }
}
