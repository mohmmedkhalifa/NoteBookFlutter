import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_book/providers/book_provider.dart';
import 'package:note_book/providers/note_provider.dart';
import 'package:note_book/utiliies/image_note_widget.dart';
import 'package:provider/provider.dart';

import 'notes_page.dart';

class Allbooks extends StatefulWidget {
  @override
  _AllbooksState createState() => _AllbooksState();
}

class _AllbooksState extends State<Allbooks> {
  String title;
  int checkIndex;

  Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 12),
            child: Text(
              'Notebooks',
              style: TextStyle(fontSize: 34),
            ),
          ),
          Consumer<BookProvider>(
            builder: (context, value, child) => Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 108,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  crossAxisCount: 3,
                  childAspectRatio: 0.72,
                ),
                itemCount: value.books.length,
                itemBuilder: (context, index) => GestureDetector(
                  onLongPress: () {
                    setState(() {});
                    checkIndex = index;
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ImageNoteWidget(
                        imageUrl: value.books[index].imageUrl,
                        bookTitle: value.books[index].title,
                        onTap: () {
                          title = value.books[index].title;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NotePage(value.books[index]),
                            ),
                          );
                        },
                      ),
                      checkIndex == index
                          ? Card(
                              color: Colors.transparent,
                              elevation: 6,
                              child: Center(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    size: 44,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        elevation: 6,
                                        title: Text('Are you sure?'),
                                        content: Text(
                                            'Are you sure to delete the book and its contents?'),
                                        actions: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.done,
                                              size: 24,
                                            ),
                                            onPressed: () {
                                              context
                                                  .read<BookProvider>()
                                                  .deleteBookFromTable(
                                                      value.books[index]);
                                              context
                                                  .read<NoteProvider>()
                                                  .deleteAllNotes(
                                                      value.books[index].id);
                                              Navigator.pop(context);
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.close,
                                              size: 24,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
