import 'package:eatbay/views/widgets/oder_status_titles.dart';
import 'package:flutter/material.dart';

class RunningOrderDetailsPage extends StatelessWidget {
  const RunningOrderDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("order_id #92387"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              OrderStatusWidget(
                  text: "Chicken Biriyani Ordered",
                  ballColor: Colors.green,
                  afterLineColor: Colors.green,
                  beforeLineColor: Colors.green),
              OrderStatusWidget(
                text: "Chicken Biriyani Prepared",
                beforeLineColor: Colors.green,
                ballColor: Colors.green,
              ),
              OrderStatusWidget(text: "Chicken Biriyani On the way"),
              OrderStatusWidget(
                text: "Chicken Biriyani Delivered",
                isLast: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


