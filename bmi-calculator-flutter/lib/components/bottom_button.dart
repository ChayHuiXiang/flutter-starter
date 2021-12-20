import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;

  BottomButton({@required this.onTap,@required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
              buttonText,
              style: kLargeButtonTextStyle,
            )),
        color: kBottomContainerColour,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom:20.0),
        height: kBottomContainerHeight,
      ),
    );
  }
}