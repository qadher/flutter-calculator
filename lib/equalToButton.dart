import 'package:calculator/custom_icon_icons.dart';
import 'package:flutter/material.dart';

class EqualToButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textSize;
  final Function callback;

  const EqualToButton({
    Key? key,
    this.text = '',
    this.textColor = Colors.orangeAccent,
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
        child: Ink(
          decoration: ShapeDecoration(
              color: Colors.deepOrangeAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
          child: IconButton(
            color: Colors.white,
            // highlightColor: Colors.red,

            icon: Icon(
              CustomIcon.equals,
              size: 24,
            ),
            onPressed: () {
              callback(text);
            },

          ),
        ),
      ),
    );
  }
}
