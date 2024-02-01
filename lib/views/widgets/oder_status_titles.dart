import 'package:eatbay/views/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderStatusWidget extends StatelessWidget {
  final String text;
  final bool isLast;
  final bool isStart;
  final Color ballColor;
  final Color beforeLineColor;
  final Color afterLineColor;

  const OrderStatusWidget({
    super.key,
    required this.text,
    this.isLast = false,
    this.isStart = false,
    this.ballColor = Colors.grey,
    this.beforeLineColor = Colors.grey,
    this.afterLineColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: 30,
          height: 120,
          child: TimelineTile(
            indicatorStyle: IndicatorStyle(
              color: ballColor,
              height: 30,
              width: 30,
            ),
            isFirst: isStart,
            isLast: isLast,
            beforeLineStyle: LineStyle(color: beforeLineColor),
            afterLineStyle: LineStyle(color: afterLineColor),
          ),
        ),
        Container(
          height: 100,
          width: w * .8,
          decoration: const BoxDecoration(
            boxShadow: [],
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigText(text: text),
              ],
            ),
          ),
        )
      ],
    );
  }
}
