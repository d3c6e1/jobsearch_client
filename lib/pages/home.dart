import 'package:flutter/material.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/components/vacancy_search.dart';

class HomePage extends StatelessWidget{
  static const String ROUTE = '/';

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      children: <Widget>[
        MenuBar(),
        VacancySearch(
          headText: 'Try to find vacancies right now',
        ),
        divider,
        ResumeSection(),
        divider,
        InfoSection(),
        divider,
        Footer(),
      ],
    );
  }
}