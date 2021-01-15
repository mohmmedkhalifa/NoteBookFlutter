import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_book/models/book_model.dart';
import 'package:note_book/providers/note_provider.dart';
import 'package:note_book/screens/add_note_page.dart';
import 'package:note_book/utiliies/edit_widget.dart';
import 'package:note_book/utiliies/note_widget.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  Book book;

  NotePage(this.book);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNote(widget.book),
              ));
        },
      ),
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
              widget.book.title,
              style: TextStyle(fontSize: 34),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: MediaQuery.of(context).size.height - 113,
              child: Consumer<NoteProvider>(
                builder: (context, value, child) => ListView.builder(
                  itemCount: value.notes.length,
                  itemBuilder: (context, index) {
                    return value.notes.length != null
                        ? value.notes[index].bookId == widget.book.id
                            ? NoteWidget(
                                color: value.notes[index].color,
                                desc: value.notes[index].description,
                                title: value.notes[index].noteTitle,
                              )
                            : Container()
                        : Container();
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
