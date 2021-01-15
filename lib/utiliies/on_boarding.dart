import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:note_book/providers/book_provider.dart';
import 'package:note_book/providers/note_provider.dart';
import 'package:note_book/screens/home_page.dart';
import 'package:provider/provider.dart';

import 'button_widget.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => MyHomePage()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset(
        'assets/images/$assetName.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    Provider.of<BookProvider>(context, listen: false).getAllBook();
    Provider.of<NoteProvider>(context, listen: false).getAllNote();

    const bodyStyle = TextStyle(
      fontSize: 18,
      color: Colors.grey,
    );
    const titleStyle = TextStyle(
      fontSize: 25,
      color: Color(0xff7B1E58),
    );
    const pageDecoration = const PageDecoration(
      titlePadding: EdgeInsets.only(top: 60.0),
      titleTextStyle: titleStyle,
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.only(top: 40.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Notebooks",
          body: "Notebooks are the best place to manage your Notes ",
          image: _buildImage('tutorial'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Add Notes to Notebook",
          body: "Simply create your note and add it to your favorite notebook",
          image: _buildImage('tutorial2'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: ButtonWidget(
        title: 'Next',
      ),

      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
