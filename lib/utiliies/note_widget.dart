import 'package:flutter/material.dart';
import 'package:note_book/utiliies/my_container_widget.dart';

class NoteWidget extends StatelessWidget {
  NoteWidget({
    Key key,
    this.title,
    this.desc,
    this.color,
    this.onDismissed,
    this.onTap,
  }) : super(key: key);

  String title;
  String desc;
  int color;
  Function onDismissed;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: onDismissed,
        direction: DismissDirection.horizontal,
        background: MyContainer(
          color: Colors.red,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.delete,
              color: Colors.black,
              size: 45,
            ),
          ),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: MyContainer(
            color: Colors.grey[300],
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
          ),
        ));
  }
}
