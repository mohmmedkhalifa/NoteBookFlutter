import 'package:flutter/material.dart';

class ImageNoteWidget extends StatelessWidget {
  ImageNoteWidget({
    Key key,
    this.imageUrl,
    this.bookTitle,
    this.onTap,
  }) : super(key: key);

  String imageUrl;
  String bookTitle;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 100,
        height: 164,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              bookTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
