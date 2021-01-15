import 'package:flutter/material.dart';
import 'package:note_book/helpers/db_helper.dart';
import 'package:note_book/models/book_model.dart';

class BookProvider extends ChangeNotifier {
  List<Book> books = [];

  insertIntoBookTable(Book book) async {
    await DBHelper.dbHelper.insertNewBook(book);
    getAllBook();
  }

  deleteBookFromTable(Book book) async {
    await DBHelper.dbHelper.deleteBook(book.id);
    getAllBook();
  }

  getAllBook() async {
    List<Map<String, dynamic>> rows = await DBHelper.dbHelper.getAllBook();
    List<Book> books =
        rows != null ? rows.map((e) => Book.fromMap(e)).toList() : [];
    fillLists(books);
  }

  fillLists(List<Book> books) {
    this.books = books;
    notifyListeners();
  }
}
