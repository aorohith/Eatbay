import 'package:eatbay/views/orders_screen.dart/running_order.dart';
import 'package:flutter/material.dart';

import 'history_page.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
  length: 2,
  child: Scaffold(
    appBar: AppBar(
      title: Text('Orders'),
      bottom: TabBar(
        tabs: [
          Tab(icon: Text("Running")),
          Tab(icon: Text("History")),
        ],
      ),
      
    ),
    body:  const TabBarView(
      children: [
        RunningOrderScreen(),
        HistoryScreen(),
      ],
    ),
  ),
);
    
  }
}