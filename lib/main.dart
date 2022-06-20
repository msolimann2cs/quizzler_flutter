import 'package:flutter/material.dart';
import 'package:quizzler_flutter/quiz_main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizMain quizBrain = QuizMain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> score_keeper = [];

  void AddRightAnswer() {
    if (quizBrain.getQuestionNumber() == 0) {
      score_keeper.clear();
      Alert(context: context, title: "Quiz End", desc: "Restarting the quiz")
          .show();
    }
    setState(() {
      score_keeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
      quizBrain.nextQuestion();
    });
  }

  void AddWrongAnswer() {
    if (quizBrain.getQuestionNumber() == 0) {
      score_keeper.clear();
      Alert(context: context, title: "Quiz End", desc: "Restarting the quiz")
          .show();
    }
    setState(() {
      score_keeper.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
      quizBrain.nextQuestion();
    });
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
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correct_answer = quizBrain.getQuestionAnswer();
                if (correct_answer == true) {
                  AddRightAnswer();
                } else {
                  AddWrongAnswer();
                }
                // setState(() {
                //   score_keeper.add(Icon(
                //     Icons.check,
                //     color: Colors.green,
                //   ));
                //   question_index++;
                // });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correct_answer = quizBrain.getQuestionAnswer();
                if (correct_answer == false) {
                  AddRightAnswer();
                } else {
                  AddWrongAnswer();
                }
              },
            ),
          ),
        ),
        Row(
          children: score_keeper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
