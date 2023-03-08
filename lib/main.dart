import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  // has to retrun a state object wich is connected to stateful widget
  State<StatefulWidget> createState() {
    //TODO  implement create State
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // is a generic class which will remain persistent

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  var _questions = const [
    {
      'questionText': 'Are you on any medication? ',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText': 'Were you ever evaluated clinically for stress?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText': 'Relationship problems?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText': 'Trouble with parents?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText': 'Lower grades than expected?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText':
          'In the past month, how often have you been upset because of something that happened unexpectedly?',
      'answers': [
        {'text': 'Fairly Often', 'score': 10},
        {'text': 'Very Often', 'score': 7},
        {'text': 'Sometimes', 'score': 5},
        {'text': 'Almost Never', 'score': 0},
      ],
    },
  ];

  void _answerQuestion(int score) {
    //wrapping in a set state function
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    // if (questionIndex < questions.length) {
    //   print('We have more question!');
    // } else {
    //   print('No more questions!');
    // }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Stress Calculator',
            textAlign: TextAlign.center,
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
