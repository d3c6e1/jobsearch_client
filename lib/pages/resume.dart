import 'package:flutter/material.dart';
import 'package:jobsearch_client/components/components.dart';

class ResumePage extends StatefulWidget{
  static const route = '/resume';
  final int id;

  const ResumePage({Key key, this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage>{
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      widgets: [
        MenuBar(),
        SizedBox(
          height: 20,
        ),
        divider,
        Footer(),
      ],
    );
  }

}