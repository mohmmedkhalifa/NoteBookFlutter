import 'package:flutter/material.dart';


class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    Key key,
    this.title,
    this.onTap,
  }) : super(key: key);

  String title;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 40,
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xff7B1E58),
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
    );
  }
}
