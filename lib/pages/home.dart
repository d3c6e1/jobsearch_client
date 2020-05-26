import 'package:flutter/material.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/components/search_bar.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      widgets: <Widget>[
        MenuBar(),
        SearchBar(),
        DividerLine(),
        ResumeSection(),
        DividerLine(),

      ],
    );
  }
}