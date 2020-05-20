import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  final List<Widget> widgets;

  const MainScaffold({Key key, this.widgets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                  children: widgets
              ),
            ),
          )
        ],
      ),
    );
  }
}