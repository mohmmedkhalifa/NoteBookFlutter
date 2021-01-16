import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_book/models/note_model.dart';
import 'package:note_book/providers/note_provider.dart';
import 'package:provider/provider.dart';

class NoteDetails extends StatefulWidget {
  Note note;
  NoteDetails({this.note});

  @override
  _NoteDetailsState createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  bool edit = false;

  Icon icon = Icon(Icons.edit);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      backgroundColor: Color(widget.note.color),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              icon: icon,
              onPressed: () {
                setState(() {
                  edit == false
                      ? icon = Icon(Icons.save)
                      : icon = Icon(Icons.edit);
                  edit == true
                      ? context.read<NoteProvider>().editNote(widget.note)
                      : print('done');
                  edit = !edit;
                  print(edit);
                });
              })
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: edit
                ? TextFormField(
                    initialValue: widget.note.noteTitle,
                    onChanged: (value) {
                      widget.note.noteTitle = value;
                    },
                  )
                : Text(
                    widget.note.noteTitle,
                    style: TextStyle(fontSize: 26),
                  ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(18),
            child: edit
                ? TextFormField(
                    maxLines: 24,
                    initialValue: widget.note.description,
                    onChanged: (value) {
                      widget.note.description = value;
                    },
                  )
                : Text(
                    widget.note.description,
                    maxLines: 24,
                    style: TextStyle(fontSize: 16),
                  ),
          ),
        ],
      ),
    );
  }
}
