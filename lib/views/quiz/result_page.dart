import 'package:bola_bola/views/home_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: ResultPageWidget(),
        ),
      ),
    );
  }
}

class ResultPageWidget extends StatefulWidget {
  @override
  _ResultPageWidgetState createState() => _ResultPageWidgetState();
}

class _ResultPageWidgetState extends State<ResultPageWidget> {
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
              child: Text('Congratulation.\nYo\'ve completed the quiz.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0, color: Colors.white)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                color: Colors.white,
                child: Text(
                  'Restart',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => QuizPage()));
                },
              ),
              FlatButton(
                color: Colors.white,
                child: Text(
                  'Close',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black54,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200.0,
        ),
      ],
    );
  }
}
