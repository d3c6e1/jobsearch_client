import 'package:flutter/widgets.dart';

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