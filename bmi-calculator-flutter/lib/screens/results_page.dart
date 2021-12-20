import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class ResultsPage extends StatelessWidget {
  final CalculatorBrain calculatorBrain;

  ResultsPage({this.calculatorBrain});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',
              style: kTitleTextStyle),
            )
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(calculatorBrain.getResult()['Result'],style: kResultTextStyle,
                  ),
                  Text(calculatorBrain.calculateBMI().toString(),style:kBMITextStyle),
                  Text(calculatorBrain.getResult()['Interpretation'],style:kBodyTextStyle),
                ],
              ),
            )
          ),
          BottomButton(
              onTap: (){
                Navigator.pop(context);
              },
              buttonText: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
