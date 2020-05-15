import 'package:flutter/material.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/routes.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      widgets: <Widget>[
        MenuBar(),
        ListItem(
          imageUrl: null,
          title: "listItemTitleText",
          description: "listItemPreviewText",
          dest: Routes.vacancy,
        ),
      ],
    );
  }
}