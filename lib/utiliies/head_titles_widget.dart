import 'package:flutter/material.dart';

class HeadTitleWidget extends StatelessWidget {
  HeadTitleWidget({
    Key key,
    this.leftTitle,
    this.rightTitle,
    this.onTap,
  }) : super(key: key);

  String leftTitle;
  String rightTitle;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftTitle,
            style: TextStyle(fontSize: 20),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              rightTitle,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
    );
  }
}
