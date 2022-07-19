// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  //MyButton({Key? key}) : super(key: key);
  late double boxWidth;
  late Color boxColor;
  late Color textColor;
  late String text;
  late final Function() boxfunc;
  MyButton(
      {Key? key,
      required this.boxWidth,
      required this.boxColor,
      required this.text,
      required this.textColor,
      required this.boxfunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: boxWidth,
      margin: const EdgeInsets.only(right: 20.0, top: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
        color: boxColor,
      ),
      child: TextButton(
          onPressed: boxfunc,
          child: Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 20.0, fontWeight: FontWeight.w600),
          )),
    );
  }
}
