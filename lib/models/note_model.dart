import 'package:flutter/material.dart';
import 'package:note_book/helpers/db_helper.dart';

class Note {
  int id;
  int color;
  String noteTitle;
  String description;
  int bookId;

  Note({
    this.id,
    this.noteTitle,
    this.color,
    this.description,
    this.bookId,
  });

  Note.fromMap(Map map) {
    this.id = map[DBHelper.noteTableId];
    this.noteTitle = map[DBHelper.noteTableTitle];
    this.color = map[DBHelper.noteTableColor];
    this.description = map[DBHelper.noteTableDesc];
    this.bookId = map[DBHelper.noteTableBookId];
  }

  Map<String, dynamic> toMap() {
    return {
      DBHelper.noteTableTitle: this.noteTitle,
      DBHelper.noteTableColor: this.color,
      DBHelper.noteTableDesc: this.description,
      DBHelper.noteTableBookId: this.bookId,
    };
  }
}
