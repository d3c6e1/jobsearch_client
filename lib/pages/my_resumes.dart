import 'package:flutter/material.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/model/model.dart';
import 'package:provider/provider.dart';

class MyResumesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyResumesPageState();
}

class _MyResumesPageState extends State<MyResumesPage>{
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      widgets: [
        MenuBar(),
        SizedBox(
          height: 20,
        ),
        _MyResumesHeader(),
        divider,
        _MyResumes(),
        divider,
        Footer(),
      ],
    );
  }
}

class _MyResumes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
//    return context.watch<User>() != null && context.select((User u) => u.cvs.isNotEmpty) ?
//        _ResumesList() :
//        CreateResumeSection();
  }
}

class _ResumesList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _MyResumesHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BasePageHeader(
      title: 'My resumes',
    );
  }
}