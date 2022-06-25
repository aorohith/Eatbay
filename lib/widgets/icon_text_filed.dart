import 'package:flutter/material.dart';

class IconTextFiield extends StatelessWidget {
  IconData icon;
  String hintText;
  IconTextFiield({
    Key? key,
    required this.icon,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
