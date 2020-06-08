import 'package:flutter/material.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/model/model.dart';
import 'package:provider/provider.dart';

class CreateResumePage extends StatefulWidget{
  static const String ROUTE = '/my/resumes/create';

  @override
  State<StatefulWidget> createState() => _CreateResumePageState();
}

class _CreateResumePageState extends State<CreateResumePage>{

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      children: [
        MenuBar(),
        SizedBox(
          height: 20.0,
        ),
        _form(context),
        divider,
        Footer(),
      ],
    );
  }
}

Widget _form(BuildContext context){
  CV _createdCV;
  CVData _data;

  return Column(

  );
}

Widget _paragraph(String text){
  return BasePageHeader(
    title: text,
  );
}