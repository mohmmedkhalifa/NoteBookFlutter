import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_book/helpers/db_helper.dart';
import 'package:note_book/providers/book_provider.dart';
import 'package:note_book/providers/note_provider.dart';
import 'package:note_book/utiliies/Splash.dart';
import 'package:note_book/utiliies/on_boarding.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var s = await DBHelper.dbHelper.initializeTasksDatabase();
  await DBHelper.dbHelper.connectToDatabase();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');
  Widget _screen;
  if (seen == null || seen == false) {
    _screen = OnBording();
  } else {
    _screen = Splash();
  }
  runApp(MyApp(_screen));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black12,
  ));
}

class MyApp extends StatelessWidget {
  Widget _screen;

  MyApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NoteProvider>(
          create: (context) => NoteProvider(),
        ),
        ChangeNotifierProvider<BookProvider>(
          create: (context) => BookProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Note Book',
        theme: ThemeData(
          accentColor: Color(0xff7B1E58),
          textTheme: TextTheme(
            headline6: TextStyle(
              fontSize: 16,
              color: Color(0xff7B1E58),
            ),
          ),
        ),
        home:this._screen,
      ),
    );
  }
}
