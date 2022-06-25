import 'package:eatbay/core/colors.dart';
import 'package:eatbay/presentation/orders_screen.dart/running_order.dart';
import 'package:flutter/material.dart';

import 'history_page.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
  length: 2,
  child: Scaffold(
    appBar: AppBar(
      backgroundColor: AppColors.mainColor,
      title: Text('Orders'),
      centerTitle: true,
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