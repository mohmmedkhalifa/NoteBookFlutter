import 'package:flutter/material.dart';
import 'package:note_book/models/book_model.dart';
import 'package:note_book/providers/book_provider.dart';
import 'package:note_book/utiliies/button_widget.dart';
import 'package:provider/provider.dart';

import 'image_note_widget.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  int checkIndex = 0;
  Color color = Colors.transparent;
  String imageUrl;
  Book book = Book();

  String getBookImages(int i) {
    return 'assets/images/book$i.png';
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Center(
        child: Container(
          padding: EdgeInsets.only(top: 30),
          width: 330,
          height: 700,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: (value) {
                    book.title = value.trim();
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter Title of Book',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 5,
                  padding: EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.6,
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 6,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {});
                        checkIndex = index;
                        book.imageUrl = getBookImages(index + 1);
                      },
                      child: Container(
                        color: checkIndex == index
                            ? Colors.black12
                            : Colors.transparent,
                        child: ImageNoteWidget(
                          imageUrl: getBookImages(index + 1),
                          bookTitle: '',
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ButtonWidget(
                title: 'Add Book',
                onTap: () {
                  context.read<BookProvider>().insertIntoBookTable(book);
                  Navigator.of(context).pop();
                },
              ), SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
