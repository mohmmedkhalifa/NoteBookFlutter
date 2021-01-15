import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_book/models/book_model.dart';
import 'package:note_book/models/note_model.dart';
import 'package:note_book/providers/note_provider.dart';
import 'package:provider/provider.dart';
import 'package:note_book/utiliies/textField_widget.dart';

import '../my_colors.dart';

class AddNote extends StatefulWidget {
  Book book;
  AddNote(this.book);
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  Note note = Note();
  int currentIndex;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 8,
          ),
          TextFieldWidget(
            labelText: 'Title',
            onChanged: (value) {
              note.noteTitle = value;
            },
          ),
          TextFieldWidget(
            labelText: 'Deception ...',
            maxLines: 18,
            onChanged: (value) {
              note.description = value;
            },
          ),
          Container(
            width: double.infinity,
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: colors.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  currentIndex = index;
                  setState(() {});
                },
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index ? Colors.black12 : null,
                  ),
                  child: Container(
                    margin: EdgeInsets.all(16),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: RaisedButton(
                onPressed: () {
                  note.bookId = widget.book.id;
                  note.color = colors[currentIndex].value;
                  print(note.color);
                  context.read<NoteProvider>().insertIntoNoteTable(note);
                  Navigator.pop(context);
                },
                padding: EdgeInsets.all(16),
                color: Theme.of(context).accentColor,
                elevation: 6,
                child: Text(
                  'Add Note',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
