import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_book/models/book_model.dart';
import 'package:note_book/providers/book_provider.dart';
import 'package:note_book/providers/note_provider.dart';
import 'package:note_book/screens/allbooks_page.dart';
import 'package:note_book/screens/allnotes_page.dart';
import 'package:note_book/screens/note_details_page.dart';
import 'package:note_book/utiliies/dialog_widget.dart';
import 'package:note_book/utiliies/edit_widget.dart';
import 'package:note_book/utiliies/head_titles_widget.dart';
import 'package:note_book/utiliies/image_note_widget.dart';
import 'package:note_book/utiliies/note_widget.dart';
import 'package:provider/provider.dart';

import 'notes_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Book book = Book();
  String title;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditWidget(),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              'Browse',
              style: TextStyle(fontSize: 34),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Divider(),
          Column(
            children: [
              HeadTitleWidget(
                leftTitle: 'Notebooks',
                rightTitle: 'Show All',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Allbooks(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return MyDialog();
                          },
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DashedContainer(
                            child: Container(
                              width: 90,
                              height: 120,
                              child: Center(
                                child: Icon(
                                  Icons.add_circle_outline,
                                  color: Theme.of(context).accentColor,
                                  size: 28,
                                ),
                              ),
                            ),
                            dashColor: Theme.of(context).accentColor,
                            dashedLength: 10,
                            strokeWidth: 2,
                            borderRadius: 4,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Create\n Notebook',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline6,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 28,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 145,
                      height: 180,
                      child: Consumer<BookProvider>(
                        builder: (context, value, child) => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: value.books.length,
                          itemBuilder: (context, index) {
                            return ImageNoteWidget(
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
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 26,
          ),
          Column(
            children: [
              HeadTitleWidget(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllNotes(),
                      ));
                },
                leftTitle: 'Notes',
                rightTitle: 'Show All',
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  height: 300,
                  child: Consumer<NoteProvider>(
                    builder: (context, value, child) => ListView.builder(
                      itemCount: value.notes.length,
                      itemBuilder: (context, index) {
                        return value.notes.length == null
                            ? Container()
                            : NoteWidget(
                                onDismissed: (direction) {
                                  value.deleteNote(value.notes[index].id);
                                },
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NoteDetails(
                                          note: value.notes[index],
                                        ),
                                      ));
                                },
                                color: value.notes[index].color,
                                desc: value.notes[index].description,
                                title: value.notes[index].noteTitle,
                              );
                      },
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
