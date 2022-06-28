import 'package:eatbay/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderStatus extends StatelessWidget {
  String text;
  bool isLast;
  bool isStart;
  Color ballColor;
  Color beforeLineColor;
  Color afterLineColor;

  OrderStatus({
    Key? key,
    required this.text,
    this.isLast = false,
    this.isStart = false,
    this.ballColor = Colors.grey,
    this.beforeLineColor = Colors.grey,
    this.afterLineColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
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
          width: _w * .8,
          decoration: BoxDecoration(
            boxShadow: [
              
            ],
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