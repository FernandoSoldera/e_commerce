import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  String title;

  TabItem({this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
