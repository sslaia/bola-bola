import 'package:flutter/material.dart';

import 'quiz_true_false.dart';
import 'result_page.dart';

// This is more a demo of what could be done with quiz
// TODO: to develop various quiz types

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Dahö-dahö',
          style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPageWidget(),
        ),
      ),
    );
  }
}

class QuizPageWidget extends StatefulWidget {
  @override
  _QuizPageWidgetState createState() => _QuizPageWidgetState();
}

class _QuizPageWidgetState extends State<QuizPageWidget> {
  QuizTrueFalse quiz = QuizTrueFalse();

  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quiz.getCorrectAnswer();

    setState(() {
      //First check if we've reached the end of the quiz.
      if (quiz.isFinished() == true) {
        quiz.reset();
        scoreKeeper = [];
        Navigator.of(context).push(_createRoute());
      }
      //update the scorekeeper and go to the next question
      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quiz.nextQuestion();
      }
    });
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ResultPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.indigo),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              FlatButton(
                color: Colors.red,
                child: Text(
                  'Sala',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                onPressed: () {
                  //The user picked false.
                  checkAnswer(false);
                },
              ),
              Spacer(),
              FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  'Atulö',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                onPressed: () {
                  //The user picked true.
                  checkAnswer(true);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: scoreKeeper,
          ),
        )
      ],
    );
  }
}
