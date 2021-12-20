import 'dart:math';

class CalculatorBrain {

  int height;
  int weight;
  double _bmi;

  CalculatorBrain({this.height,this.weight}){
    _bmi = weight/pow(height/100,2);
  }

  String calculateBMI(){
    return _bmi.toStringAsFixed(1);
  }

  Map<String,String> getResult(){
    if (_bmi >= 25){
      return {
        'Result':'Overweight',
        'Interpretation':'You have a higher than normal body weight. Try to exercise more.'
      };
    } else if (_bmi >= 18.5){
      return {
        'Result':'Normal',
        'Interpretation':'You have a normal body weight. Good job!',
      };
    } else {
      return {
        'Result':'Underweight',
        'Interpretation':'You have a lower than normal body weight. You can eat a bit more.',
      };
    }
  }

}