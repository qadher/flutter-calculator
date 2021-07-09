import 'package:calculator/calculatorButton.dart';
import 'package:calculator/calculatorIconButton.dart';
import 'package:calculator/custom_icon_icons.dart';
import 'package:calculator/equalToButton.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _history = '';
  String _expression = '';

  void numClick(String text){
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text){
    setState(() {
      _expression = '';
      _history = '';
    });
  }

  void clear(String text){
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text){

    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                _history,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 24,
                  color: Colors.black54,
                ),
              ),
              alignment: Alignment(1, 1),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                _expression,
                //TODO
                //maxLines: 1,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 48,
                  color: Colors.black,
                ),
              ),
              alignment: Alignment(1, 1),
            ),
            Divider(thickness: 1, indent: 30,endIndent: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                normalButton(buttonText: 'AC', textColor: Colors.deepOrangeAccent, callback: allClear,),
                CalculatorIconButton(buttonIcon: Icon(Icons.backspace), text: 'C', callback: clear,),
                CalculatorIconButton(buttonIcon: Icon(CustomIcon.percent, size: 20,), callback: numClick, text: '%',),
                CalculatorIconButton(buttonIcon: Icon(CustomIcon.divide, size: 24,), callback: numClick, text: '/',),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                normalButton(buttonText: '7', callback: numClick),
                normalButton(buttonText: '8', callback: numClick),
                normalButton(buttonText: '9', callback: numClick),
                CalculatorIconButton(buttonIcon: Icon(CustomIcon.cancel, size: 24,), callback: numClick, text: '*',),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                normalButton(buttonText: '4', callback: numClick),
                normalButton(buttonText: '5', callback: numClick),
                normalButton(buttonText: '6', callback: numClick),
                CalculatorIconButton(buttonIcon: Icon(CustomIcon.minus, size: 24,), callback: numClick, text: '-',)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                normalButton(buttonText: '1', callback: numClick),
                normalButton(buttonText: '2', callback: numClick),
                normalButton(buttonText: '3', callback: numClick),
                CalculatorIconButton(buttonIcon: Icon(Icons.add), callback: numClick, text: '+',),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                normalButton(buttonText: '00', callback: numClick),
                normalButton(buttonText: '0', callback: numClick),
                normalButton(buttonText: '.', callback: numClick),
                EqualToButton(callback: evaluate)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget normalButton({required String buttonText, Color textColor = Colors.black, required Function callback}) {
    return Container(
      child: CalculatorButton(
        text: buttonText,
        textColor: textColor,
        fillColor: Colors.white,
          callback: callback,

      ),
    );
  }

}

