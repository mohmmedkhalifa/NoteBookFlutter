import 'dart:io';

import 'package:note_book/models/book_model.dart';
import 'package:note_book/models/note_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static DBHelper dbHelper = DBHelper._();
  static final String dbName = 'noteApp.db';

  ///////////// Book Table
  static final String bookTable = 'bookTable';
  static final String bookTableId = 'bookId';
  static final String bookTableImageUrl = 'imageUrl';
  static final String bookTableTitle = 'bookTitle';

  ///////////// Note Table
  static final String noteTable = 'noteTable';
  static final String noteTableId = 'noteId';
  static final String noteTableTitle = 'noteTitle';
  static final String noteTableDesc = 'noteDesc';
  static final String noteTableColor = 'noteColor';
  static final String noteTableBookId = 'bookId';

  /////////////
  Database database;

  initializeTasksDatabase() async {
    if (database == null) {
      database = await connectToDatabase();
    }
  }

  Future<Database> connectToDatabase() async {
    Directory pathDirectory = await getApplicationDocumentsDirectory();
    String databasePath = join(pathDirectory.path, dbName);
    Database database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        try {
          createBookTable(db);
          createNoteTable(db);

        } on Exception catch (e) {
          print(e);
        }
      },
    );
    return database;
  }

  createBookTable(Database db) {
    db.execute('''CREATE TABLE $bookTable(
    $bookTableId INTEGER PRIMARY KEY AUTOINCREMENT,
    $bookTableImageUrl TEXT NOT NULL,
    $bookTableTitle TEXT NOT NULL)''');
  }

  createNoteTable(Database db) {
    db.execute('''CREATE TABLE $noteTable(
    $noteTableId INTEGER PRIMARY KEY AUTOINCREMENT,
    $noteTableColor INTEGER NOT NULL,
    $noteTableTitle TEXT NOT NULL,
    $noteTableDesc TEXT NOT NULL,
    $noteTableBookId INTEGER NOT NULL)''');
  }

  insertNewBook(Book book) async {
    try {
      int result = await database.insert(
        bookTable,
        book.toMap(),
      );
      print(result);
    } on Exception catch (e) {
      print(e);
    }
  }

  insertNewNote(Note note) async {
    try {
      int result = await database.insert(
        noteTable,
        note.toMap(),
      );
      print(result);
    } on Exception catch (e) {
      print(e);
    }
  }

  deleteBook(int id) async {
    try {
      int result = await database
          .delete(bookTable, where: '$bookTableId=?', whereArgs: [id]);
    } on Exception catch (e) {
      print(e);
    }
  }

  deleteNote(int id) async {
    try {
      int result = await database
          .delete(noteTable, where: '$noteTableId=?', whereArgs: [id]);
    } on Exception catch (e) {
      print(e);
    }
  }

  deleteAllNotes(int id) async {
    try {
      int result = await database
          .delete(noteTable, where: '$noteTableBookId=?', whereArgs: [id]);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>> getAllBook() async {
    try {
      List<Map<String, dynamic>> allRows = await database.query(bookTable);
      return allRows;
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>> getAllNote() async {
    try {
      List<Map<String, dynamic>> allRows = await database.query(noteTable);
      return allRows;
    } on Exception catch (e) {
      print(e);
    }
  }
}
