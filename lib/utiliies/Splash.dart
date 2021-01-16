import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_book/providers/book_provider.dart';
import 'package:note_book/providers/note_provider.dart';
import 'package:note_book/screens/home_page.dart';
import 'package:provider/provider.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    Future.delayed(Duration(seconds: 2)).then((value) {
      Provider.of<BookProvider>(context, listen: false).getAllBook();
      Provider.of<NoteProvider>(context, listen: false).getAllNote();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return MyHomePage();
      }));
    });
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/splash.png')
        ),
      ),
    );
  }
}
