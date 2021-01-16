import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  Widget child;
  Color color;
  MyContainer({this.child, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: double.infinity,
      height: 80,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.only(left: 12, top: 12, right: 12),
    );
  }
}
