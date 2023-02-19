import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;

    if (resultScore <= 20) {
      resultText = "You have unique Taste";
    } else if (resultScore <= 25) {
      resultText = "You have not so unique Taste";
    } else if (resultScore <= 30) {
      resultText = "Your Taste is very common";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
          textAlign: TextAlign.center,
        ),
        TextButton(
          child: Text('Restart Quiz!'),
          onPressed: resetHandler,
        ),
      ],
    );
  }
}
