import 'package:flutter/material.dart';
class EditWidget extends StatelessWidget {
   EditWidget({
    Key key,
     this.onPressed
  }) : super(key: key);

  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).accentColor,
              size: 24,
            ),
            onPressed: onPressed,
          ),
          Text(
            'Edit',
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
    );
  }
}