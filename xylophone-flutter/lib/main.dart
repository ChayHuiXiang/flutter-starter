import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playsound(int buttonNo) {
    final player = AudioCache();
    player.play('note$buttonNo.wav');
  }

  Expanded buildKey(int buttonNo, Color buttonColor) =>
    Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
          shape: MaterialStateProperty.all(const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)))),
        ),
        onPressed: () =>
          playsound(buttonNo),
      ),
    );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildKey(1, Colors.red),
                  buildKey(2, Colors.orange),
                  buildKey(3, Colors.yellow),
                  buildKey(4, Colors.green),
                  buildKey(5, Colors.teal),
                  buildKey(6, Colors.blue),
                  buildKey(7, Colors.purple),
        ])),
      ),
    );
  }
}
