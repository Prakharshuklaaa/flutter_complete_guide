import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;
  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          answerText,
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        // how to access the questionIndex and
        // questions which are on main.dart
        onPressed: selectHandler,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromRGBO(58, 71, 71, 0.494)),
        ),
      ),
    );
  }
}
