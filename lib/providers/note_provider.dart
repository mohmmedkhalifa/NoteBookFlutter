import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_book/helpers/db_helper.dart';
import 'package:note_book/models/book_model.dart';
import 'package:note_book/models/note_model.dart';

class NoteProvider extends ChangeNotifier {
  List<Note> notes = [];

  insertIntoNoteTable(Note note) async {
    await DBHelper.dbHelper.insertNewNote(note);
    getAllNote();
  }

  // deleteNoteFromTable(Note Note) async {
  //   await DBHelper.dbHelper.deleteBook(book.id);
  //   getAllBook();
  // }

  deleteAllNotes(int id) async {
    await DBHelper.dbHelper.deleteAllNotes(id);
    getAllNote();
  }

  deleteNote(int id) async {
    await DBHelper.dbHelper.deleteNote(id);
    getAllNote();
  }

  editNote(Note note) async {
    await DBHelper.dbHelper.editeNote(note);
    getAllNote();
  }

  getAllNote() async {
    List<Map<String, dynamic>> rows = await DBHelper.dbHelper.getAllNote();
    List<Note> notes =
        rows != null ? rows.map((e) => Note.fromMap(e)).toList() : [];
    fillLists(notes);
  }

  fillLists(List<Note> notes) {
    this.notes = notes;
    notifyListeners();
  }
}
