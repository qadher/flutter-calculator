import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color fillColor;
  final double textSize;
  final Function callback;

  const CalculatorButton({Key? key,
    this.text = '',
    this.textColor = Colors.black,
    this.fillColor = Colors.white,
    this.textSize = 28,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(fillColor),
              overlayColor: MaterialStateProperty.all(Colors.grey[50]),
              // animationDuration: Duration(seconds: 70),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ))),
          onPressed: () {
            callback(text);
          },
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: textSize,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
