import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          title: Center(
            child:Text('I Am Poor'),
          ),
        ),
        backgroundColor: Colors.cyan,
        body: Center(
          child: Image(
            image: AssetImage(
                'images/icons8-coal-80.png'
            ),
          )
        ),
      ),
    ),
  );
}