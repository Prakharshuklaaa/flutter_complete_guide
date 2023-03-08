import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;

    if (resultScore <= 60) {
      resultText = "Highly Stressed";
    } else if (resultScore <= 40) {
      resultText = "Mild Stress";
    } else if (resultScore <= 20) {
      resultText = "Stress Free";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text('Restart Quiz!', style: TextStyle(fontSize: 25)),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
