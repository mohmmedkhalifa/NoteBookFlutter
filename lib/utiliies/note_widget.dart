import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  NoteWidget({
    Key key,
    this.title,
    this.desc,
    this.color,
  }) : super(key: key);

  String title;
  String desc;
  int color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.only(left: 12, top: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(color),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            desc,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
