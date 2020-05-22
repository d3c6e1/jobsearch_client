import 'package:flutter/material.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/utils/utils.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      widgets: <Widget>[
        MenuBar(),
        ListItem(
          imageUrl: null,
          title: context.watch<User>() != null ? context.watch<User>().asMap().toString()
          : 'context.watch<Client>().currentUser',
          description: "listItemPreviewText",
          dest: Routes.vacancy,
        ),
      ],
    );
  }
}