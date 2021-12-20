import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<Map<String, Object>> questions;
  final int index;

  Quiz(@required this.answerQuestion,@required this.questions,@required this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[index]['questionText']),
        ...(questions[index]['answers'] as List<String>).map((answer) {
          return Answer(selectHandler, answer);
        }).toList(),
      ],
    );
  }
}
