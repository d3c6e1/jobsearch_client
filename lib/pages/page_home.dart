import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/routes.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: <Widget>[
                  MenuBar(),
                  ListItem(
                    imageUrl: null,
                    title: "listItemTitleText",
                    description: "listItemPreviewText",
                    dest: Routes.vacancy,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}