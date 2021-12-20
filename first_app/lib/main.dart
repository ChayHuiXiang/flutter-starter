import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

const _questions = [
  {
    'questionText': 'What\'s your favourite colour?',
    'answers': [
      {'text': 'Black', 'score': '10'},
      {'text':'Red','score':'5'},
      {'text':'Green','score':'3'},
      {'text':'White'
    ],
  },
  {
    'questionText': 'What\'s your favourite animal?',
    'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
  },
  {
    'questionText': 'Who\'s your favourite instructor?',
    'answers': ['Max', 'Max', 'Max', 'Max'],
  },
];
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _index = 0;

  void _answerQuestion() {
    if (_index < _questions.length) {
      setState(() {
        _index++;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _index < _questions.length
            ? Quiz(_answerQuestion, _questions, _index)
            : Result(),
      ),
    );
  }
}
