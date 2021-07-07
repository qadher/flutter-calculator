import 'package:flutter/material.dart';

class CalculatorIconButton extends StatelessWidget {
  final Color textColor;
  final Color fillColor;
  final Icon buttonIcon;
  final Function callback;
  final String text;

  const CalculatorIconButton({Key? key,
    this.textColor = Colors.deepOrangeAccent,
    this.fillColor = Colors.white,
    required this.buttonIcon,
    required this.callback,
    required this.text,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: Ink(
    decoration: ShapeDecoration(
    color: fillColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),

    child:  IconButton(
           icon: buttonIcon,
        iconSize: 28,
        color: Colors.deepOrangeAccent, onPressed: () { callback(text); },
      ),
          // onPressed: () {
          //   callback(text);
          // },
        ),
      ),
      );
  }
}
