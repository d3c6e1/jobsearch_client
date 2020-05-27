import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget{
  final Color color;

  DividerLine({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: EdgeInsets.only(bottom: 30),
      color: color ?? Color(0xFFEEEEEE),
    );
  }
}

const Widget divider = Divider(color: Color(0xFFEEEEEE), thickness: 1.0);