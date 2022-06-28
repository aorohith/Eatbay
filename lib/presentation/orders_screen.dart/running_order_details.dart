import 'package:flutter/material.dart';
import '../../widgets/oder_status_titles.dart';

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
              OrderStatus(
                  text: "Chicken Biriyani Ordered",
                  ballColor: Colors.green,
                  afterLineColor: Colors.green,
                  beforeLineColor: Colors.green),
              OrderStatus(
                text: "Chicken Biriyani Prepared",
                beforeLineColor: Colors.green,
                ballColor: Colors.green,
              ),
              OrderStatus(text: "Chicken Biriyani On the way"),
              OrderStatus(
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


