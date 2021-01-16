import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    Key key,
    this.labelText,
    this.onChanged,
    this.maxLines,
  }) : super(key: key);

  String labelText;
  Function onChanged;
  int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).accentColor,
                style: BorderStyle.solid,
                width: 2),
            borderRadius: BorderRadius.circular(16),
            gapPadding: 16,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
