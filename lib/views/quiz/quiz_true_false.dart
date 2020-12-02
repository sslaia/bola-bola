import 'question.dart';

class QuizTrueFalse {
  int _questionNumber = 0;

  List<Question> _quizTrueFalse = [
    Question(
        questionText:
            'Fanura döi mbanua si faudu (lafasahe wanura): Lölöwa\'u, Tundrumbaho, Hili\'ana\'a',
        questionAnswer: true),
    Question(
        questionText:
            'Fanura döi mbanua si faudu (lafasafi wanura): Lölö wa\'u, Tundru mbaho, Hili ana\'a',
        questionAnswer: false),
    Question(
        questionText: 'Atulö wanura fehede andre: No ibadu amagu nidanö mbanio',
        questionAnswer: true),
    Question(
        questionText: 'Atulö wanura fehede andre: No ibadu amagu idanö mbanio',
        questionAnswer: false),
    Question(
        questionText: 'Atulö wanura fehede andre: No ibadu namagu idanö mbanio',
        questionAnswer: false),
  ];

  void nextQuestion() {
    if (_questionNumber < _quizTrueFalse.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _quizTrueFalse[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _quizTrueFalse[_questionNumber].questionAnswer;
  }

  // show the end of the quiz and the possibility to restart the quiz
  bool isFinished() {
    if (_questionNumber >= _quizTrueFalse.length - 1) {
      print('the end of the quiz');
      return true;
    } else {
      print('next question please');
      return false;
    }
  }

  // reset method that sets the questionNumber back to 0 and restart the quiz
  void reset() {
    _questionNumber = 0;
  }
}
