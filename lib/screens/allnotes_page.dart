import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_book/providers/note_provider.dart';
import 'package:note_book/screens/note_details_page.dart';
import 'package:note_book/utiliies/note_widget.dart';
import 'package:provider/provider.dart';

class AllNotes extends StatefulWidget {
  @override
  _AllNotesState createState() => _AllNotesState();
}

class _AllNotesState extends State<AllNotes> {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 12),
              child: Text(
                'Notes',
                style: TextStyle(fontSize: 34),
              ),
            ),
            Consumer<NoteProvider>(
              builder: (context, value, child) => Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 108,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: value.notes.length,
                  itemBuilder: (context, index) => NoteWidget(
                    title: value.notes[index].noteTitle,
                    color: value.notes[index].color,
                    desc: value.notes[index].description,
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
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
