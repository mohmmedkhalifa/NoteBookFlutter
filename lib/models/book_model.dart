import 'package:note_book/helpers/db_helper.dart';
import 'package:note_book/models/note_model.dart';

class Book {
  int id;
  String title;
  String imageUrl;
  List<Note> notes;

  Book({
    this.id,
    this.imageUrl,
    this.title,
    this.notes,
  });

  Book.fromMap(Map map) {
    this.id = map[DBHelper.bookTableId];
    this.imageUrl = map[DBHelper.bookTableImageUrl];
    this.title = map[DBHelper.bookTableTitle];
  }

  Map<String, dynamic> toMap() {
    return {
      DBHelper.bookTableImageUrl: this.imageUrl,
      DBHelper.bookTableTitle: this.title,
    };
  }
}
