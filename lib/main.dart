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
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 9},
        {'text': 'White', 'score': 5},
      ],
    },
    {
      'questionText': 'What\s your favourite animal?',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 7},
        {'text': 'Rabbit', 'score': 9},
        {'text': 'Mouse', 'score': 5},
      ],
    },
    {
      'questionText': 'Who\'s your favourite dish',
      'answers': [
        {'text': 'chole bhatura', 'score': 10},
        {'text': 'Dosa', 'score': 7},
        {'text': 'Veg roll', 'score': 9},
        {'text': 'idli', 'score': 5},
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
            'My First App',
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
